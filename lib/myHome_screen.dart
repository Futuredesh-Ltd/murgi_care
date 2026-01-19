import 'package:chicken_dissease/dissease_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'controller.dart';

class MyhomeScreen extends StatelessWidget {
  const MyhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Soft background
      appBar: AppBar(
        title: const Text(
          'Chicken Disease Detector',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        // --- ADDED: Language Toggle Button ---
        actions: [
          Consumer<DiseaseProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextButton(
                  onPressed: () => provider.toggleLanguage(),
                  child: Text(
                    provider.isEnglish ? "বাংলা" : "ENG",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade200, height: 1.0),
        ),
      ),
      body: Consumer<DiseaseProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- 1. Image Display Card ---
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: provider.image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 50,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              provider.isEnglish
                                  ? "No Image Selected"
                                  : "কোন ছবি নির্বাচন করা হয়নি",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(provider.image!, fit: BoxFit.cover),
                        ),
                ),

                const SizedBox(height: 32),

                // --- 2. Logic: Loading / Result / Instructions ---
                if (provider.loading)
                  const Column(
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Analyzing...",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                else if (provider.outputs != null &&
                    provider.outputs!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Result Header Card
                      _buildResultCard(
                        provider.outputs![0],
                        provider.isEnglish,
                      ),

                      const SizedBox(height: 24),

                      // Detailed Information Sections
                      _buildDiseaseInfo(
                        provider.outputs![0]['label'],
                        provider.isEnglish,
                      ),
                    ],
                  )
                else
                  Center(
                    child: Text(
                      provider.isEnglish
                          ? "Select an image to check health status"
                          : "স্বাস্থ্য পরীক্ষা করতে একটি ছবি নির্বাচন করুন",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),

                const SizedBox(height: 40),

                // --- 3. Action Buttons ---
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        icon: Icons.camera_alt_rounded,
                        label: provider.isEnglish ? "Camera" : "ক্যামেরা",
                        color: Colors.teal,
                        onTap: () => provider.pickImage(ImageSource.camera),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildActionButton(
                        icon: Icons.photo_library_rounded,
                        label: provider.isEnglish ? "Gallery" : "গ্যালারি",
                        color: Colors.indigo,
                        onTap: () => provider.pickImage(ImageSource.gallery),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // --- Helper: Beautiful Result Card ---
  Widget _buildResultCard(Map output, bool isEnglish) {
    String rawLabel = output['label'].toString();
    String cleanId = _getCleanId(rawLabel);
    String formattedLabel = formatLabel(rawLabel, isEnglish);
    double confidence = (output['confidence'] as double) * 100;

    // --- SPECIAL CASE: IF OTHERS ---
    if (cleanId == 'others') {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.amber),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.amber,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              isEnglish ? "Invalid Image" : "সঠিক ছবি তুলুন",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              isEnglish
                  ? "This doesn't look like chicken droppings. Please provide a valid image."
                  : "এটি মুরগির মলের ছবি বলে মনে হচ্ছে না। দয়া করে সঠিক ছবি দিন।",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.brown),
            ),
          ],
        ),
      );
    }

    // --- EXISTING LOGIC FOR HEALTHY/DISEASED ---
    bool isHealthy = cleanId == 'healthy';
    Color themeColor = isHealthy ? Colors.green : Colors.redAccent;
    Color bgColor = isHealthy ? Colors.green.shade50 : Colors.red.shade50;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${isEnglish ? "Confidence" : "নিশ্চয়তা"}: ${confidence.toStringAsFixed(1)}%",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper: Disease Info Section ---
  Widget _buildDiseaseInfo(String rawLabel, bool isEnglish) {
    String id = _getCleanId(rawLabel);

    // --- UPDATED LOGIC: Hide info for 'healthy' and 'others' ---
    if (id == "healthy" || id == 'others') {
      return const SizedBox.shrink();
    }

    Map<String, String>? data = diseaseInfo[id];

    // If no data exists in map, hide this section
    if (data == null) return const SizedBox.shrink();

    return Column(
      children: [
        _buildInfoTile(
          title: isEnglish ? "Symptoms" : "লক্ষণ",
          content: isEnglish ? data['symptoms_en']! : data['symptoms']!,
          icon: Icons.warning_amber_rounded,
          accentColor: Colors.orange,
        ),
        _buildInfoTile(
          title: isEnglish ? "Prevention" : "প্রতিরোধ",
          content: isEnglish ? data['prevention_en']! : data['prevention']!,
          icon: Icons.shield_outlined,
          accentColor: Colors.blue,
        ),
        _buildInfoTile(
          title: isEnglish ? "Treatment" : "প্রাথমিক চিকিৎসা",
          content: isEnglish ? data['treatment_en']! : data['treatment']!,
          icon: Icons.medical_services_outlined,
          accentColor: Colors.green,
        ),
      ],
    );
  }

  // --- Helper: Single Info Tile ---
  Widget _buildInfoTile({
    required String title,
    required String content,
    required IconData icon,
    required Color accentColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: accentColor, width: 6)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: accentColor, size: 22),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: accentColor.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6, // Better readability for Bangla
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper: Action Button ---
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 22),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        elevation: 2,
        shadowColor: color.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  String _getCleanId(String label) {
    // 1. Remove numbers and spaces (e.g., "3 pcrcocci" -> "pcrcocci")
    String clean = label.replaceAll(RegExp(r'[0-9]'), '').trim().toLowerCase();

    // 2. Map your specific labels to the database keys
    if (clean.contains('others')) return 'others'; // Added support for 'others'
    if (clean.contains('cocci')) return 'cocci';
    if (clean.contains('ncd')) return 'ncd';
    if (clean.contains('salmo')) return 'salmo';
    if (clean.contains('healthy')) return 'healthy';

    return clean;
  }

  // --- LOGIC: Format Label for Header ---
  String formatLabel(String label, bool isEnglish) {
    String clean = label.replaceAll(RegExp(r'[0-9]'), '').trim().toLowerCase();
    switch (clean) {
      case 'others':
        return isEnglish ? 'Invalid Image' : 'সঠিক ছবি নয়';
      case 'cocci':
      case 'pcrcocci':
        return isEnglish ? 'Coccidiosis' : 'রক্ত আমাশয়';
      case 'healthy':
      case 'pcrhealthy':
        return isEnglish ? 'Healthy' : 'সুস্থ মুরগি';
      case 'ncd':
      case 'pcrncd':
        return isEnglish ? 'Newcastle Disease' : 'রানীক্ষেত';
      case 'salmo':
      case 'pcrsalmo':
        return isEnglish ? 'Salmonella' : 'সালমোনেলা';
      default:
        return clean.isNotEmpty
            ? '${clean[0].toUpperCase()}${clean.substring(1)}'
            : clean;
    }
  }
}
