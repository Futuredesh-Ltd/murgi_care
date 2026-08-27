import 'package:flutter/material.dart';
import 'production_cost_per_kg_screen.dart';
import 'production_cost_day_old_chick_screen.dart';
import 'production_cost_egg_screen.dart';

class ProductionCostScreen extends StatefulWidget {
  final bool isEnglish;

  const ProductionCostScreen({super.key, required this.isEnglish});

  @override
  State<ProductionCostScreen> createState() => _ProductionCostScreenState();
}

class _ProductionCostScreenState extends State<ProductionCostScreen> {
  bool get isEnglish => widget.isEnglish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Production Cost" : "উৎপাদন খরচ জানুন",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Card 1: 1 kg Chicken Production Cost
          _buildMenuCard(
            title: isEnglish
                ? "Know production cost of 1 kg chicken."
                : "এক কেজি মুরগীর উৎপাদন খরচ জানুন।",
            subtitle: isEnglish
                ? "Enter chick price, feed price, target weight and target FCR and click for results."
                : "বাচ্চার দাম, ফিডের দাম, টার্গেট ওজন ও টার্গেট FCR লিখুন এবং ফলাফলের জন্য ক্লিক করুন।",
            iconEmoji: "🐔",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductionCostPerKgScreen(isEnglish: isEnglish),
                ),
              );
            },
          ),
          const SizedBox(height: 12),

          // Card 2: Day-Old Chick Production Cost
          _buildMenuCard(
            title: isEnglish
                ? "Know production cost of a day-old chick."
                : "এক দিনের মুরগীর বাচ্চার উৎপাদন খরচ জানুন।",
            subtitle: isEnglish
                ? "Enter parent chick price, feed price and chick quantity (HH Chicks) and click for results."
                : "প্যারেন্টস বাচ্চার দাম, ফিডের দাম ও বাচ্চার সংখ্যা (HH Chicks) লিখুন এবং ফলাফলের জন্য ক্লিক করুন।",
            iconEmoji: "🐣",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductionCostDayOldChickScreen(isEnglish: isEnglish),
                ),
              );
            },
          ),
          const SizedBox(height: 12),

          // Card 3: Egg Production Cost
          _buildMenuCard(
            title: isEnglish
                ? "Know production cost of a single egg."
                : "একটি ডিমের উৎপাদন খরচ জানুন।",
            subtitle: isEnglish
                ? "Enter layer chick price, feed price and egg quantity (HH egg) and click for results."
                : "লেয়ার বাচ্চার দাম, ফিডের দাম ও ডিমের সংখ্যা (HH egg) লিখুন এবং ফলাফলের জন্য ক্লিক করুন।",
            iconEmoji: "🥚",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductionCostEggScreen(isEnglish: isEnglish),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required String iconEmoji,
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
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  iconEmoji,
                  style: const TextStyle(fontSize: 36),
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
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey.shade600,
                        height: 1.35,
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
