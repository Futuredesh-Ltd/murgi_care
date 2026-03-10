import 'dart:io';
import 'dart:math' as math; // Added for mirroring
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class InAppCameraScreen extends StatefulWidget {
  const InAppCameraScreen({super.key});

  @override
  State<InAppCameraScreen> createState() => _InAppCameraScreenState();
}

class _InAppCameraScreenState extends State<InAppCameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  int _selectedCameraIndex = 0;
  FlashMode _currentFlashMode = FlashMode.off; // Track flash state

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _onNewCameraSelected(_cameras![_selectedCameraIndex]);
    }
  }

  void _onNewCameraSelected(CameraDescription description) async {
    if (_controller != null) await _controller!.dispose();

    _controller = CameraController(
      description,
      ResolutionPreset.medium,
      enableAudio: false, // Recommended for simple photo apps
    );

    try {
      await _controller!.initialize();
      // Reset flash to off on new camera init
      await _controller!.setFlashMode(_currentFlashMode);
    } catch (e) {
      debugPrint("Camera Error: $e");
    }
    if (mounted) setState(() {});
  }

  void _toggleFlash() async {
    if (_controller == null) return;

    FlashMode newMode;
    if (_currentFlashMode == FlashMode.off) {
      newMode = FlashMode.always;
    } else if (_currentFlashMode == FlashMode.always) {
      newMode = FlashMode.auto;
    } else {
      newMode = FlashMode.off;
    }

    try {
      await _controller!.setFlashMode(newMode);
      setState(() {
        _currentFlashMode = newMode;
      });
    } catch (e) {
      debugPrint("Flash Error: $e");
    }
  }

  void _toggleCamera() {
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
    _onNewCameraSelected(_cameras![_selectedCameraIndex]);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Check if we are using the front camera
    final isFrontCamera =
        _cameras![_selectedCameraIndex].lensDirection ==
        CameraLensDirection.front;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // --- FIX: Mirroring the Selfie Preview ---
          Center(
            child: Transform(
              alignment: Alignment.center,
              transform: isFrontCamera
                  ? Matrix4.rotationY(math.pi)
                  : Matrix4.identity(),
              child: CameraPreview(_controller!),
            ),
          ),

          // Top Toolbar (Close & Flash)
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
                // Flash Button
                IconButton(
                  icon: Icon(
                    _currentFlashMode == FlashMode.always
                        ? Icons.flash_on
                        : _currentFlashMode == FlashMode.auto
                        ? Icons.flash_auto
                        : Icons.flash_off,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: _toggleFlash,
                ),
              ],
            ),
          ),

          // Bottom Controls
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Switch Camera
                  IconButton(
                    icon: const Icon(
                      Icons.flip_camera_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: _toggleCamera,
                  ),
                  // Capture Button
                  GestureDetector(
                    onTap: () async {
                      try {
                        final image = await _controller!.takePicture();
                        if (mounted) Navigator.pop(context, File(image.path));
                      } catch (e) {
                        debugPrint("Capture Error: $e");
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.white38,
                          size: 80,
                        ),
                        const Icon(Icons.circle, color: Colors.white, size: 65),
                        Icon(
                          Icons.camera_alt,
                          color: Colors.teal.shade700,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60), // Balance the flip icon
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
