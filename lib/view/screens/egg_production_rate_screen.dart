import 'package:flutter/material.dart';

class EggProductionRateScreen extends StatefulWidget {
  final bool isEnglish;

  const EggProductionRateScreen({super.key, required this.isEnglish});

  @override
  State<EggProductionRateScreen> createState() => _EggProductionRateScreenState();
}

class _EggProductionRateScreenState extends State<EggProductionRateScreen> {
  bool get isEnglish => widget.isEnglish;

  final TextEditingController _birdCountCtrl = TextEditingController();
  final TextEditingController _eggCountCtrl = TextEditingController();
  final TextEditingController _ageCtrl = TextEditingController();

  bool _hasCalculated = false;

  double _productionRate = 0.0;
  double _standardRate = 0.0;
  String _flockStatusText = "";
  Color _statusColor = Colors.teal;
  String _recommendationText = "";

  void _calculateRate() {
    FocusScope.of(context).unfocus();

    final birds = double.tryParse(_birdCountCtrl.text.trim()) ?? 0.0;
    final eggs = double.tryParse(_eggCountCtrl.text.trim()) ?? 0.0;
    final age = int.tryParse(_ageCtrl.text.trim()) ?? 0;

    if (birds <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter total bird quantity."
                : "অনুগ্রহ করে মোট মুরগির সংখ্যা লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final rate = (eggs / birds) * 100.0;

    // Lookup standard benchmark rate by age (weeks)
    double stdRate = 0.0;
    if (age > 0) {
      if (age <= 20) {
        stdRate = 25.0;
      } else if (age <= 24) {
        stdRate = 75.0;
      } else if (age <= 38) {
        stdRate = 92.0;
      } else if (age <= 55) {
        stdRate = 88.0;
      } else {
        stdRate = 80.0;
      }
    } else {
      stdRate = 88.0; // Default standard benchmark if age not specified
    }

    String status;
    Color color;
    String recommendation;

    if (rate >= (stdRate - 3.0)) {
      status = isEnglish
          ? "Excellent / Good Production"
          : "উৎকৃষ্ট / ভালো অবস্থা";
      color = Colors.teal.shade800;
      recommendation = isEnglish
          ? "Flock egg production is performing well. Maintain balanced nutrition, adequate calcium, and 16 hours of daily lighting."
          : "ডিম উৎপাদন চমৎকার রয়েছে। সুষম খাদ্য, পর্যাপ্ত ক্যালসিয়াম এবং ১৬ ঘণ্টা আলো সরবরাহ অব্যাহত রাখুন।";
    } else {
      status = isEnglish
          ? "Below Target Rate (Low Production)"
          : "কম উৎপাদন (লক্ষ্যমাত্রার নিচে)";
      color = Colors.redAccent;
      recommendation = isEnglish
          ? "Production is lower than target standard. Inspect feed protein/calcium levels, lighting schedule, and flock health status."
          : "উৎপাদন কাঙ্ক্ষিত লক্ষ্যমাত্রার নিচে রয়েছে। খাদ্যের প্রোটিন ও ক্যালসিয়ামের মাত্রা, লাইটিং সিডিউল এবং মুরগির স্বাস্থ্য পরীক্ষা করুন।";
    }

    setState(() {
      _productionRate = rate;
      _standardRate = stdRate;
      _flockStatusText = status;
      _statusColor = color;
      _recommendationText = recommendation;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _birdCountCtrl.clear();
      _eggCountCtrl.clear();
      _ageCtrl.clear();
      _hasCalculated = false;
      _productionRate = 0.0;
      _standardRate = 0.0;
      _flockStatusText = "";
      _recommendationText = "";
    });
  }

  @override
  void dispose() {
    _birdCountCtrl.dispose();
    _eggCountCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Egg Production Rate Calculator" : "ডিম উৎপাদন হার (%) হিসাব",
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isEnglish
                    ? "Egg Production Rate (%) Calculator"
                    : "ডিম উৎপাদন হার (%) হিসাব",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Main Input Form Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _birdCountCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Enter bird quantity"
                            : "মুরগির সংখ্যা লিখুন",
                        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
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
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _eggCountCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Enter total eggs count"
                            : "মোট ডিমের সংখ্যা লিখুন",
                        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
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
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _ageCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Hen age (Week)"
                            : "মুরগির বয়স (সপ্তাহ)",
                        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15),
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
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Action Buttons Row
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 46,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade700,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              onPressed: _calculateRate,
                              child: Text(
                                isEnglish ? "Calculate" : "হিসাব করুন",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 46,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange.shade700,
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card 1: Results Metrics (Matching Screenshot)
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
                      "${isEnglish ? "Egg Production Rate:" : "ডিম উৎপাদন হার:"} ${_hasCalculated ? "${_productionRate.toStringAsFixed(1)}%" : "0%"}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${isEnglish ? "Standard Production Rate:" : "স্ট্যান্ডার্ড উৎপাদন হার:"} ${_hasCalculated ? "${_standardRate.toStringAsFixed(0)}%" : "0%"}",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isEnglish ? "Flock Current Status: " : "ফ্লকের বর্তমান অবস্থা: ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        if (_hasCalculated && _flockStatusText.isNotEmpty)
                          Expanded(
                            child: Text(
                              _flockStatusText,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: _statusColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Card 2: Recommendation Card (Matching Screenshot)
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
                      isEnglish ? "Brief Recommendation:" : "সংক্ষিপ্ত পরামর্শ:",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    if (_hasCalculated && _recommendationText.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        _recommendationText,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                          height: 1.4,
                        ),
                      ),
                    ],
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
}
