import 'package:flutter/material.dart';
import 'broiler_ps_standard_screen.dart';
import 'color_standard_screen.dart';
import 'layer_standard_screen.dart';
import 'duck_standard_screen.dart';

class PSStandardDataScreen extends StatefulWidget {
  final bool isEnglish;

  const PSStandardDataScreen({super.key, required this.isEnglish});

  @override
  State<PSStandardDataScreen> createState() => _PSStandardDataScreenState();
}

class _PSStandardDataScreenState extends State<PSStandardDataScreen> {
  bool get isEnglish => widget.isEnglish;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          isEnglish ? "PS Standard Data" : "পিএস স্ট্যান্ডার্ড ডাটা",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00838F),
        elevation: 0.5,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        children: [
          // Card 1: Broiler PS Standard Data
          _buildPSCard(
            context: context,
            title: isEnglish ? "Broiler PS Standard Data" : "ব্রয়লার পিএস স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            imagePath: "assets/ps_broiler.jpg",
            isDark: isDark,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BroilerPSStandardScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 2: Color PS Standard Data
          _buildPSCard(
            context: context,
            title: isEnglish ? "Color PS Standard Data" : "কালার পিএস স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            imagePath: "assets/ps_color.jpg",
            isDark: isDark,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ColorStandardScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 3: Layer PS Standard Data
          _buildPSCard(
            context: context,
            title: isEnglish ? "Layer PS Standard Data" : "লেয়ার পিএস স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            imagePath: "assets/ps_brown_layer.jpg",
            isDark: isDark,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LayerStandardScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 4: Duck PS Standard Data
          _buildPSCard(
            context: context,
            title: isEnglish ? "Duck PS Standard Data" : "হাঁস পিএস স্ট্যান্ডার্ড ডাটা",
            subtitle: isEnglish
                ? "Please select the breed, put the age in week and click for standard data."
                : "জাত নির্বাচন করুন, সপ্তাহে বয়স দিন এবং স্ট্যান্ডার্ড ডাটার জন্য ক্লিক করুন।",
            imagePath: "assets/ps_duck.jpg",
            isDark: isDark,
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

  Widget _buildPSCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imagePath,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      margin: EdgeInsets.zero,
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Image Thumbnail
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF00838F).withValues(alpha: 0.25),
                    width: 1.5,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.teal.shade50,
                      child: const Icon(
                        Icons.analytics_rounded,
                        color: Colors.teal,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.35,
                        color: isDark ? Colors.grey.shade400 : const Color(0xFF64748B),
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
