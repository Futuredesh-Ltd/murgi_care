import 'package:flutter/material.dart';
import 'package:murgi_care/controller/controller.dart';
import 'package:murgi_care/model/multi_result.dart';
import 'package:murgi_care/view/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:murgi_care/model/dissease_info.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/animated_action_button.dart';

class DetectionTab extends StatefulWidget {
  final Future<void> Function(BuildContext, bool) showLoginDialog;

  const DetectionTab({super.key, required this.showLoginDialog});

  @override
  State<DetectionTab> createState() => _DetectionTabState();
}

class _DetectionTabState extends State<DetectionTab> {
  int? _selectedPhotoIndex;
  bool _showResults = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DiseaseProvider>(
      builder: (context, provider, child) {
        // Reset selection if new analysis starts
        if (provider.loading || provider.image == null) {
          _selectedPhotoIndex = null;
          _showResults = false;
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
                          ImageSource.camera,
                          context,
                        );
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
                          ImageSource.gallery,
                          context,
                        );
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
                    onTap: () =>
                        CustomWidgets.showAboutUs(context, provider.isEnglish),
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
                offset: const Offset(0, 4),
              ),
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
                    _showResults = true; // Auto reveal when thumbnail clicked
                    if (_selectedPhotoIndex == index) {
                      _selectedPhotoIndex = null; // Toggle off individual
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
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.teal.withOpacity(0.3),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.file(
                      provider.images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            provider.isEnglish
                ? (_selectedPhotoIndex == null
                      ? "Select photo to see individual result"
                      : "Photo ${_selectedPhotoIndex! + 1} Selected")
                : (_selectedPhotoIndex == null
                      ? "ব্যক্তিগত ফলাফল দেখতে ফটো নির্বাচন করুন"
                      : "ফটো ${_selectedPhotoIndex! + 1} নির্বাচিত"),
            style: TextStyle(
              fontSize: 12,
              color: Colors.teal.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildResultSection(BuildContext context, DiseaseProvider provider) {
    if (provider.loading) {
      return Column(
        children: [
          const CircularProgressIndicator(strokeWidth: 3, color: Colors.teal),
          const SizedBox(height: 16),
          Text(
            provider.isEnglish
                ? "Analyzing 3 photos..."
                : "৩টি ছবি বিশ্লেষণ করা হচ্ছে...",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );
    }

    if (provider.multiResult != null) {
      return AnimatedCrossFade(
        firstChild: _buildSummaryCard(
          context,
          provider.multiResult!,
          provider.isEnglish,
        ),
        secondChild: _buildDetailedResults(context, provider),
        crossFadeState: _showResults
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 400),
      );
    }

    if (provider.outputs != null && provider.outputs!.isNotEmpty) {
      return _buildDetailedResults(context, provider);
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

  Widget _buildSummaryCard(
    BuildContext context,
    MultiAnalysisResult multi,
    bool isEnglish,
  ) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => _showResults = true),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.teal.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.teal.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.analytics_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                isEnglish ? "Analysis Successful" : "বিশ্লেষণ সফল হয়েছে",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isEnglish
                    ? "Complete Diagnostic Summary"
                    : "সম্পূর্ণ ডায়াগনস্টিক সারসংক্ষেপ",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isEnglish ? "View Results" : "ফলাফল দেখুন",
                      style: const TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.teal,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedResults(BuildContext context, DiseaseProvider provider) {
    if (provider.multiResult != null) {
      final multi = provider.multiResult!;
      final resultToShow = _selectedPhotoIndex != null
          ? multi.individualResults[_selectedPhotoIndex!]
          : multi.primary;
      final isAggregated = _selectedPhotoIndex == null;

      final diagnosisId = _getCleanId(resultToShow.label);
      final isDisease = diagnosisId != "healthy" && diagnosisId != "others";

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isAggregated) ...[
            Center(
              child: _buildStatusBadge(context, multi, provider.isEnglish),
            ),
            const SizedBox(height: 20),
          ] else ...[
            Row(
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                  color: Colors.teal,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    provider.isEnglish
                        ? "Individual Result (Photo ${_selectedPhotoIndex! + 1})"
                        : "ব্যক্তিগত ফলাফল (ফটো ${_selectedPhotoIndex! + 1})",
                    style: const TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => setState(() => _selectedPhotoIndex = null),
                  child: Text(
                    provider.isEnglish ? "Show Summary" : "সারসংক্ষেপ দেখুন",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],

          if (isAggregated && multi.type == ResultType.inconclusive)
            ...multi.results.map(
              (res) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildSingleResultCard(
                  context,
                  res,
                  provider.isEnglish,
                  isSmall: true,
                ),
              ),
            )
          else
            _buildSingleResultCard(context, resultToShow, provider.isEnglish),

          const SizedBox(height: 24),
          _buildDiseaseInfo(context, resultToShow.label, provider.isEnglish),

          if (isDisease) ...[
            const SizedBox(height: 16),
            _buildVetConsultationCard(context, provider.isEnglish),
          ],
        ],
      );
    } else {
      // Legacy Single Photo logic
      final label = provider.outputs![0]['label'].toString();
      final diagnosisId = _getCleanId(label);
      final isDisease = diagnosisId != "healthy" && diagnosisId != "others";

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildResultCardLegacy(
            context,
            provider.outputs![0],
            provider.isEnglish,
          ),
          const SizedBox(height: 24),
          _buildDiseaseInfo(context, label, provider.isEnglish),
          if (isDisease) ...[
            const SizedBox(height: 16),
            _buildVetConsultationCard(context, provider.isEnglish),
          ],
        ],
      );
    }
  }

  Widget _buildVetConsultationCard(BuildContext context, bool isEnglish) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chat_bubble_rounded,
                  color: Colors.teal,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEnglish
                          ? "Need Expert Advice?"
                          : "বিশেষজ্ঞের পরামর্শ প্রয়োজন?",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      isEnglish
                          ? "Consult a Vet on WhatsApp"
                          : "হোয়াটসঅ্যাপে বিশেষজ্ঞের সাথে কথা বলুন",
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _launchWhatsApp(context, isEnglish),
              icon: const Icon(Icons.phone_outlined, size: 18),
              label: Text(
                isEnglish
                    ? "Contact Veterinarian"
                    : "পশুচিকিৎসকের সাথে যোগাযোগ করুন",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchWhatsApp(BuildContext context, bool isEnglish) async {
    const String phoneNumber = "8801575115194"; // Omit '+' for wa.me links
    final String message = isEnglish
        ? "Hello, I need some help with my poultry flock."
        : "হ্যালো, আমার খামারের মুরগির জন্য কিছু সাহায্য প্রয়োজন।";

    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
    );
    
    // Fallback scheme for direct app launch
    final Uri whatsappAppUri = Uri.parse(
      "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}",
    );

    try {
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(whatsappAppUri)) {
        await launchUrl(whatsappAppUri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isEnglish
                    ? "Could not launch WhatsApp. Please install it."
                    : "হোয়াটসঅ্যাপ খোলা সম্ভব হচ্ছে না। দয়া করে এটি ইনস্টল করুন।",
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("WhatsApp launch error: $e");
    }
  }

  // --- UI Components ---

  Widget _buildStatusBadge(
    BuildContext context,
    MultiAnalysisResult result,
    bool isEnglish,
  ) {
    Color color;
    String text;
    IconData icon;

    switch (result.type) {
      case ResultType.unanimous:
        color = Colors.green;
        text = isEnglish
            ? "High Confidence (3/3 agreed)"
            : "উচ্চ নিশ্চয়তা (৩/৩ মিলছে)";
        icon = Icons.verified_rounded;
        break;
      case ResultType.majority:
        color = Colors.teal;
        text = isEnglish
            ? "Reliable Result (2/3 agreed)"
            : "নির্ভরযোগ্য ফলাফল (২/৩ মিলছে)";
        icon = Icons.check_circle_rounded;
        break;
      case ResultType.inconclusive:
        color = Colors.orange;
        text = isEnglish
            ? "Inconclusive (Different results)"
            : "অস্পষ্ট ফলাফল (ভিন্ন ভিন্ন ফলাফল)";
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
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleResultCard(
    BuildContext context,
    SingleResult result,
    bool isEnglish, {
    bool isSmall = false,
  }) {
    String cleanId = _getCleanId(result.label);
    String formattedLabel = _formatLabel(result.label, isEnglish);
    double confidencePercent = result.confidence * 100;

    if (cleanId == 'others') return CustomWidgets.buildInvalidCard(isEnglish);

    bool isHealthy = cleanId == 'healthy';
    Color themeColor = isHealthy ? Colors.green : Colors.redAccent;
    Color bgColor = isHealthy
        ? Colors.green.withOpacity(0.1)
        : Colors.redAccent.withOpacity(0.1);

    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: isSmall ? 20 : 32,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: themeColor.withOpacity(0.3), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: themeColor.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
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
      ),
    );
  }

  // --- Legacy helper for backward compatibility ---
  Widget _buildResultCardLegacy(
    BuildContext context,
    dynamic output,
    bool isEnglish,
  ) {
    String rawLabel = output['label'].toString();
    return _buildSingleResultCard(
      context,
      SingleResult(label: rawLabel, confidence: output['confidence'] as double),
      isEnglish,
    );
  }

  Widget _buildDiseaseInfo(
    BuildContext context,
    String rawLabel,
    bool isEnglish,
  ) {
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
