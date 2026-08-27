import 'package:flutter/material.dart';

class BroilerStandardScreen extends StatefulWidget {
  final bool isEnglish;

  const BroilerStandardScreen({super.key, required this.isEnglish});

  @override
  State<BroilerStandardScreen> createState() => _BroilerStandardScreenState();
}

class _BroilerStandardScreenState extends State<BroilerStandardScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedBreed = "Indian River (IR)";
  final TextEditingController _ageWeekCtrl = TextEditingController();

  bool _hasCalculated = false;

  String _displayBreed = "";
  int _displayAgeWeek = 0;
  double _bodyWeightG = 0.0;
  double _cumFeedIntakeG = 0.0;
  double _fcr = 0.0;

  final List<String> _breedOptions = [
    "Indian River (IR)",
    "Cobb 500",
    "Ross 308",
    "Hubbard Classic",
    "Arbor Acres (AA)",
    "Hubbard Efficiency Plus (EP)",
    "Siam Broiler",
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

    if (_selectedBreed.contains("Indian River")) {
      switch (week) {
        case 1:
          weight = 190.0;
          feed = 160.0;
          fcrVal = 0.84;
          break;
        case 2:
          weight = 470.0;
          feed = 520.0;
          fcrVal = 1.11;
          break;
        case 3:
          weight = 920.0;
          feed = 1150.0;
          fcrVal = 1.25;
          break;
        case 4:
          weight = 1500.0;
          feed = 2050.0;
          fcrVal = 1.37;
          break;
        case 5:
          weight = 2140.0;
          feed = 3150.0;
          fcrVal = 1.47;
          break;
        case 6:
          weight = 2800.0;
          feed = 4450.0;
          fcrVal = 1.59;
          break;
        case 7:
          weight = 3450.0;
          feed = 5900.0;
          fcrVal = 1.71;
          break;
      }
    } else if (_selectedBreed.contains("Cobb 500")) {
      switch (week) {
        case 1:
          weight = 195.0;
          feed = 165.0;
          fcrVal = 0.85;
          break;
        case 2:
          weight = 485.0;
          feed = 535.0;
          fcrVal = 1.10;
          break;
        case 3:
          weight = 945.0;
          feed = 1180.0;
          fcrVal = 1.25;
          break;
        case 4:
          weight = 1535.0;
          feed = 2090.0;
          fcrVal = 1.36;
          break;
        case 5:
          weight = 2190.0;
          feed = 3200.0;
          fcrVal = 1.46;
          break;
        case 6:
          weight = 2860.0;
          feed = 4520.0;
          fcrVal = 1.58;
          break;
        case 7:
          weight = 3520.0;
          feed = 5980.0;
          fcrVal = 1.70;
          break;
      }
    } else if (_selectedBreed.contains("Ross 308")) {
      switch (week) {
        case 1:
          weight = 188.0;
          feed = 158.0;
          fcrVal = 0.84;
          break;
        case 2:
          weight = 465.0;
          feed = 515.0;
          fcrVal = 1.11;
          break;
        case 3:
          weight = 910.0;
          feed = 1140.0;
          fcrVal = 1.25;
          break;
        case 4:
          weight = 1485.0;
          feed = 2030.0;
          fcrVal = 1.37;
          break;
        case 5:
          weight = 2120.0;
          feed = 3120.0;
          fcrVal = 1.47;
          break;
        case 6:
          weight = 2780.0;
          feed = 4410.0;
          fcrVal = 1.59;
          break;
        case 7:
          weight = 3420.0;
          feed = 5860.0;
          fcrVal = 1.71;
          break;
      }
    } else if (_selectedBreed.contains("Hubbard Efficiency")) {
      switch (week) {
        case 1:
          weight = 190.0;
          feed = 160.0;
          fcrVal = 0.84;
          break;
        case 2:
          weight = 475.0;
          feed = 525.0;
          fcrVal = 1.11;
          break;
        case 3:
          weight = 930.0;
          feed = 1160.0;
          fcrVal = 1.25;
          break;
        case 4:
          weight = 1550.0;
          feed = 2100.0;
          fcrVal = 1.35;
          break;
        case 5:
          weight = 2250.0;
          feed = 3250.0;
          fcrVal = 1.44;
          break;
        case 6:
          weight = 2950.0;
          feed = 4600.0;
          fcrVal = 1.56;
          break;
        case 7:
          weight = 3600.0;
          feed = 6100.0;
          fcrVal = 1.69;
          break;
      }
    } else if (_selectedBreed.contains("Siam")) {
      switch (week) {
        case 1:
          weight = 175.0;
          feed = 150.0;
          fcrVal = 0.86;
          break;
        case 2:
          weight = 420.0;
          feed = 480.0;
          fcrVal = 1.14;
          break;
        case 3:
          weight = 820.0;
          feed = 1050.0;
          fcrVal = 1.28;
          break;
        case 4:
          weight = 1350.0;
          feed = 1880.0;
          fcrVal = 1.39;
          break;
        case 5:
          weight = 1880.0;
          feed = 2850.0;
          fcrVal = 1.52;
          break;
        case 6:
          weight = 2450.0;
          feed = 4050.0;
          fcrVal = 1.65;
          break;
        case 7:
          weight = 3020.0;
          feed = 5380.0;
          fcrVal = 1.78;
          break;
      }
    } else {
      // Hubbard Classic / Arbor Acres
      switch (week) {
        case 1:
          weight = 185.0;
          feed = 155.0;
          fcrVal = 0.84;
          break;
        case 2:
          weight = 455.0;
          feed = 505.0;
          fcrVal = 1.11;
          break;
        case 3:
          weight = 895.0;
          feed = 1120.0;
          fcrVal = 1.25;
          break;
        case 4:
          weight = 1460.0;
          feed = 2000.0;
          fcrVal = 1.37;
          break;
        case 5:
          weight = 2090.0;
          feed = 3080.0;
          fcrVal = 1.47;
          break;
        case 6:
          weight = 2740.0;
          feed = 4360.0;
          fcrVal = 1.59;
          break;
        case 7:
          weight = 3380.0;
          feed = 5800.0;
          fcrVal = 1.71;
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
      _selectedBreed = "Indian River (IR)";
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
              ? "Broiler Standard Data"
              : "কমার্শিয়াল ব্রয়লার স্ট্যান্ডার্ড ডাটা",
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
            // Top Title Header Container (Matching Screenshot)
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
                          ? "Commercial Broiler Standard Data"
                          : "কমার্শিয়াল ব্রয়লার স্ট্যান্ডার্ড ডাটা",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEnglish
                          ? "Benchmark data for popular commercial broiler breeds"
                          : "প্রচলিত সকল কমার্শিয়াল ব্রয়লার মুরগীর ডাটা",
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

            // Form Inputs Container (Matching Screenshot)
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
                    // Field 1: Breed Dropdown
                    Text(
                      isEnglish ? "Broiler Breed:" : "ব্রয়লার মুরগির জাত:",
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

                    // Field 2: Bird Age
                    Text(
                      isEnglish ? "Bird Age (Weeks):" : "মুরগির বয়স:",
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

                    // Action Buttons (Calculate - Teal, Clear - Grey)
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

            // Output Card Display (Matching Screenshot 3)
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
                            "${isEnglish ? "Broiler Breed:" : "ব্রয়লার জাত:"} $_displayBreed",
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
