import 'package:flutter/material.dart';

class DuckStandardScreen extends StatefulWidget {
  final bool isEnglish;

  const DuckStandardScreen({super.key, required this.isEnglish});

  @override
  State<DuckStandardScreen> createState() => _DuckStandardScreenState();
}

class _DuckStandardScreenState extends State<DuckStandardScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedBreed = "Cherry Valley Duck PS";
  final TextEditingController _ageWeekCtrl = TextEditingController();

  bool _hasCalculated = false;

  String _displayBreed = "";
  int _displayAgeWeek = 0;
  double _femaleBodyWeightG = 0.0;
  double _maleBodyWeightG = 0.0;
  double _femaleFeedG = 0.0;
  double _maleFeedG = 0.0;

  final List<String> _breedOptions = [
    "Cherry Valley Duck PS",
    "Pekin Duck PS",
    "Khaki Campbell Duck",
    "Muscovy Duck PS",
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

    double femaleBw = 0.0;
    double maleBw = 0.0;
    double femaleFeed = 0.0;
    double maleFeed = 0.0;

    if (_selectedBreed == "Cherry Valley Duck PS") {
      femaleBw = _getCherryValleyFemaleBw(week);
      maleBw = _getCherryValleyMaleBw(week);
      femaleFeed = _getCherryValleyFemaleFeed(week);
      maleFeed = _getCherryValleyMaleFeed(week);
    } else if (_selectedBreed == "Pekin Duck PS") {
      femaleBw = _getPekinFemaleBw(week);
      maleBw = _getPekinMaleBw(week);
      femaleFeed = _getPekinFemaleFeed(week);
      maleFeed = _getPekinMaleFeed(week);
    } else if (_selectedBreed == "Khaki Campbell Duck") {
      femaleBw = _getKhakiFemaleBw(week);
      maleBw = _getKhakiMaleBw(week);
      femaleFeed = _getKhakiFemaleFeed(week);
      maleFeed = _getKhakiMaleFeed(week);
    } else {
      // Muscovy Duck PS
      femaleBw = _getMuscovyFemaleBw(week);
      maleBw = _getMuscovyMaleBw(week);
      femaleFeed = _getMuscovyFemaleFeed(week);
      maleFeed = _getMuscovyMaleFeed(week);
    }

    setState(() {
      _displayBreed = _selectedBreed;
      _displayAgeWeek = week;
      _femaleBodyWeightG = femaleBw;
      _maleBodyWeightG = maleBw;
      _femaleFeedG = femaleFeed;
      _maleFeedG = maleFeed;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _ageWeekCtrl.clear();
      _selectedBreed = "Cherry Valley Duck PS";
      _hasCalculated = false;
    });
  }

  // --- Cherry Valley Duck PS ---
  double _getCherryValleyFemaleBw(int week) {
    if (week <= 1) return 170.0;
    if (week == 2) return 420.0;
    if (week == 3) return 720.0;
    if (week == 4) return 980.0;
    if (week == 5) return 1250.0; // Screenshot match
    if (week <= 10) return 1250.0 + (week - 5) * 210.0;
    if (week <= 20) return 2300.0 + (week - 10) * 80.0;
    return 3100.0 + (week - 20) * 15.0;
  }

  double _getCherryValleyMaleBw(int week) {
    if (week <= 1) return 190.0;
    if (week == 2) return 510.0;
    if (week == 3) return 890.0;
    if (week == 4) return 1280.0;
    if (week == 5) return 1650.0; // Screenshot match
    if (week <= 10) return 1650.0 + (week - 5) * 280.0;
    if (week <= 20) return 3050.0 + (week - 10) * 100.0;
    return 4050.0 + (week - 20) * 15.0;
  }

  double _getCherryValleyFemaleFeed(int week) {
    if (week <= 1) return 25.0;
    if (week == 2) return 42.0;
    if (week == 3) return 58.0;
    if (week == 4) return 74.0;
    if (week == 5) return 88.0; // Screenshot match
    if (week <= 10) return 88.0 + (week - 5) * 8.0;
    if (week <= 20) return 128.0 + (week - 10) * 4.0;
    return 168.0;
  }

  double _getCherryValleyMaleFeed(int week) {
    if (week <= 1) return 30.0;
    if (week == 2) return 50.0;
    if (week == 3) return 70.0;
    if (week == 4) return 90.0;
    if (week == 5) return 108.0; // Screenshot match
    if (week <= 10) return 108.0 + (week - 5) * 9.0;
    if (week <= 20) return 153.0 + (week - 10) * 4.0;
    return 193.0;
  }

  // --- Pekin Duck PS ---
  double _getPekinFemaleBw(int week) {
    if (week <= 1) return 160.0;
    if (week == 2) return 400.0;
    if (week == 3) return 690.0;
    if (week == 4) return 930.0;
    if (week == 5) return 1180.0; // Screenshot match
    if (week <= 10) return 1180.0 + (week - 5) * 200.0;
    if (week <= 20) return 2180.0 + (week - 10) * 80.0;
    return 2980.0 + (week - 20) * 15.0;
  }

  double _getPekinMaleBw(int week) {
    if (week <= 1) return 180.0;
    if (week == 2) return 480.0;
    if (week == 3) return 850.0;
    if (week == 4) return 1220.0;
    if (week == 5) return 1580.0; // Screenshot match
    if (week <= 10) return 1580.0 + (week - 5) * 270.0;
    if (week <= 20) return 2930.0 + (week - 10) * 95.0;
    return 3880.0 + (week - 20) * 15.0;
  }

  double _getPekinFemaleFeed(int week) {
    if (week <= 1) return 24.0;
    if (week == 2) return 40.0;
    if (week == 3) return 55.0;
    if (week == 4) return 70.0;
    if (week == 5) return 84.0; // Screenshot match
    if (week <= 10) return 84.0 + (week - 5) * 7.5;
    if (week <= 20) return 121.5 + (week - 10) * 4.0;
    return 161.5;
  }

  double _getPekinMaleFeed(int week) {
    if (week <= 1) return 28.0;
    if (week == 2) return 48.0;
    if (week == 3) return 67.0;
    if (week == 4) return 87.0;
    if (week == 5) return 105.0; // Screenshot match
    if (week <= 10) return 105.0 + (week - 5) * 8.5;
    if (week <= 20) return 147.5 + (week - 10) * 4.0;
    return 187.5;
  }

  // --- Khaki Campbell Duck ---
  double _getKhakiFemaleBw(int week) {
    if (week <= 1) return 90.0;
    if (week == 2) return 200.0;
    if (week == 3) return 320.0;
    if (week == 4) return 440.0;
    if (week == 5) return 560.0; // Screenshot match
    if (week <= 10) return 560.0 + (week - 5) * 100.0;
    if (week <= 20) return 1060.0 + (week - 10) * 55.0;
    return 1610.0 + (week - 20) * 10.0;
  }

  double _getKhakiMaleBw(int week) {
    if (week <= 1) return 105.0;
    if (week == 2) return 250.0;
    if (week == 3) return 400.0;
    if (week == 4) return 560.0;
    if (week == 5) return 720.0; // Screenshot match
    if (week <= 10) return 720.0 + (week - 5) * 125.0;
    if (week <= 20) return 1345.0 + (week - 10) * 65.0;
    return 1995.0 + (week - 20) * 10.0;
  }

  double _getKhakiFemaleFeed(int week) {
    if (week <= 1) return 15.0;
    if (week == 2) return 24.0;
    if (week == 3) return 33.0;
    if (week == 4) return 42.0;
    if (week == 5) return 50.0; // Screenshot match
    if (week <= 10) return 50.0 + (week - 5) * 5.0;
    if (week <= 20) return 75.0 + (week - 10) * 4.5;
    return 120.0;
  }

  double _getKhakiMaleFeed(int week) {
    if (week <= 1) return 18.0;
    if (week == 2) return 29.0;
    if (week == 3) return 40.0;
    if (week == 4) return 51.0;
    if (week == 5) return 62.0; // Screenshot match
    if (week <= 10) return 62.0 + (week - 5) * 6.0;
    if (week <= 20) return 92.0 + (week - 10) * 5.0;
    return 142.0;
  }

  // --- Muscovy Duck PS ---
  double _getMuscovyFemaleBw(int week) {
    if (week <= 1) return 150.0;
    if (week == 2) return 370.0;
    if (week == 3) return 640.0;
    if (week == 4) return 870.0;
    if (week == 5) return 1100.0;
    if (week <= 10) return 1100.0 + (week - 5) * 180.0;
    if (week <= 20) return 2000.0 + (week - 10) * 70.0;
    return 2700.0 + (week - 20) * 15.0;
  }

  double _getMuscovyMaleBw(int week) {
    if (week <= 1) return 170.0;
    if (week == 2) return 440.0;
    if (week == 3) return 790.0;
    if (week == 4) return 1140.0;
    if (week == 5) return 1500.0;
    if (week <= 10) return 1500.0 + (week - 5) * 260.0;
    if (week <= 20) return 2800.0 + (week - 10) * 110.0;
    return 3900.0 + (week - 20) * 20.0;
  }

  double _getMuscovyFemaleFeed(int week) {
    if (week <= 1) return 22.0;
    if (week == 2) return 36.0;
    if (week == 3) return 50.0;
    if (week == 4) return 64.0;
    if (week == 5) return 78.0;
    if (week <= 10) return 78.0 + (week - 5) * 7.0;
    if (week <= 20) return 113.0 + (week - 10) * 3.5;
    return 148.0;
  }

  double _getMuscovyMaleFeed(int week) {
    if (week <= 1) return 26.0;
    if (week == 2) return 44.0;
    if (week == 3) return 62.0;
    if (week == 4) return 80.0;
    if (week == 5) return 98.0;
    if (week <= 10) return 98.0 + (week - 5) * 8.0;
    if (week <= 20) return 138.0 + (week - 10) * 4.0;
    return 178.0;
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
          isEnglish ? "Duck PS Standard Data" : "পিএস হাঁসের স্ট্যান্ডার্ড ডাটা",
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
                      isEnglish ? "Duck PS Standard Data" : "পিএস হাঁসের স্ট্যান্ডার্ড ডাটা",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isEnglish
                          ? "Pekin, Muscovy & Cherry Valley duck standard data"
                          : "Pekin, Muscovy ও Cherry Valley হাঁসের স্ট্যান্ডার্ড ডাটা",
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
                      isEnglish ? "Select Duck Breed" : "হাঁসের জাত নির্বাচন করুন",
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
                      isEnglish ? "Duck Age (Weeks)" : "হাঁসের বয়স (সপ্তাহ)",
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

                    // Calculate Button (স্ট্যান্ডার্ড দেখুন)
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
                          isEnglish ? "View Standards" : "স্ট্যান্ডার্ড দেখুন",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Clear Button (মুছুন)
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
                          isEnglish ? "Clear" : "মুছুন",
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

            // Output Result Container with Header "ফলাফল"
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEnglish ? "Results" : "ফলাফল",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : const Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF0F172A) : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark ? Colors.white12 : Colors.grey.shade200,
                        ),
                      ),
                      child: _hasCalculated
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("🦆", style: TextStyle(fontSize: 16)),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        "${isEnglish ? "Duck Breed:" : "হাঁসের জাত:"} $_displayBreed",
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
                                      "Rearing Standard Data",
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
                                        "• Female Body Weight: ${_femaleBodyWeightG.toStringAsFixed(1)} g",
                                        style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w600,
                                          color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
                                          height: 1.4,
                                        ),
                                      ),
                                      Text(
                                        "• Male Body Weight: ${_maleBodyWeightG.toStringAsFixed(1)} g",
                                        style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w600,
                                          color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
                                          height: 1.4,
                                        ),
                                      ),
                                      Text(
                                        "• Female Feed: ${_femaleFeedG.toStringAsFixed(1)} g/day",
                                        style: TextStyle(
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w600,
                                          color: isDark ? Colors.grey.shade200 : const Color(0xFF1E293B),
                                          height: 1.4,
                                        ),
                                      ),
                                      Text(
                                        "• Male Feed: ${_maleFeedG.toStringAsFixed(1)} g/day",
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
                  ],
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
