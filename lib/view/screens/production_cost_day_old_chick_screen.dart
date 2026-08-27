import 'package:flutter/material.dart';

class ProductionCostDayOldChickScreen extends StatefulWidget {
  final bool isEnglish;

  const ProductionCostDayOldChickScreen({super.key, required this.isEnglish});

  @override
  State<ProductionCostDayOldChickScreen> createState() =>
      _ProductionCostDayOldChickScreenState();
}

class _ProductionCostDayOldChickScreenState
    extends State<ProductionCostDayOldChickScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedCategory = "ব্রয়লার";
  final _parentChickPriceCtrl = TextEditingController();
  final _feedPriceCtrl = TextEditingController();
  final _hhChicksCtrl = TextEditingController();

  bool _hasCalculated = false;
  double _costPerChick = 0.0;

  final List<String> _categoryOptions = [
    "ব্রয়লার",
    "কালার",
    "সোনালি",
    "লেয়ার",
  ];

  void _onCategoryChanged(String? newCat) {
    if (newCat == null) return;
    setState(() {
      _selectedCategory = newCat;
      // Pre-fill realistic standard Hen Housed chicks per parent hen if empty
      if (_hhChicksCtrl.text.isEmpty) {
        if (newCat == "ব্রয়লার") {
          _hhChicksCtrl.text = "140";
        } else if (newCat == "কালার") {
          _hhChicksCtrl.text = "120";
        } else if (newCat == "সোনালি") {
          _hhChicksCtrl.text = "110";
        } else if (newCat == "লেয়ার") {
          _hhChicksCtrl.text = "100";
        }
      }
    });
  }

  void _calculateCost() {
    FocusScope.of(context).unfocus();

    final parentPrice = double.tryParse(_parentChickPriceCtrl.text.trim()) ?? 0.0;
    final feedPrice = double.tryParse(_feedPriceCtrl.text.trim()) ?? 0.0;
    final hhChicks = double.tryParse(_hhChicksCtrl.text.trim()) ?? 0.0;

    if (hhChicks <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter valid Hen Housed chicks count."
                : "অনুগ্রহ করে বাচ্চার সঠিক সংখ্যা লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Lifecycle feed consumption standard (kg) per parent bird:
    double feedConsumptionKg = 87.0;
    if (_selectedCategory == "কালার") {
      feedConsumptionKg = 78.0;
    } else if (_selectedCategory == "সোনালি") {
      feedConsumptionKg = 75.0;
    } else if (_selectedCategory == "লেয়ার") {
      feedConsumptionKg = 138.164;
    }

    final totalFeedCost = feedConsumptionKg * feedPrice;
    final totalParentCost = parentPrice + totalFeedCost;
    final costPerChick = totalParentCost / hhChicks;

    setState(() {
      _costPerChick = costPerChick;
      _hasCalculated = true;
    });
  }

  @override
  void dispose() {
    _parentChickPriceCtrl.dispose();
    _feedPriceCtrl.dispose();
    _hhChicksCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Day-Old Chick Cost" : "১ দিনের বাচ্চার উৎপাদন খরচ",
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
                isEnglish ? "1 Day Chick Production Cost" : "১ দিনের বাচ্চার উৎপাদন খরচ",
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
                    // Breed Category Dropdown
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

                    // Parent chick price field
                    _buildRoundField(
                      controller: _parentChickPriceCtrl,
                      hintText: isEnglish ? "Parent Chick Price" : "প্যারেন্টস বাচ্চার দাম",
                    ),
                    const SizedBox(height: 14),

                    // Feed price field
                    _buildRoundField(
                      controller: _feedPriceCtrl,
                      hintText: isEnglish ? "Feed Price (Taka/kg)" : "ফিডের দাম (টাকা/কেজি)",
                    ),
                    const SizedBox(height: 14),

                    // Hen Housed Chick field
                    _buildRoundField(
                      controller: _hhChicksCtrl,
                      hintText: "Hen Housed বাচ্চা/Parent Hen",
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
                          ? "${_costPerChick.toStringAsFixed(2)} ${isEnglish ? "Taka/chick" : "টাকা/বাচ্চা"}"
                          : "0 ${isEnglish ? "Taka/chick" : "টাকা/বাচ্চা"}",
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
