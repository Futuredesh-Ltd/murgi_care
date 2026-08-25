import 'package:flutter/material.dart';

class FarmManagementScreen extends StatelessWidget {
  final bool isEnglish;

  const FarmManagementScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? "Farm Management Guide" : "খামার ব্যবস্থাপনা"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildGuideSection(
            context,
            icon: Icons.house_rounded,
            title: isEnglish ? "Shed Management & Cleaning" : "শেড ব্যবস্থাপনা ও পরিষ্কার-পরিচ্ছন্নতা",
            color: Colors.brown,
            items: [
              isEnglish ? "Keep litter dry and 2-3 inches deep." : "লিটার সর্বদা শুকনো রাখুন এবং ২-৩ ইঞ্চি পুষ্ট রাখুন।",
              isEnglish ? "Disinfect shed before introducing new batch." : "নতুন বাচ্চা আনার আগে পুরো শেড জীবাণুনাশক দিয়ে ভালো করে ধুয়ে নিন।",
              isEnglish ? "Remove wet litter spots immediately." : "ভেজা লিটার পাওয়া মাত্রই সরিয়ে নতুন শুকনো লিটার দিন।",
            ],
          ),
          const SizedBox(height: 12),
          _buildGuideSection(
            context,
            icon: Icons.air_rounded,
            title: isEnglish ? "Ventilation & Temperature" : "বাতাস চলাচল ও তাপমাত্রা",
            color: Colors.blue,
            items: [
              isEnglish ? "Maintain 32-35°C during Week 1 brooding." : "প্রথম সপ্তাহে ব্রুডিং তাপমাত্রা ৯২-৯৫° ফারেনহাইট (৩২-৩৫° সে:) রাখুন।",
              isEnglish ? "Ensure proper cross ventilation to remove ammonia." : "শেডে অ্যামোনিয়া গ্যাস জমার হাত থেকে বাঁচাতে বাতাস চলাচলের ব্যবস্থা রাখুন।",
              isEnglish ? "Lower curtain according to weather conditions." : "আবহাওয়া বুঝে শেডের পর্দা ওঠানামা করান।",
            ],
          ),
          const SizedBox(height: 12),
          _buildGuideSection(
            context,
            icon: Icons.water_drop_rounded,
            title: isEnglish ? "Feed & Water Hygiene" : "খাদ্য ও পানি ব্যবস্থাপনা",
            color: Colors.teal,
            items: [
              isEnglish ? "Clean drinkers twice daily with fresh water." : "পানি পাত্র দিনে অন্তত দুইবার পরিষ্কার পানিতে রিফিল করুন।",
              isEnglish ? "Provide fresh feeds to avoid mold contamination." : "ছত্রাকমুক্ত তাজা খাবার নিশ্চিত করুন।",
              isEnglish ? "Adjust feeder height according to bird height." : "মুরগির পিঠের উচ্চতায় ফিডার সামঞ্জস্য করুন।",
            ],
          ),
          const SizedBox(height: 12),
          _buildGuideSection(
            context,
            icon: Icons.shield_rounded,
            title: isEnglish ? "Biosecurity & Quarantine" : "বায়োসিকিউরিটি ও কোয়ারেন্টাইন",
            color: Colors.redAccent,
            items: [
              isEnglish ? "Place footbaths with disinfectant at entry." : "খামারের প্রবেশপথে পটাস বা ব্লিচিং মিশ্রিত ফুটবাথ রাখুন।",
              isEnglish ? "Isolate sick birds immediately." : "অসুস্থ মুরগিকে সাথে সাথেই আলাদা ঘরে সরিয়ে চিকিৎসা দিন।",
              isEnglish ? "Restrict unauthorized visitors inside farm." : "অপ্রয়োজনীয় বহিরাগতদের খামারে প্রবেশ কঠোরভাবে নিষেধ করুন।",
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuideSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required List<String> items,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_outline, color: color, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 14, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
