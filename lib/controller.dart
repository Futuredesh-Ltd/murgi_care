import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img; // You'll need the 'image' package

class DiseaseProvider extends ChangeNotifier {
  File? _image;
  List<dynamic>? _outputs;
  bool _loading = false;
  Interpreter? _interpreter;
  List<String>? _labels;

  bool _isEnglish = false;
  bool get isEnglish => _isEnglish;
  File? get image => _image;
  List<dynamic>? get outputs => _outputs;
  bool get loading => _loading;

  DiseaseProvider() {
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      // 1. Load the Interpreter
      _interpreter = await Interpreter.fromAsset('assets/model.tflite');
      // 2. Load Labels from assets
      final labelData = await rootBundle.loadString('assets/labels.txt');
      _labels = labelData.split('\n').where((s) => s.isNotEmpty).toList();

      debugPrint("Model and Labels loaded successfully");
    } catch (e) {
      debugPrint("Error loading model: $e");
    }
  }

  void toggleLanguage() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }

  void reset() {
    _image = null;
    _outputs = null;
    _loading = false;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return;

    _image = File(pickedFile.path);
    _loading = true;
    notifyListeners();

    await _processImage(_image!);
  }

  Future<void> _processImage(File file) async {
    if (_interpreter == null) return;

    // 1. Read and decode image
    final imageData = await file.readAsBytes();
    img.Image? originalImage = img.decodeImage(imageData);
    if (originalImage == null) return;

    // 2. Pre-process: Resize to 224x224 (Standard for Teachable Machine)
    img.Image resizedImage = img.copyResize(
      originalImage,
      width: 224,
      height: 224,
    );

    // 3. Normalize: Convert to Float32 and scale (This replaces the missing Metadata)
    // Range: -1.0 to 1.0 (matching 127.5 mean/std)
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

    // 4. Prepare output buffer
    // Assuming model has 1 output tensor with shape [1, num_classes]
    var output = List.filled(
      1 * _labels!.length,
      0.0,
    ).reshape([1, _labels!.length]);

    // 5. Run Inference
    _interpreter!.run(input.reshape([1, 224, 224, 3]), output);

    // 6. Process Results
    List<double> probabilities = List<double>.from(output[0]);
    int bestIndex = 0;
    double maxProb = -1.0;
    for (int i = 0; i < probabilities.length; i++) {
      if (probabilities[i] > maxProb) {
        maxProb = probabilities[i];
        bestIndex = i;
      }
    }

    // Set output in a format your UI understands
    _outputs = [
      {'label': _labels![bestIndex], 'confidence': maxProb},
    ];

    _loading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _interpreter?.close();
    super.dispose();
  }
}
