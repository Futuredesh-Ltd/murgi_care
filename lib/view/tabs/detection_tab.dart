import 'package:flutter/material.dart';
import 'package:murgi_care/controller/controller.dart';
import 'package:murgi_care/model/multi_result.dart';
import 'package:murgi_care/view/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:murgi_care/model/dissease_info.dart';
import 'package:lottie/lottie.dart';
import '../widgets/animated_action_button.dart';

class DetectionTab extends StatefulWidget {
  final Future<void> Function(BuildContext, bool) showLoginDialog;

  const DetectionTab({super.key, required this.showLoginDialog});

  @override
  State<DetectionTab> createState() => _DetectionTabState();
}

class _DetectionTabState extends State<DetectionTab> {
  int? _selectedPhotoIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<DiseaseProvider>(
      builder: (context, provider, child) {
        // Reset selection if new analysis starts
        if (provider.loading || provider.image == null) {
          _selectedPhotoIndex = null;
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Display Section
              _buildImageSection(context, provider),
              const SizedBox(height: 32),

              // Result Section
              _buildResultSection(context, provider),

              const SizedBox(height: 40),

              // Action Buttons (Camera + Gallery)
              Row(
                children: [
                  Expanded(
                    child: AnimatedActionButton(
                      icon: Icons.camera_alt_rounded,
                      label: provider.isEnglish ? "Camera" : "ক্যামেরা",
                      color: Colors.teal,
                      onTap: () async {
                        final status = await provider.pickMultipleImages(
                            ImageSource.camera, context);
                        if (status == PickImageStatus.limitReached &&
                            context.mounted) {
                          widget.showLoginDialog(context, provider.isEnglish);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AnimatedActionButton(
                      icon: Icons.photo_library_rounded,
                      label: provider.isEnglish ? "Gallery" : "গ্যালারি",
                      color: Colors.indigo,
                      onTap: () async {
                        final status = await provider.pickMultipleImages(
                            ImageSource.gallery, context);
                        if (status == PickImageStatus.limitReached &&
                            context.mounted) {
                          widget.showLoginDialog(context, provider.isEnglish);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              const Divider(),
              const SizedBox(height: 16),

              // Footer Items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidgets.buildFooterItem(
                    icon: Icons.report_problem_outlined,
                    label: provider.isEnglish ? "Caution" : "সতর্কতা",
                    color: Colors.orange,
                    onTap: () => CustomWidgets.showDisclaimer(
                      context,
                      provider.isEnglish,
                    ),
                  ),
                  CustomWidgets.buildFooterItem(
                    icon: Icons.info_outline,
                    label: provider.isEnglish ? "About" : "তথ্য",
                    color: Colors.indigo,
                    onTap: () => CustomWidgets.showAboutUs(
                      context,
                      provider.isEnglish,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageSection(BuildContext context, DiseaseProvider provider) {
    if (provider.image == null && provider.images.isEmpty) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_chfe1csq.json',
              height: 120,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.add_photo_alternate_rounded,
                size: 50,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              provider.isEnglish
                  ? "No chicken image is selected"
                  : "মুরগির কোনো ছবি নির্বাচন করা হয়নি",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    final displayImage = _selectedPhotoIndex != null 
        ? provider.images[_selectedPhotoIndex!] 
        : provider.image!;

    return Column(
      children: [
        // Main Image
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(displayImage, fit: BoxFit.cover),
          ),
        ),
        if (provider.images.length > 1) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(provider.images.length, (index) {
              bool isSelected = _selectedPhotoIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedPhotoIndex == index) {
                      _selectedPhotoIndex = null; // Deselect to show summary
                    } else {
                      _selectedPhotoIndex = index;
                    }
                  });
                },
                child: Container(
                  width: 65,
                  height: 65,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? Colors.teal : Colors.transparent,
                      width: 3,
                    ),
                    boxShadow: isSelected ? [
                      BoxShadow(color: Colors.teal.withOpacity(0.3), blurRadius: 8)
                    ] : null,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.file(provider.images[index], fit: BoxFit.cover),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            provider.isEnglish 
                ? (_selectedPhotoIndex == null ? "Click an image to see individual result" : "Showing result for photo ${_selectedPhotoIndex! + 1}")
                : (_selectedPhotoIndex == null ? "ব্যক্তিগত ফলাফল দেখতে ছবিতে ক্লিক করুন" : "ফটো ${_selectedPhotoIndex! + 1} এর ফলাফল দেখানো হচ্ছে"),
            style: TextStyle(fontSize: 12, color: Colors.teal.withOpacity(0.8), fontWeight: FontWeight.w500),
          ),
        ],
      ],
    );
  }

  Widget _buildResultSection(BuildContext context, DiseaseProvider provider) {
    if (provider.loading) {
      return Column(
        children: [
          const CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.teal,
          ),
          const SizedBox(height: 16),
          Text(
            provider.isEnglish ? "Analyzing 3 photos..." : "৩টি ছবি বিশ্লেষণ করা হচ্ছে...",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );
    }

    if (provider.multiResult != null) {
      final multi = provider.multiResult!;
      
      // Determine what to show: Selected photo result OR Aggregated summary
      final resultToShow = _selectedPhotoIndex != null 
          ? multi.individualResults[_selectedPhotoIndex!]
          : multi.primary;

      final isAggregated = _selectedPhotoIndex == null;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Aggregated Status badge (only if showing summary)
          if (isAggregated) ...[
            _buildStatusBadge(context, multi, provider.isEnglish),
            const SizedBox(height: 16),
          ] else ...[
            Row(
              children: [
                const Icon(Icons.info_outline_rounded, size: 16, color: Colors.teal),
                const SizedBox(width: 8),
                Text(
                  provider.isEnglish 
                      ? "Individual Result (Photo ${_selectedPhotoIndex! + 1})" 
                      : "ব্যক্তিগত ফলাফল (ফটো ${_selectedPhotoIndex! + 1})",
                  style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => setState(() => _selectedPhotoIndex = null),
                  child: Text(provider.isEnglish ? "Show Summary" : "সারসংক্ষেপ দেখুন", style: const TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],

          // Result Cards
          if (isAggregated && multi.type == ResultType.inconclusive)
            ...multi.results.map((res) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildSingleResultCard(context, res, provider.isEnglish, isSmall: true),
                ))
          else
            _buildSingleResultCard(context, resultToShow, provider.isEnglish),

          const SizedBox(height: 24),
          // Info for the shown result
          _buildDiseaseInfo(
            context,
            resultToShow.label,
            provider.isEnglish,
          ),
        ],
      );
    }

    if (provider.outputs != null && provider.outputs!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildResultCardLegacy(context, provider.outputs![0], provider.isEnglish),
          const SizedBox(height: 24),
          _buildDiseaseInfo(
            context,
            provider.outputs![0]['label'].toString(),
            provider.isEnglish,
          ),
        ],
      );
    }

    return Center(
      child: Text(
        provider.isEnglish
            ? "Take 3 photos for higher accuracy"
            : "নির্ভুল ফলাফলের জন্য ৩টি ছবি তুলুন",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }

  // --- UI Components ---

  Widget _buildStatusBadge(BuildContext context, MultiAnalysisResult result, bool isEnglish) {
    Color color;
    String text;
    IconData icon;

    switch (result.type) {
      case ResultType.unanimous:
        color = Colors.green;
        text = isEnglish ? "High Confidence (3/3 agreed)" : "উচ্চ নিশ্চয়তা (৩/৩ মিলছে)";
        icon = Icons.verified_rounded;
        break;
      case ResultType.majority:
        color = Colors.teal;
        text = isEnglish ? "Reliable Result (2/3 agreed)" : "নির্ভরযোগ্য ফলাফল (২/৩ মিলছে)";
        icon = Icons.check_circle_rounded;
        break;
      case ResultType.inconclusive:
        color = Colors.orange;
        text = isEnglish ? "Inconclusive (Different results)" : "অস্পষ্ট ফলাফল (ভিন্ন ভিন্ন ফলাফল)";
        icon = Icons.warning_rounded;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleResultCard(BuildContext context, SingleResult result, bool isEnglish, {bool isSmall = false}) {
    String cleanId = _getCleanId(result.label);
    String formattedLabel = _formatLabel(result.label, isEnglish);
    double confidencePercent = result.confidence * 100;

    if (cleanId == 'others') return CustomWidgets.buildInvalidCard(isEnglish);

    bool isHealthy = cleanId == 'healthy';
    Color themeColor = isHealthy ? Colors.green : Colors.redAccent;
    Color bgColor = isHealthy ? Colors.green.withOpacity(0.1) : Colors.redAccent.withOpacity(0.1);

    return Container(
      padding: EdgeInsets.symmetric(vertical: isSmall ? 16 : 24, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: themeColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            formattedLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isSmall ? 18 : 24,
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${isEnglish ? "Confidence" : "নিশ্চয়তা"}: ${confidencePercent.toStringAsFixed(1)}%",
            style: TextStyle(
              fontSize: isSmall ? 12 : 14,
              fontWeight: FontWeight.w500,
              color: themeColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  // --- Legacy helper for backward compatibility ---
  Widget _buildResultCardLegacy(BuildContext context, dynamic output, bool isEnglish) {
    String rawLabel = output['label'].toString();
    return _buildSingleResultCard(
      context, 
      SingleResult(label: rawLabel, confidence: output['confidence'] as double), 
      isEnglish
    );
  }

  Widget _buildDiseaseInfo(BuildContext context, String rawLabel, bool isEnglish) {
    String id = _getCleanId(rawLabel);
    if (id == "healthy" || id == 'others') return const SizedBox.shrink();

    final data = diseaseInfo[id];
    if (data == null) return const SizedBox.shrink();

    return Column(
      children: [
        CustomWidgets.buildInfoTile(
          context,
          title: isEnglish ? "Symptoms" : "লক্ষণ",
          content: isEnglish
              ? (data['symptoms_en'] ?? "")
              : (data['symptoms'] ?? ""),
          icon: Icons.warning_amber_rounded,
          accentColor: Colors.orange,
        ),
        CustomWidgets.buildInfoTile(
          context,
          title: isEnglish ? "Prevention" : "প্রতিরোধ",
          content: isEnglish
              ? (data['prevention_en'] ?? "")
              : (data['prevention'] ?? ""),
          icon: Icons.shield_outlined,
          accentColor: Colors.blue,
        ),
        CustomWidgets.buildInfoTile(
          context,
          title: isEnglish ? "Treatment" : "প্রাথমিক চিকিৎসা",
          content: isEnglish
              ? (data['treatment_en'] ?? "")
              : (data['treatment'] ?? ""),
          icon: Icons.medical_services_outlined,
          accentColor: Colors.green,
        ),
      ],
    );
  }

  String _getCleanId(String label) {
    String clean = label.replaceAll(RegExp(r'[0-9]'), '').trim().toLowerCase();
    if (clean.contains('others')) return 'others';
    if (clean.contains('cocci')) return 'cocci';
    if (clean.contains('ncd')) return 'ncd';
    if (clean.contains('salmo')) return 'salmo';
    if (clean.contains('healthy')) return 'healthy';
    if (clean.contains('crd')) return 'crd';
    if (clean.contains('fowlpox')) return 'fowlpox';
    if (clean.contains('bumblefoot')) return 'bumblefoot';
    if (clean.contains('coryza')) return 'coryza';
    return clean;
  }

  String _formatLabel(String label, bool isEnglish) {
    String clean = _getCleanId(label);
    switch (clean) {
      case 'others':
        return isEnglish ? 'Invalid Image' : 'সঠিক ছবি নয়';
      case 'cocci':
        return isEnglish ? 'Coccidiosis' : 'রক্ত আমাশয়';
      case 'healthy':
        return isEnglish ? 'Healthy' : 'সুস্থ মুরগি';
      case 'ncd':
        return isEnglish ? 'Newcastle Disease' : 'রানীক্ষেত';
      case 'salmo':
        return isEnglish ? 'Salmonella' : 'সালমোনেলা';
      case 'crd':
        return isEnglish ? 'CRD' : 'সিআরডি (শ্বাসকষ্ট)';
      case 'fowlpox':
        return isEnglish ? 'Fowl Pox' : 'বসন্ত (পক্স)';
      case 'bumblefoot':
        return isEnglish ? 'Bumblefoot' : 'বাম্বলফুট';
      case 'coryza':
        return isEnglish ? 'Coryza' : 'কোরাইজা (সর্দি)';
      default:
        return clean.isNotEmpty
            ? '${clean[0].toUpperCase()}${clean.substring(1)}'
            : clean;
    }
  }
}
