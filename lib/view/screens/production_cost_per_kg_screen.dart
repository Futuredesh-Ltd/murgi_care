import 'package:flutter/material.dart';

class ProductionCostPerKgScreen extends StatefulWidget {
  final bool isEnglish;

  const ProductionCostPerKgScreen({super.key, required this.isEnglish});

  @override
  State<ProductionCostPerKgScreen> createState() =>
      _ProductionCostPerKgScreenState();
}

class _ProductionCostPerKgScreenState extends State<ProductionCostPerKgScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedCategory = "ব্রয়লার";
  final _chickPriceCtrl = TextEditingController();
  final _feedPriceCtrl = TextEditingController();
  final _targetWeightCtrl = TextEditingController();
  final _fcrCtrl = TextEditingController(text: "1.6");

  bool _hasCalculated = false;
  double _productionCostPerKg = 0.0;

  final List<String> _categoryOptions = [
    "ব্রয়লার",
    "সোনালি",
    "কালার বার্ড",
  ];

  void _onCategoryChanged(String? newCat) {
    if (newCat == null) return;
    setState(() {
      _selectedCategory = newCat;
      if (newCat == "ব্রয়লার") {
        _fcrCtrl.text = "1.6";
      } else if (newCat == "সোনালি") {
        _fcrCtrl.text = "2.2";
      } else if (newCat == "কালার বার্ড") {
        _fcrCtrl.text = "2.0";
      }
    });
  }

  void _calculateCost() {
    FocusScope.of(context).unfocus();

    final chick = double.tryParse(_chickPriceCtrl.text.trim()) ?? 0.0;
    final feed = double.tryParse(_feedPriceCtrl.text.trim()) ?? 0.0;
    final weight = double.tryParse(_targetWeightCtrl.text.trim()) ?? 0.0;
    final fcrVal = double.tryParse(_fcrCtrl.text.trim()) ?? 0.0;

    if (weight <= 0 || fcrVal <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter valid weight and FCR."
                : "অনুগ্রহ করে সঠিক ওজন ও এফসিআর লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final costPerKg = (feed * fcrVal) + (chick / weight);

    setState(() {
      _productionCostPerKg = costPerKg;
      _hasCalculated = true;
    });
  }

  @override
  void dispose() {
    _chickPriceCtrl.dispose();
    _feedPriceCtrl.dispose();
    _targetWeightCtrl.dispose();
    _fcrCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "1 kg Production Cost" : "১ কেজি উৎপাদন খরচ হিসাব",
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
            // Top Header Card (Teal style from screenshot)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.teal.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                isEnglish ? "1 kg Chicken Production Cost" : "১ কেজি উৎপাদন খরচ হিসাব",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Form container
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Bird Type Dropdown
                    DropdownButtonFormField<String>(
                      initialValue: _selectedCategory,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: _categoryOptions
                          .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                          .toList(),
                      onChanged: _onCategoryChanged,
                    ),
                    const SizedBox(height: 14),

                    // Chick price field
                    _buildRoundField(
                      controller: _chickPriceCtrl,
                      hintText: isEnglish ? "Chick Price (Taka/chick)" : "বাচ্চার দাম (টাকা/বাচ্চা)",
                    ),
                    const SizedBox(height: 14),

                    // Feed price field
                    _buildRoundField(
                      controller: _feedPriceCtrl,
                      hintText: isEnglish ? "Feed Price (Taka/kg)" : "ফিডের দাম (টাকা/কেজি)",
                    ),
                    const SizedBox(height: 14),

                    // Target weight field
                    _buildRoundField(
                      controller: _targetWeightCtrl,
                      hintText: isEnglish ? "Target Weight (kg)" : "টার্গেট ওজন (কেজি)",
                    ),
                    const SizedBox(height: 14),

                    // FCR field (defaults to 1.6, 2.2, or 2.0)
                    _buildRoundField(
                      controller: _fcrCtrl,
                      hintText: "FCR",
                    ),
                    const SizedBox(height: 20),

                    // Deep orange Calculate Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange.shade800,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        onPressed: _calculateCost,
                        child: Text(
                          isEnglish ? "Calculate" : "হিসাব করুন",
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
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      isEnglish ? "Estimated Production Cost" : "আনুমানিক উৎপাদন খরচ",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _hasCalculated
                          ? "${_productionCostPerKg.toStringAsFixed(2)} ${isEnglish ? "Taka/kg" : "টাকা/কেজি"}"
                          : "0.00 ${isEnglish ? "Taka/kg" : "টাকা/কেজি"}",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
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

  Widget _buildRoundField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
    );
  }
}
