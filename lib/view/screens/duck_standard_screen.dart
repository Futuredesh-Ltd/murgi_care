import 'package:flutter/material.dart';

class DuckStandardScreen extends StatefulWidget {
  final bool isEnglish;

  const DuckStandardScreen({super.key, required this.isEnglish});

  @override
  State<DuckStandardScreen> createState() => _DuckStandardScreenState();
}

class _DuckStandardScreenState extends State<DuckStandardScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedBreed = "Cherry Valley Duck";
  final TextEditingController _ageWeekCtrl = TextEditingController();

  bool _hasCalculated = false;

  String _displayBreed = "";
  int _displayAgeWeek = 0;
  double _bodyWeightG = 0.0;
  double _cumFeedIntakeG = 0.0;
  double _fcr = 0.0;

  final List<String> _breedOptions = [
    "Cherry Valley Duck",
    "Pekin Duck",
    "Muscovy Duck",
    "Khaki Campbell Duck",
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

    if (_selectedBreed.contains("Cherry Valley")) {
      switch (week) {
        case 1:
          weight = 170.0;
          feed = 220.0;
          fcrVal = 1.29;
          break;
        case 2:
          weight = 540.0;
          feed = 800.0;
          fcrVal = 1.48;
          break;
        case 3:
          weight = 1150.0;
          feed = 1900.0;
          fcrVal = 1.65;
          break;
        case 4:
          weight = 1820.0;
          feed = 3400.0;
          fcrVal = 1.87;
          break;
        case 5:
          weight = 2520.0;
          feed = 5200.0;
          fcrVal = 2.06;
          break;
        case 6:
          weight = 3200.0;
          feed = 7200.0;
          fcrVal = 2.25;
          break;
        case 7:
          weight = 3700.0;
          feed = 9400.0;
          fcrVal = 2.54;
          break;
      }
    } else if (_selectedBreed.contains("Pekin")) {
      switch (week) {
        case 1:
          weight = 160.0;
          feed = 200.0;
          fcrVal = 1.25;
          break;
        case 2:
          weight = 520.0;
          feed = 750.0;
          fcrVal = 1.44;
          break;
        case 3:
          weight = 1100.0;
          feed = 1800.0;
          fcrVal = 1.63;
          break;
        case 4:
          weight = 1750.0;
          feed = 3200.0;
          fcrVal = 1.82;
          break;
        case 5:
          weight = 2450.0;
          feed = 4900.0;
          fcrVal = 2.00;
          break;
        case 6:
          weight = 3100.0;
          feed = 6800.0;
          fcrVal = 2.19;
          break;
        case 7:
          weight = 3600.0;
          feed = 8900.0;
          fcrVal = 2.47;
          break;
      }
    } else if (_selectedBreed.contains("Muscovy")) {
      switch (week) {
        case 1:
          weight = 150.0;
          feed = 190.0;
          fcrVal = 1.27;
          break;
        case 2:
          weight = 480.0;
          feed = 710.0;
          fcrVal = 1.48;
          break;
        case 3:
          weight = 1020.0;
          feed = 1700.0;
          fcrVal = 1.67;
          break;
        case 4:
          weight = 1630.0;
          feed = 3000.0;
          fcrVal = 1.84;
          break;
        case 5:
          weight = 2300.0;
          feed = 4600.0;
          fcrVal = 2.00;
          break;
        case 6:
          weight = 2950.0;
          feed = 6400.0;
          fcrVal = 2.17;
          break;
        case 7:
          weight = 3450.0;
          feed = 8400.0;
          fcrVal = 2.43;
          break;
      }
    } else {
      // Khaki Campbell
      switch (week) {
        case 1:
          weight = 100.0;
          feed = 120.0;
          fcrVal = 1.20;
          break;
        case 2:
          weight = 280.0;
          feed = 380.0;
          fcrVal = 1.36;
          break;
        case 3:
          weight = 550.0;
          feed = 850.0;
          fcrVal = 1.55;
          break;
        case 4:
          weight = 880.0;
          feed = 1450.0;
          fcrVal = 1.65;
          break;
        case 5:
          weight = 1220.0;
          feed = 2150.0;
          fcrVal = 1.76;
          break;
        case 6:
          weight = 1550.0;
          feed = 2950.0;
          fcrVal = 1.90;
          break;
        case 7:
          weight = 1850.0;
          feed = 3850.0;
          fcrVal = 2.08;
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
      _selectedBreed = "Cherry Valley Duck";
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
              ? "Duck Commercial Standard Data"
              : "কমার্শিয়াল হাঁসের স্ট্যান্ডার্ড ডাটা",
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
                          ? "Duck Commercial Standard Data"
                          : "কমার্শিয়াল হাঁসের স্ট্যান্ডার্ড ডাটা",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEnglish
                          ? "Pekin, Muscovy & Cherry Valley duck standard data"
                          : "Pekin, Muscovy ও Cherry Valley হাঁসের স্ট্যান্ডার্ড ডাটা",
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
                      isEnglish ? "Duck Breed:" : "হাঁসের জাত নির্বাচন করুন",
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
                      isEnglish ? "Duck Age (Weeks):" : "হাঁসের বয়স (সপ্তাহ):",
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

                    // Action buttons (Teal Calculate & Slate Clear/মুছুন)
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
                          isEnglish ? "Calculate" : "হিসাব করুন",
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
            const SizedBox(height: 16),

            // Result Display Card
            Card(
              elevation: 2,
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: _hasCalculated
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLine(
                                  "🦆",
                                  "${isEnglish ? "Duck Breed:" : "জাত:"} $_displayBreed",
                                ),
                                _buildLine(
                                  "📅",
                                  "${isEnglish ? "Age:" : "বয়স:"} $_displayAgeWeek ${isEnglish ? "Weeks" : "সপ্তাহ"}",
                                ),
                                const SizedBox(height: 10),
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
                                        "• Cumulative Feed Intake: ${_cumFeedIntakeG.toStringAsFixed(1)} g/duck",
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
                                isEnglish ? "Result will appear here" : "এখানে ফলাফল দেখাবে",
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                    ),
                  ],
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
