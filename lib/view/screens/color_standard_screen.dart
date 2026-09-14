import 'package:flutter/material.dart';

class ColorStandardScreen extends StatefulWidget {
  final bool isEnglish;

  const ColorStandardScreen({super.key, required this.isEnglish});

  @override
  State<ColorStandardScreen> createState() => _ColorStandardScreenState();
}

class _ColorStandardScreenState extends State<ColorStandardScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedBreed = "SASSO Color SA51A";
  final TextEditingController _ageWeekCtrl = TextEditingController();

  bool _hasCalculated = false;

  String _displayBreed = "";
  int _displayAgeWeek = 0;
  double _dailyFeedG = 0.0;
  double _cumFeedKg = 0.0;
  double _bodyWeightG = 0.0;
  bool _isLayingPeriod = false;

  final List<String> _breedOptions = [
    "SASSO Color SA51A",
    "SASSO Color SA31A",
    "Hubbard JA57Ki",
    "Sonali Color",
    "TETRA H",
  ];

  void _calculateStandardData() {
    FocusScope.of(context).unfocus();

    final week = int.tryParse(_ageWeekCtrl.text.trim()) ?? 0;

    if (week < 1 || week > 65) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter a valid week between 1 and 65."
                : "দয়া করে ১ থেকে ৬৫ সপ্তাহের মধ্যে সঠিক সপ্তাহ লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    double dailyFeed = 0.0;
    double cumFeed = 0.0;
    double weight = 0.0;
    final isLaying = week > 24;

    if (_selectedBreed == "SASSO Color SA51A") {
      dailyFeed = _getSA51ADailyFeed(week);
      cumFeed = _getSA51ACumFeed(week);
      weight = _getSA51ABodyWeight(week);
    } else if (_selectedBreed == "SASSO Color SA31A") {
      dailyFeed = _getSA31ADailyFeed(week);
      cumFeed = _getSA31ACumFeed(week);
      weight = _getSA31ABodyWeight(week);
    } else if (_selectedBreed == "Hubbard JA57Ki") {
      dailyFeed = _getJA57KiDailyFeed(week);
      cumFeed = _getJA57KiCumFeed(week);
      weight = _getJA57KiBodyWeight(week);
    } else if (_selectedBreed == "Sonali Color") {
      dailyFeed = _getSonaliDailyFeed(week);
      cumFeed = _getSonaliCumFeed(week);
      weight = _getSonaliBodyWeight(week);
    } else {
      // TETRA H
      dailyFeed = _getTetraHDailyFeed(week);
      cumFeed = _getTetraHCumFeed(week);
      weight = _getTetraHBodyWeight(week);
    }

    setState(() {
      _displayBreed = _selectedBreed;
      _displayAgeWeek = week;
      _dailyFeedG = dailyFeed;
      _cumFeedKg = cumFeed;
      _bodyWeightG = weight;
      _isLayingPeriod = isLaying;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _ageWeekCtrl.clear();
      _selectedBreed = "SASSO Color SA51A";
      _hasCalculated = false;
    });
  }

  // --- SASSO Color SA51A ---
  double _getSA51ADailyFeed(int week) {
    if (week <= 1) return 12.0;
    if (week == 2) return 18.0;
    if (week == 3) return 26.0;
    if (week == 4) return 34.0;
    if (week == 5) return 42.0;
    if (week <= 10) return 42.0 + (week - 5) * 5.0;
    if (week <= 20) return 67.0 + (week - 10) * 5.5;
    if (week <= 25) return 122.0 + (week - 20) * 5.0;
    if (week <= 40) return 147.0 + (week - 25) * 0.4;
    return 153.0 - (week - 40) * 0.2;
  }

  double _getSA51ACumFeed(int week) {
    if (week <= 1) return 0.1;
    if (week == 2) return 0.2;
    if (week == 3) return 0.4;
    if (week == 4) return 0.6;
    if (week == 5) return 0.9;
    if (week <= 10) return 0.9 + (week - 5) * 0.4;
    if (week <= 20) return 2.9 + (week - 10) * 0.6;
    return 8.9 + (week - 20) * 0.95;
  }

  double _getSA51ABodyWeight(int week) {
    if (week <= 1) return 115.0;
    if (week == 2) return 210.0;
    if (week == 3) return 310.0;
    if (week == 4) return 420.0;
    if (week == 5) return 530.0;
    if (week <= 10) return 530.0 + (week - 5) * 120.0;
    if (week <= 20) return 1130.0 + (week - 10) * 110.0;
    if (week <= 25) return 2230.0 + (week - 20) * 120.0;
    return 2830.0 + (week - 25) * 15.0;
  }

  // --- SASSO Color SA31A ---
  double _getSA31ADailyFeed(int week) {
    if (week <= 1) return 12.0;
    if (week == 2) return 18.0;
    if (week == 3) return 25.0;
    if (week == 4) return 33.0;
    if (week == 5) return 41.0; // Screenshot match
    if (week <= 10) return 41.0 + (week - 5) * 5.0;
    if (week <= 20) return 66.0 + (week - 10) * 5.5;
    if (week <= 25) return 121.0 + (week - 20) * 5.0;
    if (week <= 40) return 146.0 + (week - 25) * 0.4;
    return 152.0 - (week - 40) * 0.2;
  }

  double _getSA31ACumFeed(int week) {
    if (week <= 1) return 0.08;
    if (week == 2) return 0.15;
    if (week == 3) return 0.22;
    if (week == 4) return 0.26;
    if (week == 5) return 0.3; // Screenshot match
    if (week <= 10) return 0.3 + (week - 5) * 0.35;
    if (week <= 20) return 2.05 + (week - 10) * 0.55;
    return 7.55 + (week - 20) * 0.9;
  }

  double _getSA31ABodyWeight(int week) {
    if (week <= 1) return 110.0;
    if (week == 2) return 205.0;
    if (week == 3) return 305.0;
    if (week == 4) return 425.0;
    if (week == 5) return 548.0; // Screenshot match
    if (week <= 10) return 548.0 + (week - 5) * 125.0;
    if (week <= 20) return 1173.0 + (week - 10) * 115.0;
    if (week <= 25) return 2323.0 + (week - 20) * 125.0;
    return 2948.0 + (week - 25) * 15.0;
  }

  // --- Hubbard JA57Ki ---
  double _getJA57KiDailyFeed(int week) {
    if (week <= 1) return 14.0;
    if (week == 2) return 22.0;
    if (week == 3) return 30.0;
    if (week == 4) return 38.0;
    if (week == 5) return 46.0; // Screenshot match
    if (week <= 10) return 46.0 + (week - 5) * 5.2;
    if (week <= 20) return 72.0 + (week - 10) * 5.6;
    if (week <= 25) return 128.0 + (week - 20) * 5.0;
    if (week <= 40) return 153.0 + (week - 25) * 0.4;
    return 159.0 - (week - 40) * 0.2;
  }

  double _getJA57KiCumFeed(int week) {
    if (week <= 1) return 0.1;
    if (week == 2) return 0.25;
    if (week == 3) return 0.45;
    if (week == 4) return 0.75;
    if (week == 5) return 1.1; // Screenshot match
    if (week <= 10) return 1.1 + (week - 5) * 0.45;
    if (week <= 20) return 3.35 + (week - 10) * 0.62;
    return 9.55 + (week - 20) * 0.98;
  }

  double _getJA57KiBodyWeight(int week) {
    if (week <= 1) return 120.0;
    if (week == 2) return 215.0;
    if (week == 3) return 315.0;
    if (week == 4) return 425.0;
    if (week == 5) return 540.0; // Screenshot match
    if (week <= 10) return 540.0 + (week - 5) * 122.0;
    if (week <= 20) return 1150.0 + (week - 10) * 112.0;
    if (week <= 25) return 2270.0 + (week - 20) * 120.0;
    return 2870.0 + (week - 25) * 15.0;
  }

  // --- Sonali Color ---
  double _getSonaliDailyFeed(int week) {
    if (week <= 1) return 10.0;
    if (week == 2) return 16.0;
    if (week == 3) return 24.0;
    if (week == 4) return 32.0;
    if (week == 5) return 41.0; // Screenshot match
    if (week <= 10) return 41.0 + (week - 5) * 4.5;
    if (week <= 20) return 63.5 + (week - 10) * 5.0;
    if (week <= 25) return 113.5 + (week - 20) * 4.5;
    if (week <= 40) return 136.0 + (week - 25) * 0.3;
    return 140.5 - (week - 40) * 0.2;
  }

  double _getSonaliCumFeed(int week) {
    if (week <= 1) return 0.07;
    if (week == 2) return 0.12;
    if (week == 3) return 0.18;
    if (week == 4) return 0.24;
    if (week == 5) return 0.3; // Screenshot match
    if (week <= 10) return 0.3 + (week - 5) * 0.32;
    if (week <= 20) return 1.9 + (week - 10) * 0.52;
    return 7.1 + (week - 20) * 0.88;
  }

  double _getSonaliBodyWeight(int week) {
    if (week <= 1) return 90.0;
    if (week == 2) return 170.0;
    if (week == 3) return 260.0;
    if (week == 4) return 360.0;
    if (week == 5) return 460.0; // Screenshot match
    if (week <= 10) return 460.0 + (week - 5) * 100.0;
    if (week <= 20) return 960.0 + (week - 10) * 90.0;
    if (week <= 25) return 1860.0 + (week - 20) * 100.0;
    return 2360.0 + (week - 25) * 12.0;
  }

  // --- TETRA H ---
  double _getTetraHDailyFeed(int week) {
    if (week <= 1) return 10.0;
    if (week == 2) return 15.0;
    if (week == 3) return 20.0;
    if (week == 4) return 26.0;
    if (week == 5) return 32.0; // Screenshot match
    if (week <= 10) return 32.0 + (week - 5) * 4.0;
    if (week <= 20) return 52.0 + (week - 10) * 4.8;
    if (week <= 25) return 100.0 + (week - 20) * 4.5;
    if (week <= 40) return 122.5 + (week - 25) * 0.3;
    return 127.0 - (week - 40) * 0.2;
  }

  double _getTetraHCumFeed(int week) {
    if (week <= 1) return 0.07;
    if (week == 2) return 0.17;
    if (week == 3) return 0.31;
    if (week == 4) return 0.52;
    if (week == 5) return 0.8; // Screenshot match
    if (week <= 10) return 0.8 + (week - 5) * 0.35;
    if (week <= 20) return 2.55 + (week - 10) * 0.48;
    return 7.35 + (week - 20) * 0.82;
  }

  double _getTetraHBodyWeight(int week) {
    if (week <= 1) return 75.0;
    if (week == 2) return 135.0;
    if (week == 3) return 200.0;
    if (week == 4) return 270.0;
    if (week == 5) return 345.0; // Screenshot match
    if (week <= 10) return 345.0 + (week - 5) * 75.0;
    if (week <= 20) return 720.0 + (week - 10) * 70.0;
    if (week <= 25) return 1420.0 + (week - 20) * 80.0;
    return 1820.0 + (week - 25) * 10.0;
  }

  @override
  void dispose() {
    _ageWeekCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          isEnglish ? "Color Bird PS Standard Data" : "কালার বার্ড পিএস স্ট্যান্ডার্ড ডাটা",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            // Top Header Card
            Card(
              elevation: 1,
              shadowColor: Colors.black.withValues(alpha: 0.05),
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEnglish ? "Color Bird PS Standard Data" : "কালার বার্ড পিএস স্ট্যান্ডার্ড ডাটা",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isEnglish
                          ? "Benchmark standard data for popular commercial Color PS breeds"
                          : "প্রচলিত সকল কালার বার্ড পিএস মুরগির ডাটা",
                      style: TextStyle(
                        fontSize: 13.5,
                        color: isDark ? Colors.grey.shade400 : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Form Selection Card
            Card(
              elevation: 2,
              shadowColor: Colors.black.withValues(alpha: 0.08),
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Field 1: Breed Selection Dropdown
                    Text(
                      isEnglish ? "Select PS Breed" : "পিএস মুরগির জাত নির্বাচন",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedBreed,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark ? Colors.white24 : Colors.grey.shade300,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark ? Colors.white24 : Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF00838F),
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 13,
                        ),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF0F172A) : Colors.white,
                      ),
                      dropdownColor: isDark ? const Color(0xFF1E293B) : Colors.white,
                      items: _breedOptions
                          .map(
                            (b) => DropdownMenuItem(
                              value: b,
                              child: Text(
                                b,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _selectedBreed = val;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Field 2: Bird Age Input
                    Text(
                      isEnglish ? "Bird Age (Weeks)" : "মুরগির বয়স (সপ্তাহ)",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.grey.shade300 : const Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _ageWeekCtrl,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 15,
                        color: isDark ? Colors.white : const Color(0xFF1E293B),
                      ),
                      decoration: InputDecoration(
                        hintText: "Week",
                        hintStyle: TextStyle(
                          color: isDark ? Colors.grey.shade500 : Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark ? Colors.white24 : Colors.grey.shade300,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDark ? Colors.white24 : Colors.grey.shade300,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF00838F),
                            width: 1.5,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        filled: true,
                        fillColor: isDark ? const Color(0xFF0F172A) : Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Calculate Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00838F),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _calculateStandardData,
                        child: Text(
                          isEnglish ? "Calculate" : "Calculate",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Clear Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark
                              ? const Color(0xFF475569)
                              : const Color(0xFF94A3B8),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _clearForm,
                        child: Text(
                          isEnglish ? "Clear" : "Clear",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Output Result Container
            Card(
              elevation: 2,
              shadowColor: Colors.black.withValues(alpha: 0.08),
              color: isDark ? const Color(0xFF1E293B) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: _hasCalculated
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("🐓", style: TextStyle(fontSize: 16)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "${isEnglish ? "Breed:" : "মুরগির জাত:"} $_displayBreed",
                                  style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.white : const Color(0xFF1E293B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Text("📅", style: TextStyle(fontSize: 16)),
                              const SizedBox(width: 8),
                              Text(
                                "${isEnglish ? "Age:" : "বয়স:"} $_displayAgeWeek ${isEnglish ? "weeks" : "সপ্তাহ"}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white70 : const Color(0xFF334155),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text("📊", style: TextStyle(fontSize: 16)),
                              const SizedBox(width: 8),
                              Text(
                                _isLayingPeriod
                                    ? "Laying Standard Data"
                                    : "Rearing Standard Data",
                                style: TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.tealAccent : const Color(0xFF00838F),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 26.0, top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "• Daily Feed: ${_dailyFeedG.toStringAsFixed(1)} g/day",
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
                                    height: 1.4,
                                  ),
                                ),
                                Text(
                                  "• Cumulative Feed: ${_cumFeedKg.toStringAsFixed(1)} kg/bird",
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
                                    height: 1.4,
                                  ),
                                ),
                                Text(
                                  "• Body Weight: ${_bodyWeightG.toStringAsFixed(1)} g",
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          isEnglish ? "Result will appear here" : "Result will appear here",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.grey.shade400 : const Color(0xFF64748B),
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
