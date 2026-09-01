import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/local_databank_models.dart';
import '../../../controller/local_databank_providers.dart';

class WeeklyBreederInputScreen extends ConsumerStatefulWidget {
  final LocalFlock flock;
  final bool isEnglish;

  const WeeklyBreederInputScreen({
    super.key,
    required this.flock,
    required this.isEnglish,
  });

  @override
  ConsumerState<WeeklyBreederInputScreen> createState() => _WeeklyBreederInputScreenState();
}

class _WeeklyBreederInputScreenState extends ConsumerState<WeeklyBreederInputScreen> {
  late TextEditingController _femaleWeightController;
  late TextEditingController _femaleUniformityController;
  late TextEditingController _maleWeightController;
  late TextEditingController _maleUniformityController;
  late TextEditingController _remarksController;

  int _currentWeek = 1;

  @override
  void initState() {
    super.initState();
    _femaleWeightController = TextEditingController();
    _femaleUniformityController = TextEditingController();
    _maleWeightController = TextEditingController();
    _maleUniformityController = TextEditingController();
    _remarksController = TextEditingController();

    // Calculate current week from flock start date
    final diffDays = DateTime.now().difference(widget.flock.startDate).inDays;
    _currentWeek = (diffDays / 7).floor() + 1;
    if (_currentWeek < 1) _currentWeek = 1;
  }

  @override
  void dispose() {
    _femaleWeightController.dispose();
    _femaleUniformityController.dispose();
    _maleWeightController.dispose();
    _maleUniformityController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  void _saveData() {
    final double femaleW = double.tryParse(_femaleWeightController.text) ?? 0.0;
    final double femaleU = double.tryParse(_femaleUniformityController.text) ?? 0.0;
    final double maleW = double.tryParse(_maleWeightController.text) ?? 0.0;
    final double maleU = double.tryParse(_maleUniformityController.text) ?? 0.0;
    final String remarks = _remarksController.text.trim();

    final targetFemaleW = getBreederFemaleTargetWeight(_currentWeek);

    final log = LocalBreederLog(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      flockId: widget.flock.id,
      weekNumber: _currentWeek,
      date: DateTime.now(),
      avgWeightGrams: femaleW,
      targetWeightGrams: targetFemaleW,
      uniformityPercent: femaleU,
      femaleWeightGrams: femaleW,
      femaleUniformityPercent: femaleU,
      maleWeightGrams: maleW,
      maleUniformityPercent: maleU,
      remarks: remarks,
    );

    ref.read(breederMonitorProvider.notifier).addLog(log);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: Text(
          isEng ? "Weekly Weight and Uniformity" : "সাপ্তাহিক ওজন ও ইউনিফরমিটি",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : const Color(0xFF1E293B),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Subtitle
              Center(
                child: Text(
                  isEng
                      ? "Record weekly body weight and flock uniformity"
                      : "সাপ্তাহিক শারীরিক ওজন এবং ইউনিফরমিটি সংরক্ষণ করুন",
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.white60 : const Color(0xFF64748B),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Current Week Status Pill Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.green.shade900.withValues(alpha: 0.3)
                      : const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? Colors.green.shade700 : const Color(0xFFC8E6C9),
                  ),
                ),
                child: Center(
                  child: Text(
                    isEng
                        ? "Current Week: $_currentWeek | Input Allowed"
                        : "বর্তমান সপ্তাহ: $_currentWeek | তথ্য গ্রহণ সচল",
                    style: TextStyle(
                      color: isDark ? Colors.green.shade300 : const Color(0xFF2E7D32),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Female Input Card
              _buildInputCard(
                context: context,
                title: isEng ? "Female" : "ফিমেল (মাদী)",
                titleColor: const Color(0xFFB91C1C),
                weightController: _femaleWeightController,
                weightLabel: isEng ? "Female Body Weight (g)" : "ফিমেল বডি ওয়েট (গ্রাম)",
                weightHint: isEng ? "Enter female weight" : "ফিমেল ওজন লিখুন",
                uniformityController: _femaleUniformityController,
                uniformityLabel: isEng ? "Female Uniformity (%)" : "ফিমেল ইউনিফরমিটি (%)",
                uniformityHint: isEng ? "Enter female uniformity" : "ফিমেল ইউনিফরমিটি লিখুন",
              ),
              const SizedBox(height: 16),

              // Male Input Card
              _buildInputCard(
                context: context,
                title: isEng ? "Male" : "মেল (নর)",
                titleColor: const Color(0xFF1D4ED8),
                weightController: _maleWeightController,
                weightLabel: isEng ? "Male Body Weight (g)" : "মেল বডি ওয়েট (গ্রাম)",
                weightHint: isEng ? "Enter male weight" : "মেল ওজন লিখুন",
                uniformityController: _maleUniformityController,
                uniformityLabel: isEng ? "Male Uniformity (%)" : "মেল ইউনিফরমিটি (%)",
                uniformityHint: isEng ? "Enter male uniformity" : "মেল ইউনিফরমিটি লিখুন",
              ),
              const SizedBox(height: 16),

              // Remarks Input Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEng ? "Remarks" : "মন্তব্য",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _remarksController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: isEng
                            ? "Write weekly observations or remarks"
                            : "সাপ্তাহিক পর্যবেক্ষণ বা মন্তব্য লিখুন",
                        hintStyle: TextStyle(
                          color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.orange, width: 1.5),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Save Weekly Data Button
              ElevatedButton(
                onPressed: _saveData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8C00),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  isEng ? "Save Weekly Data" : "সাপ্তাহিক ডাটা সংরক্ষণ করুন",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required BuildContext context,
    required String title,
    required Color titleColor,
    required TextEditingController weightController,
    required String weightLabel,
    required String weightHint,
    required TextEditingController uniformityController,
    required String uniformityLabel,
    required String uniformityHint,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 14),

          // Weight Input
          Text(
            weightLabel,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : const Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: weightHint,
              hintStyle: TextStyle(
                color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.orange, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
          const SizedBox(height: 14),

          // Uniformity Input
          Text(
            uniformityLabel,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : const Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: uniformityController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: uniformityHint,
              hintStyle: TextStyle(
                color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.orange, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
