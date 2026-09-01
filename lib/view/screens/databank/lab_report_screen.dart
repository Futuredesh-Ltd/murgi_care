import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';

class LabReportScreen extends ConsumerWidget {
  final bool isEnglish;

  const LabReportScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = isEnglish;
    final state = ref.watch(labReportProvider);
    final notifier = ref.read(labReportProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEng ? "Post-Mortem & Lab Reports" : "পোস্টমর্টেম ও ল্যাব রিপোর্ট"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: state.isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.teal),
                  SizedBox(height: 12),
                  Text("Syncing photos to Cloud Database..."),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Flock Selector
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isEng ? "Select Flock" : "ফ্লক নির্বাচন করুন",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          if (state.flocks.isEmpty)
                            Text(
                              isEng ? "No active flock found." : "কোনো সক্রিয় ফ্লক পাওয়া যায়নি।",
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          else
                            DropdownButtonFormField<LocalFlock>(
                              initialValue: state.selectedFlock,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                              items: state.flocks
                                  .map((f) => DropdownMenuItem(
                                        value: f,
                                        child: Text("${f.name} (${f.birdType})"),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  notifier.selectFlock(val);
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (state.selectedFlock != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isEng ? "Lab & Disease Reports" : "ল্যাব ও পোস্টমর্টেম রিপোর্ট",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _showAddReportDialog(context, ref, state.selectedFlock!),
                          icon: const Icon(Icons.add_a_photo_outlined, size: 18),
                          label: Text(isEng ? "New Report" : "রিপোর্ট ও ছবি যোগ"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Expanded(
                      child: state.reports.isEmpty
                          ? Center(
                              child: Text(
                                isEng ? "No lab reports added for this flock." : "এই ফ্লকের কোনো ল্যাব রিপোর্ট সংরক্ষিত নেই।",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.reports.length,
                              itemBuilder: (context, index) {
                                final r = state.reports[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Chip(
                                              label: Text(
                                                r.testType,
                                                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                              ),
                                              backgroundColor: Colors.teal.shade700,
                                              padding: EdgeInsets.zero,
                                            ),
                                            Text(
                                              "${r.date.day}/${r.date.month}/${r.date.year}",
                                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${isEng ? 'Sample Organs' : 'নমুনা অঙ্গ'}: ${r.sampleName}",
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${isEng ? 'Findings' : 'পোস্টমর্টেম লক্ষণ/ফলাফল'}: ${r.findings}",
                                          style: TextStyle(color: Colors.grey[800], fontSize: 13),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${isEng ? 'Diagnosis' : 'শনাক্তকৃত রোগ'}: ${r.diagnosis}",
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 13),
                                        ),
                                        if (r.recommendation.isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Text(
                                            "${isEng ? 'Recommendation' : 'পরামর্শ'}: ${r.recommendation}",
                                            style: const TextStyle(color: Colors.teal, fontSize: 12),
                                          ),
                                        ],

                                        // Photo Gallery Grid if any photos attached
                                        if (r.imageUrls.isNotEmpty) ...[
                                          const SizedBox(height: 10),
                                          Text(
                                            "${isEng ? 'Attached Photos' : 'সংযুক্ত ছবিসমূহ'} (${r.imageUrls.length}):",
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
                                          ),
                                          const SizedBox(height: 6),
                                          SizedBox(
                                            height: 80,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: r.imageUrls.length,
                                              itemBuilder: (ctx, pIdx) {
                                                final imgPath = r.imageUrls[pIdx];
                                                final bool isNetwork = imgPath.startsWith('http');

                                                return GestureDetector(
                                                  onTap: () => _showFullImageDialog(context, imgPath),
                                                  child: Container(
                                                    margin: const EdgeInsets.only(right: 8),
                                                    width: 80,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      border: Border.all(color: Colors.teal.shade200),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: isNetwork
                                                          ? CachedNetworkImage(
                                                              imageUrl: imgPath,
                                                              fit: BoxFit.cover,
                                                              placeholder: (context, url) => Container(
                                                                color: Colors.grey[200],
                                                                child: const Icon(Icons.image, color: Colors.grey),
                                                              ),
                                                              errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                                                            )
                                                          : Image.file(
                                                              File(imgPath),
                                                              fit: BoxFit.cover,
                                                              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                                                            ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],

                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                            icon: const Icon(Icons.delete_outline, color: Colors.grey, size: 20),
                                            onPressed: () => notifier.deleteReport(r.id),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ],
              ),
            ),
    );
  }

  void _showAddReportDialog(BuildContext context, WidgetRef ref, LocalFlock selectedFlock) {
    showDialog(
      context: context,
      builder: (ctx) => _AddLabReportDialog(
        isEnglish: isEnglish,
        selectedFlock: selectedFlock,
        onSave: (report, imageFiles) {
          ref.read(labReportProvider.notifier).addReportWithPhotos(report, imageFiles);
        },
      ),
    );
  }

  void _showFullImageDialog(BuildContext context, String path) {
    final bool isNetwork = path.startsWith('http');

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            InteractiveViewer(
              child: Center(
                child: isNetwork
                    ? CachedNetworkImage(
                        imageUrl: path,
                        placeholder: (_, __) => const CircularProgressIndicator(color: Colors.teal),
                        errorWidget: (_, __, ___) => const Icon(Icons.broken_image, color: Colors.white, size: 48),
                      )
                    : Image.file(File(path)),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

// Dedicated StatefulWidget for the Add Report Dialog to safely handle async ImagePicker
class _AddLabReportDialog extends StatefulWidget {
  final bool isEnglish;
  final LocalFlock selectedFlock;
  final Function(LocalLabReport report, List<File> imageFiles) onSave;

  const _AddLabReportDialog({
    required this.isEnglish,
    required this.selectedFlock,
    required this.onSave,
  });

  @override
  State<_AddLabReportDialog> createState() => _AddLabReportDialogState();
}

class _AddLabReportDialogState extends State<_AddLabReportDialog> {
  final sampleCtrl = TextEditingController();
  final findingsCtrl = TextEditingController();
  final diagCtrl = TextEditingController();
  final recCtrl = TextEditingController();
  final customTestTypeCtrl = TextEditingController();
  String testType = 'Post-Mortem Autopsy';
  final List<File> selectedImageFiles = [];
  final ImagePicker picker = ImagePicker();

  static const String customOptionKey = 'Custom Category / নতুন ক্যাটাগরি';

  @override
  void dispose() {
    sampleCtrl.dispose();
    findingsCtrl.dispose();
    diagCtrl.dispose();
    recCtrl.dispose();
    customTestTypeCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickGalleryImages() async {
    try {
      final List<XFile> pickedFiles = await picker.pickMultiImage();
      if (!mounted) return;
      if (pickedFiles.isNotEmpty) {
        setState(() {
          selectedImageFiles.addAll(pickedFiles.map((x) => File(x.path)));
        });
      }
    } catch (e) {
      debugPrint("Error picking gallery images: $e");
    }
  }

  Future<void> _takeCameraPhoto() async {
    try {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if (!mounted) return;
      if (photo != null) {
        setState(() {
          selectedImageFiles.add(File(photo.path));
        });
      }
    } catch (e) {
      debugPrint("Error taking camera photo: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;

    return AlertDialog(
      title: Text(isEng ? "New Post-Mortem / Lab Report" : "নতুন পোস্টমর্টেম ও ল্যাব রিপোর্ট"),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            DropdownButtonFormField<String>(
              initialValue: testType,
              decoration: InputDecoration(labelText: isEng ? "Test Type / Category" : "পরীক্ষার ধরন / ক্যাটাগরি"),
              items: [
                'Post-Mortem Autopsy',
                'Serology Titer',
                'PCR DNA/RNA',
                'Swab Culture Test',
                'Water Sanitation Test',
                customOptionKey,
              ].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (val) {
                if (val != null) setState(() => testType = val);
              },
            ),
            if (testType == customOptionKey) ...[
              const SizedBox(height: 8),
              TextField(
                controller: customTestTypeCtrl,
                decoration: InputDecoration(
                  labelText: isEng ? "Enter Custom Category Name" : "নতুন পরীক্ষার ধরনের নাম লিখুন",
                  hintText: isEng ? "e.g. Histopathology, Toxin Check" : "যেমন: বায়োপসি, টক্সিন টেস্ট",
                ),
              ),
            ],
            TextField(
              controller: sampleCtrl,
              decoration: InputDecoration(
                labelText: isEng ? "Sample Organs (e.g. Liver, Intestine)" : "নমুনা অঙ্গ (যেমন: কলিজা, নাড়িভুঁড়ি)",
              ),
            ),
            TextField(
              controller: findingsCtrl,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: isEng ? "Key Post-Mortem Findings" : "পোস্টমর্টেমের লক্ষণ ও পর্যবেক্ষণ",
              ),
            ),
            TextField(
              controller: diagCtrl,
              decoration: InputDecoration(
                labelText: isEng ? "Diagnosis / Disease Name" : "শনাক্তকৃত রোগের নাম",
              ),
            ),
            TextField(
              controller: recCtrl,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: isEng ? "Doctor Recommendation" : "পরামর্শ বা চিকিৎসাপত্র",
              ),
            ),
            const SizedBox(height: 12),

            // Multi-Photo Picker Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.photo_library, size: 18),
                    label: Text(isEng ? "Gallery Photos" : "গ্যালারি থেকে ছবি"),
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.teal),
                    onPressed: _pickGalleryImages,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.camera_alt, size: 18),
                    label: Text(isEng ? "Take Photo" : "ক্যামেরা ছবি"),
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.teal),
                    onPressed: _takeCameraPhoto,
                  ),
                ),
              ],
            ),

            // Preview Grid of Selected Photos
            if (selectedImageFiles.isNotEmpty) ...[
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(selectedImageFiles.length, (idx) {
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8, top: 4),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.teal),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(selectedImageFiles[idx], fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 4,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImageFiles.removeAt(idx);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.close, color: Colors.white, size: 12),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ],
        ),
      ),
    ),
    actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(isEng ? "Cancel" : "বাতিল"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          onPressed: () {
            if (sampleCtrl.text.isNotEmpty) {
              final finalCategory = (testType == customOptionKey && customTestTypeCtrl.text.trim().isNotEmpty)
                  ? customTestTypeCtrl.text.trim()
                  : testType;

              final report = LocalLabReport(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                flockId: widget.selectedFlock.id,
                date: DateTime.now(),
                testType: finalCategory,
                sampleName: sampleCtrl.text,
                findings: findingsCtrl.text,
                diagnosis: diagCtrl.text,
                recommendation: recCtrl.text,
              );

              widget.onSave(report, selectedImageFiles);
              Navigator.pop(context);
            }
          },
          child: Text(isEng ? "Save & Sync" : "সংরক্ষণ ও সিঙ্ক"),
        ),
      ],
    );
  }
}
