import 'package:flutter/material.dart';

class ColorStandardScreen extends StatefulWidget {
  final bool isEnglish;

  const ColorStandardScreen({super.key, required this.isEnglish});

  @override
  State<ColorStandardScreen> createState() => _ColorStandardScreenState();
}

class _ColorStandardScreenState extends State<ColorStandardScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedBreed = "Sasso Color (SA51A)";
  final TextEditingController _ageWeekCtrl = TextEditingController();

  bool _hasCalculated = false;

  String _displayBreed = "";
  int _displayAgeWeek = 0;
  double _bodyWeightG = 0.0;
  double _cumFeedIntakeG = 0.0;
  double _fcr = 0.0;

  final List<String> _breedOptions = [
    "Sasso Color (SA51A)",
    "Hubbard Color",
    "Tetra Color",
    "Sonali Color",
  ];

  void _calculateStandardData() {
    FocusScope.of(context).unfocus();

    final week = int.tryParse(_ageWeekCtrl.text.trim()) ?? 0;

    if (week < 1 || week > 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Data is only available for 1-7 weeks."
                : "ডাটা শুধুমাত্র ১-৭ সপ্তাহের জন্য উপলব্ধ।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    double weight = 0.0;
    double feed = 0.0;
    double fcrVal = 0.0;

    if (_selectedBreed.contains("Sasso Color")) {
      switch (week) {
        case 1:
          weight = 110.0;
          feed = 150.0;
          fcrVal = 1.36;
          break;
        case 2:
          weight = 260.0;
          feed = 410.0;
          fcrVal = 1.58;
          break;
        case 3:
          weight = 450.0;
          feed = 710.0;
          fcrVal = 1.58;
          break;
        case 4:
          weight = 680.0;
          feed = 1080.0;
          fcrVal = 1.59;
          break;
        case 5:
          weight = 930.0;
          feed = 1535.0;
          fcrVal = 1.65;
          break;
        case 6:
          weight = 1200.0;
          feed = 2050.0;
          fcrVal = 1.71;
          break;
        case 7:
          weight = 1480.0;
          feed = 2650.0;
          fcrVal = 1.79;
          break;
      }
    } else if (_selectedBreed.contains("Hubbard Color")) {
      switch (week) {
        case 1:
          weight = 110.0;
          feed = 150.0;
          fcrVal = 1.36;
          break;
        case 2:
          weight = 270.0;
          feed = 420.0;
          fcrVal = 1.55;
          break;
        case 3:
          weight = 460.0;
          feed = 710.0;
          fcrVal = 1.54;
          break;
        case 4:
          weight = 700.0;
          feed = 1100.0;
          fcrVal = 1.57;
          break;
        case 5:
          weight = 960.0;
          feed = 1546.0;
          fcrVal = 1.61;
          break;
        case 6:
          weight = 1240.0;
          feed = 2080.0;
          fcrVal = 1.67;
          break;
        case 7:
          weight = 1520.0;
          feed = 2680.0;
          fcrVal = 1.76;
          break;
      }
    } else if (_selectedBreed.contains("Tetra Color")) {
      switch (week) {
        case 1:
          weight = 110.0;
          feed = 160.0;
          fcrVal = 1.45;
          break;
        case 2:
          weight = 280.0;
          feed = 440.0;
          fcrVal = 1.57;
          break;
        case 3:
          weight = 490.0;
          feed = 770.0;
          fcrVal = 1.57;
          break;
        case 4:
          weight = 730.0;
          feed = 1170.0;
          fcrVal = 1.60;
          break;
        case 5:
          weight = 1000.0;
          feed = 1630.0;
          fcrVal = 1.63;
          break;
        case 6:
          weight = 1290.0;
          feed = 2170.0;
          fcrVal = 1.68;
          break;
        case 7:
          weight = 1580.0;
          feed = 2780.0;
          fcrVal = 1.76;
          break;
      }
    } else {
      // Sonali Color
      switch (week) {
        case 1:
          weight = 80.0;
          feed = 100.0;
          fcrVal = 1.25;
          break;
        case 2:
          weight = 170.0;
          feed = 250.0;
          fcrVal = 1.47;
          break;
        case 3:
          weight = 290.0;
          feed = 490.0;
          fcrVal = 1.69;
          break;
        case 4:
          weight = 450.0;
          feed = 830.0;
          fcrVal = 1.84;
          break;
        case 5:
          weight = 620.0;
          feed = 1283.0;
          fcrVal = 2.07;
          break;
        case 6:
          weight = 820.0;
          feed = 1880.0;
          fcrVal = 2.29;
          break;
        case 7:
          weight = 1040.0;
          feed = 2620.0;
          fcrVal = 2.52;
          break;
      }
    }

    setState(() {
      _displayBreed = _selectedBreed;
      _displayAgeWeek = week;
      _bodyWeightG = weight;
      _cumFeedIntakeG = feed;
      _fcr = fcrVal;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _ageWeekCtrl.clear();
      _selectedBreed = "Sasso Color (SA51A)";
      _hasCalculated = false;
    });
  }

  @override
  void dispose() {
    _ageWeekCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish
              ? "Color Standard Data"
              : "কমার্শিয়াল কালার বার্ড ডাটা",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEnglish
                          ? "Color Bird Standard Data"
                          : "কালার বার্ড স্ট্যান্ডার্ড ডাটা",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEnglish
                          ? "Data for popular commercial color bird breeds"
                          : "প্রচলিত সকল কালার বার্ড ডাটা",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEnglish ? "Color Breed:" : "কালার মুরগির জাত:",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedBreed,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: _breedOptions
                          .map((b) => DropdownMenuItem(value: b, child: Text(b)))
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

                    Text(
                      isEnglish ? "Bird Age (Weeks):" : "মুরগির বয়সঃ",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _ageWeekCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "5",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade700,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
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
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey.shade400,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
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
            const SizedBox(height: 16),

            Card(
              elevation: 2,
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
                          _buildLine(
                            "🐓",
                            "${isEnglish ? "Color Breed:" : "মুরগির জাত:"} $_displayBreed",
                          ),
                          _buildLine(
                            "📅",
                            "${isEnglish ? "Age:" : "বয়স:"} $_displayAgeWeek ${isEnglish ? "Weeks" : "সপ্তাহ"}",
                          ),
                          const SizedBox(height: 14),

                          _buildLine("📊", "Standard Data"),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "• Body Weight: ${_bodyWeightG.toStringAsFixed(1)} g",
                                  style: const TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "• Cumulative Feed Intake: ${_cumFeedIntakeG.toStringAsFixed(1)} g/bird",
                                  style: const TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "• FCR: ${_fcr.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          isEnglish
                              ? "Result will appear here"
                              : "Result will appear here",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
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

  Widget _buildLine(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 15)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
