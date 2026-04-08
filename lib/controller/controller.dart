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
import '../services/subscription_service.dart';

enum PickImageStatus {
  success,
  limitReached,
  cancelled,
}

class DiseaseProvider extends ChangeNotifier {
  File? _image;
  List<dynamic>? _outputs;
  bool _loading = false;
  Interpreter? interpreter;
  List<String>? _labels;
  bool _isEnglish = false;
  ThemeMode _themeMode = ThemeMode.system;

  // Getters
  ThemeMode get themeMode => _themeMode;
  bool get isEnglish => _isEnglish;
  File? get image => _image;
  List<dynamic>? get outputs => _outputs;
  bool get loading => _loading;

  DiseaseProvider() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/model.tflite');
      final labelData = await rootBundle.loadString('assets/labels.txt');
      _labels = labelData.split('\n').where((s) => s.isNotEmpty).toList();
    } catch (e) {
      debugPrint("Error loading model: $e");
    }
  }

  void toggleLanguage() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void reset() {
    _image = null;
    _outputs = null;
    _loading = false;
    notifyListeners();
  }

  // --- Freemium Logic ---

  final SubscriptionService _subscriptionService = SubscriptionService();


  // --- Main Pick Image Logic (Updated with Gatekeeper) ---

  Future<PickImageStatus> pickImage(ImageSource source, BuildContext context) async {
    // 1. Check Permissions/Limits first
    bool allowed = await _subscriptionService.canPerformDetection();
    if (!allowed) {
      return PickImageStatus.limitReached;
    }

    File? initialFile;
    if (source == ImageSource.camera) {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return PickImageStatus.cancelled;
      initialFile = await Navigator.push<File>(
        context,
        MaterialPageRoute(
          builder: (_) =>
              CameraScanScreen(cameras: cameras, isEnglish: _isEnglish),
        ),
      );
    } else {
      final picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) initialFile = File(pickedFile.path);
    }

    if (initialFile == null) return PickImageStatus.cancelled;

    final croppedFile = await _cropImage(initialFile.path);
    if (croppedFile == null) return PickImageStatus.cancelled;

    _image = File(croppedFile.path);
    _loading = true;
    notifyListeners();

    await _processImage(_image!);

    // 2. If detection was successful and user is guest, increment count
    if (FirebaseAuth.instance.currentUser == null) {
      await _subscriptionService.incrementGuestCount();
    }
    return PickImageStatus.success;
  }

  // --- Cropping & Processing Logic ---

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
      if (interpreter == null) await _loadModel();

      final imageData = await file.readAsBytes();
      img.Image? originalImage = img.decodeImage(imageData);
      if (originalImage == null) return;

      img.Image resizedImage = img.copyResize(
        originalImage,
        width: 224,
        height: 224,
      );
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

      var output = List.filled(
        1 * _labels!.length,
        0.0,
      ).reshape([1, _labels!.length]);
      interpreter!.run(input.reshape([1, 224, 224, 3]), output);

      List<double> probabilities = List<double>.from(output[0]);
      int bestIndex = 0;
      double maxProb = -1.0;
      for (int i = 0; i < probabilities.length; i++) {
        if (probabilities[i] > maxProb) {
          maxProb = probabilities[i];
          bestIndex = i;
        }
      }

      _outputs = [
        {'label': _labels![bestIndex], 'confidence': maxProb},
      ];
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
    super.dispose();
  }
}
