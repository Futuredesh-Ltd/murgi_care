import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:murgi_care/view/camera_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:camera/camera.dart';
import 'package:image_cropper/image_cropper.dart';
import '../model/multi_result.dart';
import '../services/subscription_service.dart';

enum PickImageStatus {
  success,
  limitReached,
  cancelled,
}

class DiseaseProvider extends ChangeNotifier {
  // --- Legacy single image state (kept for compatibility) ---
  File? _image;
  List<dynamic>? _outputs;

  // --- Multi-photo state ---
  List<File> _images = [];
  MultiAnalysisResult? _multiResult;

  bool _loading = false;
  Interpreter? interpreter;
  Interpreter? breedInterpreter;
  List<String>? _labels;
  List<String>? _breedLabels;
  bool _isEnglish = false;
  ThemeMode _themeMode = ThemeMode.system;

  // Getters
  ThemeMode get themeMode => _themeMode;
  bool get isEnglish => _isEnglish;

  /// Primary display image (first of multi-batch, or single)
  File? get image => _images.isNotEmpty ? _images[0] : _image;

  /// All images in the current batch
  List<File> get images => _images;

  List<dynamic>? get outputs => _outputs;
  bool get loading => _loading;
  MultiAnalysisResult? get multiResult => _multiResult;
  bool get isMultiMode => _images.isNotEmpty;
  Interpreter? get currentBreedInterpreter => breedInterpreter;
  List<String>? get breedLabels => _breedLabels;

  DiseaseProvider() {
    _loadPreferences();
    _loadModel();
  }

  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getString('app_theme_mode');
      if (savedTheme == 'dark') {
        _themeMode = ThemeMode.dark;
      } else if (savedTheme == 'light') {
        _themeMode = ThemeMode.light;
      } else if (savedTheme == 'system') {
        _themeMode = ThemeMode.system;
      }
      _isEnglish = prefs.getBool('app_is_english') ?? false;
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading SharedPreferences: $e");
    }
  }

  Future<void> _loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/model.tflite');
      final labelData = await rootBundle.loadString('assets/labels.txt');
      _labels = labelData.split('\n').where((s) => s.isNotEmpty).toList();
    } catch (e) {
      debugPrint("Error loading disease model: $e");
    }

    try {
      breedInterpreter = await Interpreter.fromAsset('assets/breed.tflite');
      final breedLabelData =
          await rootBundle.loadString('assets/breed_labels.txt');
      _breedLabels =
          breedLabelData.split('\n').where((s) => s.isNotEmpty).toList();
    } catch (e) {
      debugPrint("Error loading breed model: $e");
    }
  }

  void toggleLanguage() async {
    _isEnglish = !_isEnglish;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('app_is_english', _isEnglish);
    } catch (e) {
      debugPrint("Error saving language preference: $e");
    }
  }

  void toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'app_theme_mode', _themeMode == ThemeMode.dark ? 'dark' : 'light');
    } catch (e) {
      debugPrint("Error saving theme preference: $e");
    }
  }

  void reset() {
    _image = null;
    _images = [];
    _outputs = null;
    _multiResult = null;
    _loading = false;
    notifyListeners();
  }

  // --- Freemium Logic ---
  final SubscriptionService _subscriptionService = SubscriptionService();

  // ---------------------------------------------------------------------------
  // MULTI-PHOTO pick (camera: takes 3 in one session; gallery: pick up to 3)
  // ---------------------------------------------------------------------------

  Future<PickImageStatus> pickMultipleImages(
    ImageSource source,
    BuildContext context,
  ) async {
    // 1. Check limits — counted as ONE detection per session
    bool allowed = await _subscriptionService.canPerformDetection();
    if (!allowed) return PickImageStatus.limitReached;

    List<File> pickedFiles = [];

    if (source == ImageSource.camera) {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return PickImageStatus.cancelled;

      // CameraScanScreen now returns List<File> (3 photos)
      final result = await Navigator.push<List<File>>(
        context,
        MaterialPageRoute(
          builder: (_) =>
              CameraScanScreen(cameras: cameras, isEnglish: _isEnglish),
        ),
      );
      if (result == null || result.isEmpty) return PickImageStatus.cancelled;
      pickedFiles = result;
    } else {
      // Gallery multi-pick (max 3)
      final picker = ImagePicker();
      final List<XFile> xFiles = await picker.pickMultiImage(limit: 3);
      if (xFiles.isEmpty) return PickImageStatus.cancelled;
      // Crop each picked gallery image
      for (final xFile in xFiles.take(3)) {
        final cropped = await _cropImage(xFile.path);
        if (cropped != null) pickedFiles.add(File(cropped.path));
      }
      if (pickedFiles.isEmpty) return PickImageStatus.cancelled;
    }

    _images = pickedFiles;
    _image = pickedFiles.first;
    _loading = true;
    _outputs = null;
    _multiResult = null;
    notifyListeners();

    // 2. Run all images in parallel
    await _processImagesParallel(pickedFiles);

    // 3. Increment usage once per session for guests
    if (FirebaseAuth.instance.currentUser == null) {
      await _subscriptionService.incrementGuestCount();
    }
    return PickImageStatus.success;
  }

  // ---------------------------------------------------------------------------
  // Legacy single-image pick (kept for backward compatibility)
  // ---------------------------------------------------------------------------

  Future<PickImageStatus> pickImage(
    ImageSource source,
    BuildContext context,
  ) async {
    bool allowed = await _subscriptionService.canPerformDetection();
    if (!allowed) return PickImageStatus.limitReached;

    File? initialFile;
    if (source == ImageSource.camera) {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return PickImageStatus.cancelled;
      // Camera screen now returns List<File> — take first
      final result = await Navigator.push<List<File>>(
        context,
        MaterialPageRoute(
          builder: (_) =>
              CameraScanScreen(cameras: cameras, isEnglish: _isEnglish),
        ),
      );
      if (result == null || result.isEmpty) return PickImageStatus.cancelled;
      initialFile = result.first;
    } else {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) initialFile = File(pickedFile.path);
    }

    if (initialFile == null) return PickImageStatus.cancelled;

    final croppedFile = await _cropImage(initialFile.path);
    if (croppedFile == null) return PickImageStatus.cancelled;

    _image = File(croppedFile.path);
    _images = [];
    _loading = true;
    notifyListeners();

    await _processImage(_image!);

    if (FirebaseAuth.instance.currentUser == null) {
      await _subscriptionService.incrementGuestCount();
    }
    return PickImageStatus.success;
  }

  // ---------------------------------------------------------------------------
  // Parallel processing
  // ---------------------------------------------------------------------------

  Future<void> _processImagesParallel(List<File> files) async {
    try {
      if (interpreter == null || breedInterpreter == null) await _loadModel();

      // Run all inferences in parallel using Future.wait
      final List<Map<String, dynamic>> rawResults = await Future.wait(
        files.map((file) => _runInference(file)),
      );

      _multiResult = _aggregateResults(rawResults);
    } catch (e) {
      debugPrint("Multi-processing Error: $e");
      _multiResult = null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  /// Runs TFLite inference on a single file, returns label + confidence for both disease & breed.
  Future<Map<String, dynamic>> _runInference(File file) async {
    final imageData = await file.readAsBytes();
    img.Image? originalImage = img.decodeImage(imageData);
    if (originalImage == null) {
      return {'label': 'others', 'confidence': 0.0};
    }

    img.Image resizedImage =
        img.copyResize(originalImage, width: 224, height: 224);
    var input = Float32List(1 * 224 * 224 * 3);
    var buffer = Float32List.view(input.buffer);

    int pixelIndex = 0;
    for (var y = 0; y < 224; y++) {
      for (var x = 0; x < 224; x++) {
        var pixel = resizedImage.getPixel(x, y);
        buffer[pixelIndex++] = (pixel.r - 127.5) / 127.5;
        buffer[pixelIndex++] = (pixel.g - 127.5) / 127.5;
        buffer[pixelIndex++] = (pixel.b - 127.5) / 127.5;
      }
    }

    final reshapedInput = input.reshape([1, 224, 224, 3]);

    // 1. Disease inference
    String diseaseLabel = 'others';
    double diseaseConfidence = 0.0;
    if (interpreter != null && _labels != null && _labels!.isNotEmpty) {
      var output =
          List.filled(1 * _labels!.length, 0.0).reshape([1, _labels!.length]);
      interpreter!.run(reshapedInput, output);

      List<double> probs = List<double>.from(output[0]);
      int bestIndex = 0;
      double maxProb = -1.0;
      for (int i = 0; i < probs.length; i++) {
        if (probs[i] > maxProb) {
          maxProb = probs[i];
          bestIndex = i;
        }
      }
      diseaseLabel = _labels![bestIndex];
      diseaseConfidence = maxProb;
    }

    // 2. Breed inference
    String? breedLabel;
    double? breedConfidence;
    if (breedInterpreter != null &&
        _breedLabels != null &&
        _breedLabels!.isNotEmpty) {
      try {
        var breedOutput = List.filled(1 * _breedLabels!.length, 0.0)
            .reshape([1, _breedLabels!.length]);
        breedInterpreter!.run(reshapedInput, breedOutput);

        List<double> breedProbs = List<double>.from(breedOutput[0]);
        int bestBreedIndex = 0;
        double maxBreedProb = -1.0;
        for (int i = 0; i < breedProbs.length; i++) {
          if (breedProbs[i] > maxBreedProb) {
            maxBreedProb = breedProbs[i];
            bestBreedIndex = i;
          }
        }
        breedLabel = _breedLabels![bestBreedIndex];
        breedConfidence = maxBreedProb;
      } catch (e) {
        debugPrint("Breed inference error: $e");
      }
    }

    return {
      'label': diseaseLabel,
      'confidence': diseaseConfidence,
      'breedLabel': breedLabel,
      'breedConfidence': breedConfidence,
    };
  }

  /// Aggregates raw per-photo results into a single MultiAnalysisResult.
  MultiAnalysisResult _aggregateResults(List<Map<String, dynamic>> raw) {
    final perPhotoLabels = raw.map((r) => r['label'].toString()).toList();
    final individualResults = raw
        .map((r) => SingleResult(
              label: r['label'].toString(),
              confidence: (r['confidence'] as num?)?.toDouble() ?? 0.0,
              breedLabel: r['breedLabel']?.toString(),
              breedConfidence: (r['breedConfidence'] as num?)?.toDouble(),
            ))
        .toList();

    // Aggregate breed across photos
    SingleResult? aggregatedBreed;
    final Map<String, List<double>> breedGrouped = {};
    for (final r in raw) {
      final bLabel = r['breedLabel']?.toString();
      final bConf = (r['breedConfidence'] as num?)?.toDouble();
      if (bLabel != null && bConf != null) {
        breedGrouped.putIfAbsent(bLabel, () => []).add(bConf);
      }
    }

    if (breedGrouped.isNotEmpty) {
      final sortedBreeds = breedGrouped.entries.toList()
        ..sort((a, b) {
          int countCmp = b.value.length.compareTo(a.value.length);
          if (countCmp != 0) return countCmp;
          double avgA = a.value.reduce((x, y) => x + y) / a.value.length;
          double avgB = b.value.reduce((x, y) => x + y) / b.value.length;
          return avgB.compareTo(avgA);
        });
      final bestBreed = sortedBreeds.first;
      final avgBreedConf =
          bestBreed.value.reduce((x, y) => x + y) / bestBreed.value.length;
      aggregatedBreed = SingleResult(
        label: bestBreed.key,
        confidence: avgBreedConf,
        photoCount: bestBreed.value.length,
        breedLabel: bestBreed.key,
        breedConfidence: avgBreedConf,
      );
    }

    if (raw.length == 1) {
      // Single photo fallback
      return MultiAnalysisResult(
        type: ResultType.unanimous,
        results: [
          SingleResult(
            label: perPhotoLabels[0],
            confidence: (raw[0]['confidence'] as num?)?.toDouble() ?? 0.0,
            photoCount: 1,
            breedLabel: raw[0]['breedLabel']?.toString(),
            breedConfidence: (raw[0]['breedConfidence'] as num?)?.toDouble(),
          ),
        ],
        perPhotoLabels: perPhotoLabels,
        individualResults: individualResults,
        aggregatedBreed: aggregatedBreed,
      );
    }

    // Count frequency of each label
    final Map<String, List<double>> grouped = {};
    for (final r in raw) {
      final label = r['label'].toString();
      grouped.putIfAbsent(label, () => []);
      grouped[label]!.add((r['confidence'] as num?)?.toDouble() ?? 0.0);
    }

    // Check if all the same
    if (grouped.length == 1) {
      // Unanimous
      final label = grouped.keys.first;
      final avgConf =
          grouped[label]!.reduce((a, b) => a + b) / grouped[label]!.length;
      return MultiAnalysisResult(
        type: ResultType.unanimous,
        results: [
          SingleResult(
            label: label,
            confidence: avgConf,
            photoCount: grouped[label]!.length,
            breedLabel: aggregatedBreed?.breedLabel,
            breedConfidence: aggregatedBreed?.breedConfidence,
          ),
        ],
        perPhotoLabels: perPhotoLabels,
        individualResults: individualResults,
        aggregatedBreed: aggregatedBreed,
      );
    }

    // Check for a majority (any label appearing more than once)
    final majorityEntry = grouped.entries
        .where((e) => e.value.length > 1)
        .toList()
      ..sort((a, b) => b.value.length.compareTo(a.value.length));

    if (majorityEntry.isNotEmpty) {
      // Majority
      final winner = majorityEntry.first;
      final avgConf =
          winner.value.reduce((a, b) => a + b) / winner.value.length;
      return MultiAnalysisResult(
        type: ResultType.majority,
        results: [
          SingleResult(
            label: winner.key,
            confidence: avgConf,
            photoCount: winner.value.length,
            breedLabel: aggregatedBreed?.breedLabel,
            breedConfidence: aggregatedBreed?.breedConfidence,
          ),
        ],
        perPhotoLabels: perPhotoLabels,
        individualResults: individualResults,
        aggregatedBreed: aggregatedBreed,
      );
    }

    // Inconclusive — all different, sort by confidence descending
    final allResults = raw
        .map((r) => SingleResult(
              label: r['label'].toString(),
              confidence: (r['confidence'] as num?)?.toDouble() ?? 0.0,
              breedLabel: r['breedLabel']?.toString(),
              breedConfidence: (r['breedConfidence'] as num?)?.toDouble(),
            ))
        .toList()
      ..sort((a, b) => b.confidence.compareTo(a.confidence));

    return MultiAnalysisResult(
      type: ResultType.inconclusive,
      results: allResults,
      perPhotoLabels: perPhotoLabels,
      individualResults: individualResults,
      aggregatedBreed: aggregatedBreed,
    );
  }

  // ---------------------------------------------------------------------------
  // Cropping & Legacy single-image processing
  // ---------------------------------------------------------------------------

  Future<CroppedFile?> _cropImage(String path) async {
    return await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: _isEnglish ? 'Crop Sample' : 'ক্রপ করুন',
          toolbarColor: Colors.teal,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: _isEnglish ? 'Crop Sample' : 'ক্রপ করুন',
          aspectRatioLockEnabled: true,
        ),
      ],
    );
  }

  Future<void> _processImage(File file) async {
    try {
      if (interpreter == null || breedInterpreter == null) await _loadModel();

      final result = await _runInference(file);
      _outputs = [result];
    } catch (e) {
      debugPrint("Processing Error: $e");
      _outputs = null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    interpreter?.close();
    breedInterpreter?.close();
    super.dispose();
  }
}
