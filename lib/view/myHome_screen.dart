// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:murgi_care/model/dissease_info.dart';
import 'package:murgi_care/view/auth_screen.dart';
import 'package:murgi_care/view/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/controller.dart';

class MyhomeScreen extends StatelessWidget {
  const MyhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CustomWidgets.handleAppUpdate(context);
    });
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: Consumer<DiseaseProvider>(
          builder: (context, provider, child) {
            if (provider.image == null) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.redAccent),
              onPressed: () => provider.reset(),
              tooltip: provider.isEnglish ? "Reset" : "রিসেট",
            );
          },
        ),
        title: const Text(
          'Chicken Disease Detector',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color.fromARGB(255, 8, 63, 9),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          Consumer<DiseaseProvider>(
            builder: (context, provider, child) {
              return TextButton(
                onPressed: () => provider.toggleLanguage(),
                child: Text(
                  provider.isEnglish ? "বাংলা" : "ENG",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
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
                                  ? "No chicken image is selected"
                                  : "মুরগির কোনো ছবি নির্বাচন করা হয়নি",
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

                // --- 2. Logic: Result Section ---
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
                      // Fixed: Passing Map data from provider
                      buildResultCard(provider.outputs![0], provider.isEnglish),
                      const SizedBox(height: 24),
                      // Fixed: Accessing Map key ['label'] instead of .label
                      _buildDiseaseInfo(
                        provider.outputs![0]['label'].toString(),
                        provider.isEnglish,
                      ),
                    ],
                  )
                else
                  Center(
                    child: Text(
                      provider.isEnglish
                          ? "Select an image to check chickens health status"
                          : "মুরগির স্বাস্থ্য পরীক্ষা করতে একটি ছবি নির্বাচন করুন",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),

                const SizedBox(height: 40),

                Row(
                  children: [
                    Expanded(
                      child: CustomWidgets.buildActionButton(
                        icon: Icons.camera_alt_rounded,
                        label: provider.isEnglish ? "Camera" : "ক্যামেরা",
                        color: Colors.teal,
                        // Pass 'context' here for the custom CameraScanScreen navigation
                        onTap: () =>
                            provider.pickImage(ImageSource.camera, context),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomWidgets.buildActionButton(
                        icon: Icons.photo_library_rounded,
                        label: provider.isEnglish ? "Gallery" : "গ্যালারি",
                        color: Colors.indigo,
                        // Pass 'context' here as well
                        onTap: () =>
                            provider.pickImage(ImageSource.gallery, context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                const Divider(),
                const SizedBox(height: 16),
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
                const SizedBox(height: 20),

                // --- 3. Authentication Status Section ---
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    bool isLoggedIn = snapshot.hasData && snapshot.data != null;

                    if (isLoggedIn) {
                      // --- LOGGED IN UI ---
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.teal.shade50,
                              child: const Icon(
                                Icons.person,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.isEnglish
                                        ? "Active Account"
                                        : "সক্রিয় অ্যাকাউন্ট",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data?.email ?? "",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        provider.isEnglish
                                            ? "Logged Out"
                                            : "লগ আউট হয়েছে",
                                      ),
                                      backgroundColor: Colors.orange,
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.logout,
                                size: 18,
                                color: Colors.redAccent,
                              ),
                              label: Text(
                                provider.isEnglish ? "Logout" : "লগ আউট",
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // --- GUEST / LOGGED OUT UI ---
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.teal.withOpacity(0.1)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.lock_open_rounded,
                                size: 18,
                                color: Colors.teal,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                provider.isEnglish
                                    ? "Want unlimited health checks?"
                                    : "আনলিমিটেড স্বাস্থ্য পরীক্ষা করতে চান?",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => AuthScreen()),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: provider.isEnglish
                                          ? "Please "
                                          : "দয়া করে সার্ভিসটি আনলক করতে ",
                                    ),
                                    TextSpan(
                                      text: provider.isEnglish
                                          ? "Login or Sign Up"
                                          : "লগইন বা সাইন আপ",
                                      style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    TextSpan(
                                      text: provider.isEnglish
                                          ? " to unlock full service."
                                          : " করুন।",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildResultCard(dynamic output, bool isEnglish) {
    String rawLabel = output['label'].toString();
    String cleanId = _getCleanId(rawLabel);
    String formattedLabel = formatLabel(rawLabel, isEnglish);

    // Confidence is now a double inside the map
    double confidence = (output['confidence'] as double) * 100;

    if (cleanId == 'others') {
      return CustomWidgets.buildInvalidCard(isEnglish);
    }

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

  Widget _buildDiseaseInfo(String rawLabel, bool isEnglish) {
    String id = _getCleanId(rawLabel);

    if (id == "healthy" || id == 'others') return const SizedBox.shrink();

    final data = diseaseInfo[id];

    if (data == null) {
      debugPrint("Warning: No info found in diseaseInfo for ID: $id");
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        CustomWidgets.buildInfoTile(
          title: isEnglish ? "Symptoms" : "লক্ষণ",
          content: isEnglish
              ? (data['symptoms_en'] ?? "")
              : (data['symptoms'] ?? ""),
          icon: Icons.warning_amber_rounded,
          accentColor: Colors.orange,
        ),
        CustomWidgets.buildInfoTile(
          title: isEnglish ? "Prevention" : "প্রতিরোধ",
          content: isEnglish
              ? (data['prevention_en'] ?? "")
              : (data['prevention'] ?? ""),
          icon: Icons.shield_outlined,
          accentColor: Colors.blue,
        ),
        CustomWidgets.buildInfoTile(
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

  String formatLabel(String label, bool isEnglish) {
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
