import 'package:flutter/material.dart';

class ProductionCostEggScreen extends StatefulWidget {
  final bool isEnglish;

  const ProductionCostEggScreen({super.key, required this.isEnglish});

  @override
  State<ProductionCostEggScreen> createState() => _ProductionCostEggScreenState();
}

class _ProductionCostEggScreenState extends State<ProductionCostEggScreen> {
  bool get isEnglish => widget.isEnglish;

  final _layerPriceCtrl = TextEditingController();
  final _feedPriceCtrl = TextEditingController();
  final _eggCountCtrl = TextEditingController();

  bool _hasCalculated = false;
  double _costPerEgg = 0.0;

  void _calculateCost() {
    FocusScope.of(context).unfocus();

    final layerChick = double.tryParse(_layerPriceCtrl.text.trim()) ?? 0.0;
    final feedPricePerKg = double.tryParse(_feedPriceCtrl.text.trim()) ?? 0.0;
    final eggCount = double.tryParse(_eggCountCtrl.text.trim()) ?? 0.0;

    if (eggCount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter valid egg count (HH egg)."
                : "অনুগ্রহ করে ডিমের সঠিক সংখ্যা (HH egg) লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Standard layer Hen consumption: 78.2 kg feed over rearing + laying cycle
    final henFeedCost = 78.2 * feedPricePerKg;
    final totalHenCost = layerChick + henFeedCost;
    final costPerEgg = totalHenCost / eggCount;

    setState(() {
      _costPerEgg = costPerEgg;
      _hasCalculated = true;
    });
  }

  @override
  void dispose() {
    _layerPriceCtrl.dispose();
    _feedPriceCtrl.dispose();
    _eggCountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Single Egg Cost" : "১টি ডিমের উৎপাদন খরচ",
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
                isEnglish ? "1 Egg Production Cost" : "১টি ডিমের উৎপাদন খরচ",
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
                    // Layer chick price field
                    _buildRoundField(
                      controller: _layerPriceCtrl,
                      hintText: isEnglish ? "Layer Chick Price" : "লেয়ার বাচ্চার দাম",
                    ),
                    const SizedBox(height: 14),

                    // Feed price field
                    _buildRoundField(
                      controller: _feedPriceCtrl,
                      hintText: isEnglish ? "Feed Price (Taka/kg)" : "ফিডের দাম (টাকা/কেজি)",
                    ),
                    const SizedBox(height: 14),

                    // HH egg count field
                    _buildRoundField(
                      controller: _eggCountCtrl,
                      hintText: isEnglish ? "Total Eggs (HH egg)" : "ডিমের সংখ্যা (HH egg)",
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
                          ? "${_costPerEgg.toStringAsFixed(2)} ${isEnglish ? "Taka/egg" : "টাকা/ডিম"}"
                          : "0.00 ${isEnglish ? "Taka/egg" : "টাকা/ডিম"}",
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
