import 'package:flutter/material.dart';

class MedicineCalculatorScreen extends StatefulWidget {
  final bool isEnglish;

  const MedicineCalculatorScreen({super.key, required this.isEnglish});

  @override
  State<MedicineCalculatorScreen> createState() => _MedicineCalculatorScreenState();
}

class _MedicineCalculatorScreenState extends State<MedicineCalculatorScreen> {
  bool get isEnglish => widget.isEnglish;

  final TextEditingController _chickenQtyCtrl = TextEditingController();
  final TextEditingController _avgWeightGCtrl = TextEditingController();
  final TextEditingController _dosePerKgCtrl = TextEditingController();
  final TextEditingController _medPerGmCtrl = TextEditingController();

  bool _hasCalculated = false;

  double _totalChickens = 0.0;
  double _totalWeightKg = 0.0;
  double _totalActiveMedMg = 0.0;
  double _totalProductGrams = 0.0;

  void _calculateMedicine() {
    FocusScope.of(context).unfocus();

    final qty = double.tryParse(_chickenQtyCtrl.text.trim()) ?? 0.0;
    final avgWtG = double.tryParse(_avgWeightGCtrl.text.trim()) ?? 0.0;
    final dosePerKg = double.tryParse(_dosePerKgCtrl.text.trim()) ?? 0.0;
    final medPerGm = double.tryParse(_medPerGmCtrl.text.trim()) ?? 0.0;

    if (qty <= 0 || avgWtG <= 0 || dosePerKg <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter valid quantity, weight, and dose."
                : "অনুগ্রহ করে মুরগির সংখ্যা, ওজন এবং ডোজ লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final totalWeightKg = (qty * avgWtG) / 1000.0;
    final totalActiveMg = totalWeightKg * dosePerKg;
    final productGrams = medPerGm > 0 ? (totalActiveMg / medPerGm) : (totalActiveMg / 1000.0);

    setState(() {
      _totalChickens = qty;
      _totalWeightKg = totalWeightKg;
      _totalActiveMedMg = totalActiveMg;
      _totalProductGrams = productGrams;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _chickenQtyCtrl.clear();
      _avgWeightGCtrl.clear();
      _dosePerKgCtrl.clear();
      _medPerGmCtrl.clear();
      _hasCalculated = false;
      _totalChickens = 0.0;
      _totalWeightKg = 0.0;
      _totalActiveMedMg = 0.0;
      _totalProductGrams = 0.0;
    });
  }

  @override
  void dispose() {
    _chickenQtyCtrl.dispose();
    _avgWeightGCtrl.dispose();
    _dosePerKgCtrl.dispose();
    _medPerGmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Medicine Calculator" : "মেডিসিন হিসাব করুন",
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
                isEnglish ? "Medicine Calculator" : "মেডিসিন হিসাব করুন",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Form Input Card
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
                    // Field 1: Chicken Qty
                    Text(
                      isEnglish ? "Chicken Qty:" : "মোরগ মুরগির সংখ্যা:",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _chickenQtyCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "Chicken Qty",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Field 2: Avg Weight (g)
                    Text(
                      isEnglish ? "Avg Weight (g):" : "গড় ওজন (g):",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _avgWeightGCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "g/chicken",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Field 3: Dose/kg
                    Text(
                      isEnglish ? "Dose/kg:" : "ডোজ/কেজি:",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _dosePerKgCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "mg/kg",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Field 4: Medicine/gram
                    Text(
                      isEnglish ? "Medicine/gram:" : "মেডিসিন/গ্রাম:",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _medPerGmCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: "mg/gm",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Action Buttons Row (Matching Screenshot)
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
                      onPressed: _calculateMedicine,
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
            const SizedBox(height: 16),

            // Result Display Card (Matching Screenshot)
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
                          Text(
                            "${isEnglish ? "Total Birds:" : "মোট মুরগি:"} ${_totalChickens.toStringAsFixed(1)}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${isEnglish ? "Total Weight:" : "মোট ওজন:"} ${_totalWeightKg.toStringAsFixed(2)} kg",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${isEnglish ? "Total Required Medicine:" : "মোট প্রয়োজনীয় মেডিসিন:"} ${_totalActiveMedMg.toStringAsFixed(2)} mg",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "${isEnglish ? "Amount in grams:" : "যা গ্রামে হবে:"} ${_totalProductGrams.toStringAsFixed(2)} gm",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          isEnglish ? "Result will appear here" : "Result will appear here",
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
}
