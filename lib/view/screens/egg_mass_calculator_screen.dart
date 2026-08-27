import 'package:flutter/material.dart';

class EggMassCalculatorScreen extends StatefulWidget {
  final bool isEnglish;

  const EggMassCalculatorScreen({super.key, required this.isEnglish});

  @override
  State<EggMassCalculatorScreen> createState() => _EggMassCalculatorScreenState();
}

class _EggMassCalculatorScreenState extends State<EggMassCalculatorScreen> {
  bool get isEnglish => widget.isEnglish;

  final TextEditingController _productionRateCtrl = TextEditingController();
  final TextEditingController _avgEggWeightCtrl = TextEditingController();
  final TextEditingController _henAgeCtrl = TextEditingController();

  bool _hasCalculated = false;

  double _currentEggMass = 0.0;
  String _standardRangeText = "";
  String _flockStatusText = "";
  Color _statusColor = Colors.black87;
  String _recommendationText = "";

  void _calculateEggMass() {
    FocusScope.of(context).unfocus();

    final rate = double.tryParse(_productionRateCtrl.text.trim()) ?? 0.0;
    final avgWt = double.tryParse(_avgEggWeightCtrl.text.trim()) ?? 0.0;
    final age = int.tryParse(_henAgeCtrl.text.trim()) ?? 0;

    if (rate <= 0 || avgWt <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter valid production rate and egg weight."
                : "অনুগ্রহ করে সঠিক ডিম উৎপাদন % এবং গড় ওজন লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Formula: Egg Mass = (% Production * Avg Egg Weight) / 100
    final eggMass = (rate * avgWt) / 100.0;

    // Benchmarks by age
    double minStd = 48.0;
    double maxStd = 56.0;

    if (age > 0 && age <= 22) {
      minStd = 25.0;
      maxStd = 45.0;
    } else if (age >= 23 && age <= 40) {
      minStd = 50.0;
      maxStd = 58.0;
    } else if (age >= 41 && age <= 60) {
      minStd = 48.0;
      maxStd = 55.0;
    } else if (age > 60) {
      minStd = 44.0;
      maxStd = 52.0;
    }

    String stdRange = "$minStd - $maxStd g/hen/day";
    String status;
    Color color;
    String recommendation;

    if (eggMass >= maxStd) {
      status = isEnglish
          ? "Excellent Production & Egg Mass"
          : "উৎকৃষ্ট উৎপাদন ও Egg Mass (চমৎকার)";
      color = Colors.green.shade800;
      recommendation = isEnglish
          ? "Flock egg mass is at peak performance. Maintain balanced feed nutrition and clean drinking water."
          : "ফ্লকের ডিমের মাস এবং উৎপাদন চমৎকার পর্যায়ে রয়েছে। সুষম পুষ্টি ও বিশুদ্ধ পানি সরবরাহ বজায় রাখুন।";
    } else if (eggMass >= minStd) {
      status = isEnglish
          ? "Good / Standard Condition"
          : "স্বাভাবিক ও মানসম্মত অবস্থা";
      color = Colors.teal.shade800;
      recommendation = isEnglish
          ? "Egg mass is within standard benchmarks. Keep monitoring daily feed intake and egg weights."
          : "ডিম উৎপাদন ও ওজন স্ট্যান্ডার্ড সীমার মধ্যে রয়েছে। দৈনন্দিন খাদ্য গ্রহণ ও ডিমের ওজন পর্যবেক্ষণ করুন।";
    } else {
      status = isEnglish
          ? "Below Standard Target (Low Egg Mass)"
          : "স্ট্যান্ডার্ড সীমার নিচে (কম Egg Mass)";
      color = Colors.redAccent;
      recommendation = isEnglish
          ? "Egg mass is lower than standard target. Inspect dietary crude protein, methionine, amino acid levels, and lighting schedule."
          : "ডিমের মাস কাঙ্ক্ষিত সীমার নিচে রয়েছে। খাদ্যের অপরিশোধিত প্রোটিন, মেথিওনাইন, অ্যামিনো এসিডের মাত্রা ও লাইটিং সিডিউল পরীক্ষা করুন।";
    }

    setState(() {
      _currentEggMass = eggMass;
      _standardRangeText = stdRange;
      _flockStatusText = status;
      _statusColor = color;
      _recommendationText = recommendation;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _productionRateCtrl.clear();
      _avgEggWeightCtrl.clear();
      _henAgeCtrl.clear();
      _hasCalculated = false;
      _currentEggMass = 0.0;
      _standardRangeText = "";
      _flockStatusText = "";
      _recommendationText = "";
    });
  }

  @override
  void dispose() {
    _productionRateCtrl.dispose();
    _avgEggWeightCtrl.dispose();
    _henAgeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Flock Egg Mass Calculator" : "ফ্লকের Egg Mass হিসাব করুন",
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
            // Top Input Card
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
                    // Field 1: Production Rate (%)
                    Text(
                      isEnglish ? "Egg Production Rate (%)" : "ডিম উৎপাদন হার (%)",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _productionRateCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Enter Egg Production %"
                            : "ডিম উৎপাদন % লিখুন",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
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
                    const SizedBox(height: 16),

                    // Field 2: Average Egg Weight (g)
                    Text(
                      isEnglish ? "Average Egg Weight (g)" : "ডিমের গড় ওজন (g)",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _avgEggWeightCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Enter Average Egg Weight"
                            : "ডিমের গড় ওজন লিখুন",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
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
                    const SizedBox(height: 16),

                    // Field 3: Hen Age (Week)
                    Text(
                      isEnglish ? "Hen Age (Week)" : "মুরগির বয়স (Week)",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _henAgeCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Enter Hen Age in weeks"
                            : "মুরগির বয়স লিখুন",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
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
                        // Button 1: Know Result (Teal)
                        Expanded(
                          child: SizedBox(
                            height: 46,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              onPressed: _calculateEggMass,
                              child: Text(
                                isEnglish ? "Know Result" : "ফলাফল জানুন",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Button 2: Clear (Deep Orange)
                        Expanded(
                          child: SizedBox(
                            height: 46,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange.shade700,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
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

            // Bottom Results Card
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
                    _buildResultField(
                      label: isEnglish ? "Current Egg Mass:" : "বর্তমান Egg Mass:",
                      value: _hasCalculated
                          ? "${_currentEggMass.toStringAsFixed(1)} g/hen/day"
                          : "",
                      isTitle: true,
                    ),
                    const SizedBox(height: 16),
                    _buildResultField(
                      label: isEnglish ? "Standard Benchmark Range:" : "স্ট্যান্ডার্ড সীমা:",
                      value: _hasCalculated ? _standardRangeText : "",
                    ),
                    const SizedBox(height: 16),
                    _buildResultField(
                      label: isEnglish ? "Flock Current Status:" : "ফ্লকের বর্তমান অবস্থা:",
                      value: _hasCalculated ? _flockStatusText : "",
                      valueColor: _statusColor,
                    ),
                    const SizedBox(height: 16),
                    _buildResultField(
                      label: isEnglish ? "Brief Recommendation:" : "সংক্ষিপ্ত পরামর্শ:",
                      value: _hasCalculated ? _recommendationText : "",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultField({
    required String label,
    required String value,
    Color? valueColor,
    bool isTitle = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTitle ? 16 : 15,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        if (value.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: isTitle ? 18 : 14.5,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.w600,
              color: valueColor ?? (isTitle ? Colors.teal.shade900 : Colors.black87),
              height: 1.35,
            ),
          ),
        ],
      ],
    );
  }
}
