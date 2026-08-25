import 'package:flutter/material.dart';

class ProductionCostScreen extends StatefulWidget {
  final bool isEnglish;

  const ProductionCostScreen({super.key, required this.isEnglish});

  @override
  State<ProductionCostScreen> createState() => _ProductionCostScreenState();
}

class _ProductionCostScreenState extends State<ProductionCostScreen> {
  final _birdsController = TextEditingController(text: '1000');
  final _chickCostController = TextEditingController(text: '65');
  final _feedCostController = TextEditingController(text: '55000');
  final _medicineCostController = TextEditingController(text: '5000');
  final _laborCostController = TextEditingController(text: '4000');
  final _electricityCostController = TextEditingController(text: '2000');
  final _otherCostController = TextEditingController(text: '3000');
  final _expectedPriceController = TextEditingController(text: '185');

  double _totalCost = 0.0;
  double _costPerBird = 0.0;
  double _expectedRevenue = 0.0;
  double _estimatedProfit = 0.0;
  bool _calculated = false;

  void _calculateCost() {
    final birds = double.tryParse(_birdsController.text) ?? 0.0;
    final chickPrice = double.tryParse(_chickCostController.text) ?? 0.0;
    final feedTotal = double.tryParse(_feedCostController.text) ?? 0.0;
    final medTotal = double.tryParse(_medicineCostController.text) ?? 0.0;
    final laborTotal = double.tryParse(_laborCostController.text) ?? 0.0;
    final electTotal = double.tryParse(_electricityCostController.text) ?? 0.0;
    final otherTotal = double.tryParse(_otherCostController.text) ?? 0.0;
    final sellPricePerKg = double.tryParse(_expectedPriceController.text) ?? 0.0;

    final totalChicks = birds * chickPrice;
    _totalCost = totalChicks + feedTotal + medTotal + laborTotal + electTotal + otherTotal;
    _costPerBird = birds > 0 ? _totalCost / birds : 0.0;

    // Assuming average market weight 1.6kg per bird
    final totalWeightKg = birds * 1.6;
    _expectedRevenue = totalWeightKg * sellPricePerKg;
    _estimatedProfit = _expectedRevenue - _totalCost;

    setState(() {
      _calculated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEng ? "Production Cost Calculator" : "উৎপাদন খরচ ক্যালকুলেটর"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isEng ? "Enter Batch Details" : "ব্যাচের খরচের বিবরণ লিখুন",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildField(_birdsController, isEng ? "Number of Birds" : "মোট মুরগির সংখ্যা", Icons.pets),
            _buildField(_chickCostController, isEng ? "Chick Cost per Piece (৳)" : "প্রতিটি বাচ্চার দাম (৳)", Icons.monetization_on_outlined),
            _buildField(_feedCostController, isEng ? "Total Feed Cost (৳)" : "মোট খাদ্য খরচ (৳)", Icons.restaurant),
            _buildField(_medicineCostController, isEng ? "Medicine & Vaccine Cost (৳)" : "ওষুধ ও টিকা খরচ (৳)", Icons.medical_services_outlined),
            _buildField(_laborCostController, isEng ? "Labor Cost (৳)" : "লেবার / শ্রমিক খরচ (৳)", Icons.people_outline),
            _buildField(_electricityCostController, isEng ? "Electricity & Utility (৳)" : "বিদ্যুৎ ও অন্যান্য বিল (৳)", Icons.bolt),
            _buildField(_otherCostController, isEng ? "Transport & Other Expenses (৳)" : "পরিবহন ও অন্যান্য (৳)", Icons.local_shipping_outlined),
            _buildField(_expectedPriceController, isEng ? "Expected Selling Price per kg (৳)" : "আশ আশানুরূপ বিক্রয় মূল্য/কেজি (৳)", Icons.sell_outlined),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _calculateCost,
              icon: const Icon(Icons.calculate),
              label: Text(
                isEng ? "Calculate Total Cost" : "মোট খরচ ও সম্ভাব্য লাভ হিসাব করুন",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            if (_calculated) ...[
              const SizedBox(height: 24),
              Card(
                color: Colors.teal.shade50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _resultRow(isEng ? "Total Production Cost" : "মোট উৎপাদন খরচ", "৳${_totalCost.toStringAsFixed(0)}", isBold: true),
                      const Divider(),
                      _resultRow(isEng ? "Cost Per Bird" : "প্রতি মুরগিতে মোট খরচ", "৳${_costPerBird.toStringAsFixed(1)}"),
                      const Divider(),
                      _resultRow(isEng ? "Estimated Revenue" : "মোট সম্ভাব্য বিক্রয় মূল্য", "৳${_expectedRevenue.toStringAsFixed(0)}"),
                      const Divider(),
                      _resultRow(
                        isEng ? "Estimated Net Profit" : "সম্ভাব্য নিট লাভ/ক্ষতি",
                        "৳${_estimatedProfit.toStringAsFixed(0)}",
                        isBold: true,
                        color: _estimatedProfit >= 0 ? Colors.green.shade800 : Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _resultRow(String label, String value, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isBold ? 16 : 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 17 : 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: color ?? Colors.teal.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
