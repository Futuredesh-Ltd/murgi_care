import 'package:flutter/material.dart';
import 'broiler_standard_screen.dart';
import 'color_standard_screen.dart';
import 'layer_standard_screen.dart';
import 'duck_standard_screen.dart';

class CommercialStandardDataScreen extends StatefulWidget {
  final bool isEnglish;

  const CommercialStandardDataScreen({super.key, required this.isEnglish});

  @override
  State<CommercialStandardDataScreen> createState() =>
      _CommercialStandardDataScreenState();
}

class _CommercialStandardDataScreenState
    extends State<CommercialStandardDataScreen> {
  bool get isEnglish => widget.isEnglish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Commercial Standard Data" : "কমার্শিয়াল স্ট্যান্ডার্ড ডাটা",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Card 1: Broiler Standard Data
          _buildStandardCard(
            title: isEnglish ? "Broiler Standard Data" : "ব্রয়লার স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            iconEmoji: "🐓",
            cardColor: Colors.white,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BroilerStandardScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 2: Color Standard Data
          _buildStandardCard(
            title: isEnglish ? "Color Standard Data" : "কালার স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            iconEmoji: "🐓",
            cardColor: Colors.white,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ColorStandardScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 3: Layer Standard Data
          _buildStandardCard(
            title: isEnglish ? "Layer Standard Data" : "লেয়ার স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            iconEmoji: "🐔",
            cardColor: Colors.white,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LayerStandardScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 4: Duck Commercial Standard Data
          _buildStandardCard(
            title: isEnglish
                ? "Duck Commercial Standard Data"
                : "হাঁসের কমার্শিয়াল স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            iconEmoji: "🦆",
            cardColor: Colors.white,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DuckStandardScreen(isEnglish: isEnglish),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardCard({
    required String title,
    required String subtitle,
    required String iconEmoji,
    required Color cardColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  iconEmoji,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey.shade600,
                        height: 1.3,
                      ),
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
}
