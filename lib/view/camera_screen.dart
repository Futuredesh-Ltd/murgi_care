// ignore_for_file: deprecated_member_use

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import '../controller/riverpod_providers.dart';

class CameraScanScreen extends ConsumerStatefulWidget {
  final List<CameraDescription> cameras;
  final bool isEnglish;
  const CameraScanScreen({
    super.key,
    required this.cameras,
    required this.isEnglish,
  });

  @override
  ConsumerState<CameraScanScreen> createState() => _CameraScanScreenState();
}

class _CameraScanScreenState extends ConsumerState<CameraScanScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takeAndCropPicture() async {
    final cameraState = ref.read(cameraScanProvider);
    if (cameraState.isTaking || cameraState.capturedPhotos.length >= 3) return;

    ref.read(cameraScanProvider.notifier).setIsTaking(true);

    try {
      await _initializeControllerFuture;
      final XFile photo = await _controller.takePicture();

      final bytes = await File(photo.path).readAsBytes();
      img.Image? original = img.decodeImage(bytes);

      if (original != null) {
        // Precise square crop from center
        int size = original.width < original.height
            ? original.width
            : original.height;
        int x = (original.width - size) ~/ 2;
        int y = (original.height - size) ~/ 2;

        img.Image cropped = img.copyCrop(
          original,
          x: x,
          y: y,
          width: size,
          height: size,
        );

        final croppedFile =
            File(photo.path)..writeAsBytesSync(img.encodeJpg(cropped));

        ref.read(cameraScanProvider.notifier).addPhoto(croppedFile);
        final currentCount = ref.read(cameraScanProvider).capturedPhotos.length;

        if (currentCount == 3) {
          if (mounted) {
            final photos = ref.read(cameraScanProvider).capturedPhotos;
            Navigator.pop(context, photos);
          }
        }
      }
    } catch (e) {
      debugPrint("Camera error: $e");
    } finally {
      if (mounted) {
        ref.read(cameraScanProvider.notifier).setIsTaking(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraScanProvider);
    final capturedPhotos = cameraState.capturedPhotos;
    final isTaking = cameraState.isTaking;

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                // 1. Live Camera Preview
                Positioned.fill(child: CameraPreview(_controller)),

                // 2. Dark Mask Overlay with "Hole"
                Positioned.fill(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.srcOut,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            backgroundBlendMode: BlendMode.dstOut,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Teal Border
                Center(
                  child: Container(
                    width: 252,
                    height: 252,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                // 4. Header Info
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        widget.isEnglish
                            ? "Step ${capturedPhotos.length + 1} of 3"
                            : "ধাপ ${capturedPhotos.length + 1} / ৩",
                        style: const TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.isEnglish
                            ? "Center Sample in Box"
                            : "বক্সের মাঝখানে ছবি রাখুন",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // 5. Thumbnails Strip
                Positioned(
                  bottom: 160,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      bool hasPhoto = index < capturedPhotos.length;
                      return Container(
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: hasPhoto ? Colors.teal : Colors.white24,
                            width: 2,
                          ),
                        ),
                        child: hasPhoto
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.file(
                                  capturedPhotos[index],
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.photo_camera_outlined,
                                color: Colors.white.withOpacity(0.2),
                              ),
                      );
                    }),
                  ),
                ),

                // 6. Capture Button
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: isTaking ? null : _takeAndCropPicture,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: isTaking
                            ? const SizedBox(
                                width: 75,
                                height: 75,
                                child: CircularProgressIndicator(
                                  color: Colors.teal,
                                  strokeWidth: 6,
                                ),
                              )
                            : const Icon(
                                Icons.circle,
                                size: 75,
                                color: Colors.teal,
                              ),
                      ),
                    ),
                  ),
                ),

                // Back Button
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.teal),
            );
          }
        },
      ),
    );
  }
}
