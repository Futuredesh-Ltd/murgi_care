import 'package:flutter/material.dart';

enum SkipFeedProgram { p7_7, p6_7, p5_7, p4_7 }

class SkipFeedCalculatorScreen extends StatefulWidget {
  final bool isEnglish;

  const SkipFeedCalculatorScreen({super.key, required this.isEnglish});

  @override
  State<SkipFeedCalculatorScreen> createState() => _SkipFeedCalculatorScreenState();
}

class _SkipFeedCalculatorScreenState extends State<SkipFeedCalculatorScreen> {
  bool get isEnglish => widget.isEnglish;

  final TextEditingController _birdCountCtrl = TextEditingController();
  final TextEditingController _feedPerBirdCtrl = TextEditingController();

  SkipFeedProgram _selectedProgram = SkipFeedProgram.p7_7;

  bool _hasCalculated = false;

  double _feedPerFeedingDayKg = 0.0;
  double _feedPerBirdAdjustedG = 0.0;
  double _totalWeeklyFeedKg = 0.0;

  void _calculateFeed() {
    FocusScope.of(context).unfocus();

    final count = double.tryParse(_birdCountCtrl.text.trim()) ?? 0.0;
    final feedG = double.tryParse(_feedPerBirdCtrl.text.trim()) ?? 0.0;

    if (count <= 0 || feedG <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter bird quantity and feed per bird."
                : "অনুগ্রহ করে মুরগির সংখ্যা এবং ফিডের পরিমাণ লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    int feedingDays = 7;
    if (_selectedProgram == SkipFeedProgram.p6_7) {
      feedingDays = 6;
    } else if (_selectedProgram == SkipFeedProgram.p5_7) {
      feedingDays = 5;
    } else if (_selectedProgram == SkipFeedProgram.p4_7) {
      feedingDays = 4;
    }

    // Weekly feed = count * feedG * 7
    final weeklyTotalG = count * feedG * 7.0;

    // Feed on feeding days = weeklyTotalG / feedingDays
    final feedOnFeedingDayG = weeklyTotalG / feedingDays;
    final feedPerBirdOnFeedingDayG = feedOnFeedingDayG / count;

    setState(() {
      _feedPerFeedingDayKg = feedOnFeedingDayG / 1000.0;
      _feedPerBirdAdjustedG = feedPerBirdOnFeedingDayG;
      _totalWeeklyFeedKg = weeklyTotalG / 1000.0;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _birdCountCtrl.clear();
      _feedPerBirdCtrl.clear();
      _selectedProgram = SkipFeedProgram.p7_7;
      _hasCalculated = false;
      _feedPerFeedingDayKg = 0.0;
      _feedPerBirdAdjustedG = 0.0;
      _totalWeeklyFeedKg = 0.0;
    });
  }

  @override
  void dispose() {
    _birdCountCtrl.dispose();
    _feedPerBirdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Skip Feed Program" : "স্কিপ ফিড হিসাব",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Header from screenshot
            Text(
              isEnglish
                  ? "Skip Feed Program Feed Calculator"
                  : "স্কিপ ফিড প্রোগ্রাম অনুযায়ী ফিড হিসাব",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            const SizedBox(height: 16),

            // Top Inputs Container
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _birdCountCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: isEnglish ? "Bird quantity" : "মুরগির সংখ্যা",
                      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _feedPerBirdCtrl,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: isEnglish
                          ? "Feed (gram/bird/day)"
                          : "ফিড (গ্রাম/মুরগি/দিন)",
                      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 1.5),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Program Selection Section Header
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                isEnglish
                    ? "Select Skip Feed Program"
                    : "স্কিপ ফিড প্রোগ্রাম নির্বাচন করুন",
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Radio List for Programs
            _buildRadioOption(
              program: SkipFeedProgram.p7_7,
              label: isEnglish ? "7/7 Program" : "৭/৭ প্রোগ্রাম",
            ),
            _buildRadioOption(
              program: SkipFeedProgram.p6_7,
              label: isEnglish ? "6/7 Program" : "৬/৭ প্রোগ্রাম",
            ),
            _buildRadioOption(
              program: SkipFeedProgram.p5_7,
              label: isEnglish ? "5/7 Program" : "৫/৭ প্রোগ্রাম",
            ),
            _buildRadioOption(
              program: SkipFeedProgram.p4_7,
              label: isEnglish ? "4/7 Program" : "৪/৭ প্রোগ্রাম",
            ),

            const SizedBox(height: 16),

            // Action Buttons Row (CALCULATE & CLEAR)
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade700,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                      ),
                      onPressed: _calculateFeed,
                      child: Text(
                        isEnglish ? "CALCULATE" : "CALCULATE",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange.shade700,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                      ),
                      onPressed: _clearForm,
                      child: Text(
                        isEnglish ? "CLEAR" : "CLEAR",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Result Display Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: _hasCalculated
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("🐔 ", style: TextStyle(fontSize: 18)),
                            Text(
                              isEnglish
                                  ? "1 Day Total Feed (Feeding Day):"
                                  : "১ দিনের মোট ফিড",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${_feedPerFeedingDayKg.toStringAsFixed(2)} কেজি",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isEnglish
                                  ? "Feed per bird (feeding day):"
                                  : "মুরগি প্রতি খাবার (খাওয়ানোর দিনে):",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "${_feedPerBirdAdjustedG.toStringAsFixed(1)} গ্রাম",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isEnglish
                                  ? "Total 7-Day Weekly Feed:"
                                  : "সপ্তাহের মোট ফিড (৭ দিনে):",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "${_totalWeeklyFeedKg.toStringAsFixed(2)} কেজি",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        isEnglish
                            ? "Results will show here"
                            : "ফলাফল এখানে দেখাবে",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption({
    required SkipFeedProgram program,
    required String label,
  }) {
    final isSelected = _selectedProgram == program;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedProgram = program;
          if (_hasCalculated) {
            _calculateFeed();
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isSelected ? Colors.green.shade800 : Colors.grey.shade600,
              size: 22,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
