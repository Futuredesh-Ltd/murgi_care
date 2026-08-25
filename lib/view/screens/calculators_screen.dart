import 'package:flutter/material.dart';
import '../widgets/fcr_calculator_dialog.dart';
import '../widgets/space_planner_dialog.dart';

class CalculatorsScreen extends StatelessWidget {
  final bool isEnglish;

  const CalculatorsScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? "Poultry Calculators" : "হিসাব নিকাশ"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildCalcTile(
            context,
            icon: Icons.speed_rounded,
            title: isEnglish ? "FCR Calculator" : "এফসিআর (FCR) ক্যালকুলেটর",
            subtitle: isEnglish ? "Calculate Feed Conversion Ratio" : "খাদ্যের রূপান্তর হার ও দক্ষতা হিসাব করুন",
            color: Colors.purple,
            onTap: () => showDialog(
              context: context,
              builder: (_) => FcrCalculatorDialog(isEnglish: isEnglish),
            ),
          ),
          const SizedBox(height: 16),
          _buildCalcTile(
            context,
            icon: Icons.grid_view_rounded,
            title: isEnglish ? "Farm Capacity Calculator" : "ধারণক্ষমতা ক্যালকুলেটর",
            subtitle: isEnglish ? "Calculate required shed space for birds" : "শেডের স্থান ও মুরগির ঘনত্ব নির্ধারণ করুন",
            color: Colors.deepOrange,
            onTap: () => showDialog(
              context: context,
              builder: (_) => SpacePlannerDialog(isEnglish: isEnglish),
            ),
          ),
          const SizedBox(height: 16),
          _buildCalcTile(
            context,
            icon: Icons.water_drop_rounded,
            title: isEnglish ? "Daily Feed & Water Estimator" : "দৈনিক খাদ্য ও পানি হিসাব",
            subtitle: isEnglish ? "Estimate feed requirement per batch" : "বয়স অনুযায়ী খাদ্য ও পানির গড় চাহিদা",
            color: Colors.blue,
            onTap: () => _showFeedWaterDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCalcTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color, size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(subtitle, style: const TextStyle(fontSize: 13)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: onTap,
      ),
    );
  }

  void _showFeedWaterDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(isEnglish ? "Feed & Water Calculation" : "দৈনিক খাদ্য ও পানি হিসাব"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: isEnglish ? "Number of Birds" : "মুরগির সংখ্যা",
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(isEnglish ? "Close" : "বন্ধ করুন"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              final count = double.tryParse(controller.text) ?? 0;
              final feedKg = (count * 0.11).toStringAsFixed(1); // Avg grower feed
              final waterL = (count * 0.22).toStringAsFixed(1);
              Navigator.pop(ctx);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(isEnglish ? "Estimated Daily Requirement" : "দৈনিক আনুমানিক চাহিদা"),
                  content: Text(
                    isEnglish
                        ? "Feed: ~$feedKg kg/day\nWater: ~$waterL Liters/day"
                        : "খাদ্য: ~$feedKg কেজি/দিন\nপানি: ~$waterL লিটার/দিন",
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    )
                  ],
                ),
              );
            },
            child: Text(isEnglish ? "Calculate" : "হিসাব করুন"),
          ),
        ],
      ),
    );
  }
}
