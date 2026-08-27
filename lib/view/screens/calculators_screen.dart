import 'package:flutter/material.dart';
import '../widgets/fcr_calculator_dialog.dart';
import '../widgets/space_planner_dialog.dart';
import 'flock_uniformity_screen.dart';
import 'roi_calculator_screen.dart';
import 'egg_mass_calculator_screen.dart';
import 'skip_feed_calculator_screen.dart';
import 'egg_production_rate_screen.dart';
import 'medicine_calculator_screen.dart';
import 'space_equipment_calculator_screen.dart';
import 'chick_quality_calculator_screen.dart';
import 'commercial_standard_data_screen.dart';

class CalculatorsScreen extends StatefulWidget {
  final bool isEnglish;

  const CalculatorsScreen({super.key, required this.isEnglish});

  @override
  State<CalculatorsScreen> createState() => _CalculatorsScreenState();
}

class _CalculatorsScreenState extends State<CalculatorsScreen> {
  bool get isEnglish => widget.isEnglish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? "Poultry Calculators" : "হিসাব করুন"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // Instruction Header Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.teal.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.touch_app_rounded, color: Colors.teal.shade700, size: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    isEnglish
                        ? "Enter numbers and click result for details."
                        : "সংখ্যা লিখুন এবং ফলাফলে ক্লিক করুন।",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Skip Feed Program Feed Calculator
          _buildCalcCard(
            context,
            icon: Icons.calendar_today_rounded,
            title: isEnglish
                ? "Skip Feed Program Feed Calculator"
                : "স্কিপ ফিড প্রোগ্রাম অনুযায়ী ফিড হিসাব",
            subtitle: isEnglish
                ? "Calculate total daily feed requirement based on 7/7, 6/7, 5/7, or 4/7 skip-a-day feeding schedules."
                : "৭/৭, ৬/৭, ৫/৭, বা ৪/৭ স্কিপ ফিড প্রোগ্রাম অনুযায়ী মোট দৈনিক ফিডের পরিমাণ নির্ধারণ করুন।",
            color: Colors.teal.shade800,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SkipFeedCalculatorScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Egg Mass Calculator
          _buildCalcCard(
            context,
            icon: Icons.egg_alt_rounded,
            title: isEnglish
                ? "Flock Egg Mass Calculator"
                : "ফ্লকের Egg Mass হিসাব করুন",
            subtitle: isEnglish
                ? "Calculate daily egg mass (g/hen/day), standard benchmark range and flock status based on laying rate & egg weight."
                : "ডিম উৎপাদন % এবং ডিমের গড় ওজনের ভিত্তিতে দৈনিক Egg Mass, স্ট্যান্ডার্ড সীমা ও পরামর্শ হিসাব করুন।",
            color: Colors.amber.shade900,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EggMassCalculatorScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ROI Calculator (Broiler and Layer)
          _buildCalcCard(
            context,
            icon: Icons.calculate_rounded,
            title: isEnglish
                ? "ROI Calculator (Broiler and Layer)"
                : "আর-ও-আই (ROI) ক্যালকুলেটর (ব্রয়লার ও লেয়ার)",
            subtitle: isEnglish
                ? "Calculate Return on Investment (ROI %), total costs & net profit for Broiler or Layer batches."
                : "ব্রয়লার বা লেয়ার ব্যাচের মোট বিনিয়োগ, সম্ভাব্য আয়, নিট লাভ ও ROI (%) হিসাব করুন।",
            color: Colors.green.shade800,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RoiCalculatorScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 0. Chicken Weight & Uniformity Calculator
          _buildCalcCard(
            context,
            icon: Icons.scale_rounded,
            title: isEnglish
                ? "Chicken Weight & Uniformity"
                : "মুরগীর ওজন ও ইউনিফর্মটি",
            subtitle: isEnglish
                ? "Add weight of individual birds one by one to calculate average weight, +10/-10% range, Uniformity (%) & CV (%)."
                : "১টি করে মুরগীর ওজন যোগ করুন এবং গড় ওজন, Uniformity (%) ও CV (%) হিসাব জানুন।",
            color: Colors.teal.shade800,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FlockUniformityScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 1. Temperature Converter
          _buildCalcCard(
            context,
            icon: Icons.thermostat_rounded,
            title: isEnglish
                ? "Temperature Converter (Celsius / Fahrenheit)"
                : "তাপমাত্রা পরিবর্তক (সেলসিয়াস/ ফারেনহাইট হতে ফারেনহাইট/সেলসিয়াস)",
            subtitle: isEnglish
                ? "Enter temperature in Celsius/Fahrenheit and click result to convert temperature."
                : "সেলসিয়াস/ফারেনহাইটে তাপমাত্রা লিখুন এবং তাপমাত্রা পরিবর্তনে ফলাফলে ক্লিক করুন।",
            color: Colors.orange.shade700,
            onTap: () => _showTempConverterDialog(context),
          ),
          const SizedBox(height: 12),

          // 2. Layer Hen Egg Production Rate Calculator
          _buildCalcCard(
            context,
            icon: Icons.egg_rounded,
            title: isEnglish
                ? "Layer Hen Egg Production Rate (%) Calculator"
                : "লেয়ার মুরগির ডিম উৎপাদন হার(%) হিসাব করুন।",
            subtitle: isEnglish
                ? "Enter total bird count, age & total eggs produced on that day and click for result."
                : "মোট মুরগীর সংখ্যা, বয়স ও ঐ দিনে উৎপাদিত মোট ডিমের সংখ্যা লিখুন এবং ফলাফলের জন্য ক্লিক করুন।",
            color: Colors.amber.shade800,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EggProductionRateScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 3. Medicine Dosage Calculator
          _buildCalcCard(
            context,
            icon: Icons.medication_rounded,
            title: isEnglish
                ? "Calculate Total Medicine According to Dose"
                : "মেডিসিনের মাত্রা অনুযায়ী মোট মেডিসিন হিসাব করুন।",
            subtitle: isEnglish
                ? "Enter dose (mg/kg), total bird count and average body weight and click for result."
                : "মিলিগ্রাম/কেজিতে মেডিসিনের মাত্রা, মোট মোরগ-মুরগীর সংখ্যা ও মোরগ-মুরগীর গড় ওজন লিখুন এবং ফলাফলের জন্য ক্লিক করুন।",
            color: Colors.teal.shade700,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MedicineCalculatorScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 4. Space, Feeder & Drinker Calculator
          _buildCalcCard(
            context,
            icon: Icons.grid_view_rounded,
            title: isEnglish
                ? "Know Space, Feeder & Drinker calculation for Chickens"
                : "মুরগীর জন্য জায়গা, ফিডার ও ড্রিঙ্কারের হিসাব জানুন।",
            subtitle: isEnglish
                ? "Enter bird count and age in days and click for result."
                : "মুরগীর সংখ্যা ও বয়স লিখুন এবং ফলাফলের জন্য ক্লিক করুন।",
            color: Colors.blue.shade700,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SpaceEquipmentCalculatorScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 5. Chick Quality Check
          _buildCalcCard(
            context,
            icon: Icons.verified_rounded,
            title: isEnglish
                ? "Chick Quality Check"
                : "চিক Quality check করুন।",
            subtitle: isEnglish
                ? "Enter hatching egg weight and day-old chick weight and click for result."
                : "হ্যাচিং ডিম ও বাচ্চার ওজন লিখুন এবং ফলাফলের জন্য ক্লিক করুন।",
            color: Colors.indigo.shade600,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChickQualityCalculatorScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 6. Standard Growth Data by Age
          _buildCalcCard(
            context,
            icon: Icons.analytics_rounded,
            title: isEnglish
                ? "Know Standard Growth Data of Chickens according to Age"
                : "বয়স অনুযায়ী মুরগির স্ট্যান্ডার্ড ডাটা জানুন।",
            subtitle: isEnglish
                ? "Select bird breed, enter age in weeks and click for result."
                : "মুরগীর জাত নির্বাচন করুন, বয়স লিখুন এবং ফলাফলে ক্লিক করুন।",
            color: Colors.purple.shade700,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CommercialStandardDataScreen(isEnglish: isEnglish),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 7. FCR Calculator
          _buildCalcCard(
            context,
            icon: Icons.speed_rounded,
            title: isEnglish ? "FCR Calculator" : "এফসিআর (FCR) ক্যালকুলেটর",
            subtitle: isEnglish
                ? "Calculate Feed Conversion Ratio to evaluate flock efficiency."
                : "খাদ্যের রূপান্তর হার ও দক্ষতা হিসাব করুন।",
            color: Colors.deepPurple,
            onTap: () => showDialog(
              context: context,
              builder: (_) => FcrCalculatorDialog(isEnglish: isEnglish),
            ),
          ),
          const SizedBox(height: 12),

          // 8. Farm Space Capacity Calculator
          _buildCalcCard(
            context,
            icon: Icons.home_work_rounded,
            title: isEnglish ? "Farm Capacity Calculator" : "শেডের ধারণক্ষমতা ক্যালকুলেটর",
            subtitle: isEnglish
                ? "Calculate required shed space & bird capacity."
                : "শেডের স্থান ও মুরগির ঘনত্ব নির্ধারণ করুন।",
            color: Colors.deepOrange,
            onTap: () => showDialog(
              context: context,
              builder: (_) => SpacePlannerDialog(isEnglish: isEnglish),
            ),
          ),
          const SizedBox(height: 12),

          // 9. Daily Feed & Water Estimator
          _buildCalcCard(
            context,
            icon: Icons.water_drop_rounded,
            title: isEnglish ? "Daily Feed & Water Estimator" : "দৈনিক খাদ্য ও পানি হিসাব",
            subtitle: isEnglish
                ? "Estimate feed and water requirement per batch."
                : "বয়স অনুযায়ী খাদ্য ও পানির গড় চাহিদা নির্ণয় করুন।",
            color: Colors.lightBlue.shade700,
            onTap: () => _showFeedWaterDialog(context),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCalcCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withValues(alpha: 0.25), width: 1.5),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey.shade700,
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

  // --- 1. Temperature Converter Dialog ---
  void _showTempConverterDialog(BuildContext context) {
    final tempController = TextEditingController();
    bool isCelsiusToFahrenheit = true;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModalState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              children: [
                const Icon(Icons.thermostat_rounded, color: Colors.orange),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isEnglish ? "Temperature Converter" : "তাপমাত্রা পরিবর্তক",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglish ? "Select Conversion Type:" : "রূপান্তর ধরণ নির্বাচন করুন:",
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: Text(isEnglish ? "°C ➔ °F" : "সেলসিয়াস ➔ ফারেনহাইট"),
                          selected: isCelsiusToFahrenheit,
                          selectedColor: Colors.orange.shade100,
                          onSelected: (selected) {
                            if (selected) setModalState(() => isCelsiusToFahrenheit = true);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ChoiceChip(
                          label: Text(isEnglish ? "°F ➔ °C" : "ফারেনহাইট ➔ সেলসিয়াস"),
                          selected: !isCelsiusToFahrenheit,
                          selectedColor: Colors.orange.shade100,
                          onSelected: (selected) {
                            if (selected) setModalState(() => isCelsiusToFahrenheit = false);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: tempController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: isCelsiusToFahrenheit
                          ? (isEnglish ? "Temperature in °C" : "সেলসিয়াসে তাপমাত্রা (°C)")
                          : (isEnglish ? "Temperature in °F" : "ফারেনহাইটে তাপমাত্রা (°F)"),
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.device_thermostat),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(isEnglish ? "Cancel" : "বাতিল"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
                onPressed: () {
                  final val = double.tryParse(tempController.text);
                  if (val == null) return;
                  Navigator.pop(ctx);
                  double result;
                  String fromUnit, toUnit;
                  if (isCelsiusToFahrenheit) {
                    result = (val * 9 / 5) + 32;
                    fromUnit = "°C";
                    toUnit = "°F";
                  } else {
                    result = (val - 32) * 5 / 9;
                    fromUnit = "°F";
                    toUnit = "°C";
                  }

                  _showResultModal(
                    context,
                    title: isEnglish ? "Converted Temperature" : "পরিবর্তিত তাপমাত্রা",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.orange.shade200),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${val.toStringAsFixed(1)} $fromUnit =",
                                style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${result.toStringAsFixed(1)} $toUnit",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          isEnglish ? "Ideal Poultry Temperature Reference:" : "পোল্ট্রির আদর্শ তাপমাত্রা গাইড:",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        _buildInfoRow(
                          isEnglish ? "Week 1 Brooding" : "১ম সপ্তাহ ব্রুডিং",
                          "32 - 35°C (90 - 95°F)",
                        ),
                        _buildInfoRow(
                          isEnglish ? "Week 2 Brooding" : "২য় সপ্তাহ ব্রুডিং",
                          "29 - 32°C (85 - 90°F)",
                        ),
                        _buildInfoRow(
                          isEnglish ? "Adult Shed Ideal" : "বয়স্ক শেড আদর্শ",
                          "21 - 24°C (70 - 75°F)",
                        ),
                      ],
                    ),
                  );
                },
                child: Text(isEnglish ? "Calculate" : "ফলাফল দেখুন"),
              ),
            ],
          );
        },
      ),
    );
  }











  // --- 9. Feed & Water Estimator Dialog ---
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
              final feedKg = (count * 0.11).toStringAsFixed(1);
              final waterL = (count * 0.22).toStringAsFixed(1);
              Navigator.pop(ctx);

              _showResultModal(
                context,
                title: isEnglish ? "Estimated Daily Requirement" : "দৈনিক আনুমানিক চাহিদা",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildInfoRow(isEnglish ? "Flock Count" : "মুরগির সংখ্যা", "${count.toInt()} টি"),
                    _buildInfoRow(isEnglish ? "Daily Feed Needed" : "দৈনিক খাদ্য", "~$feedKg কেজি/দিন"),
                    _buildInfoRow(isEnglish ? "Daily Water Needed" : "দৈনিক পানি", "~$waterL লিটার/দিন"),
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

  // --- Helper Result Modal Sheet ---
  void _showResultModal(
    BuildContext context, {
    required String title,
    required Widget content,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: content,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () => Navigator.pop(ctx),
            child: const Text("OK", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade800, fontSize: 13.5)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}

