import 'package:flutter/material.dart';

enum BirdType { broiler, layer }

class RoiCalculatorScreen extends StatefulWidget {
  final bool isEnglish;

  const RoiCalculatorScreen({super.key, required this.isEnglish});

  @override
  State<RoiCalculatorScreen> createState() => _RoiCalculatorScreenState();
}

class _RoiCalculatorScreenState extends State<RoiCalculatorScreen> {
  bool get isEnglish => widget.isEnglish;

  BirdType _selectedType = BirdType.broiler;

  // Broiler Controllers
  final _birdPlacedCtrl = TextEditingController();
  final _chickPriceCtrl = TextEditingController();
  final _mortalityCtrl = TextEditingController();
  final _totalFeedKgCtrl = TextEditingController();
  final _totalWeightKgCtrl = TextEditingController();
  final _feedPricePerKgCtrl = TextEditingController();
  final _marketPricePerKgCtrl = TextEditingController();

  // Layer Controllers
  final _dailyFeedGmCtrl = TextEditingController();
  final _henDayPctCtrl = TextEditingController();
  final _eggPriceCtrl = TextEditingController();
  final _layerFeedPricePerKgCtrl = TextEditingController();

  bool _hasCalculated = false;

  // Broiler Results
  int _bBirdPlaced = 0;
  int _bMortality = 0;
  int _bLiveBirds = 0;
  double _bFcr = 0.0;
  double _bMeatPer50kgFeed = 0.0;
  double _bChickCost = 0.0;
  double _bFeedCost = 0.0;
  double _bOtherCost = 0.0;
  double _bTotalCost = 0.0;
  double _bSale = 0.0;
  double _bNetProfitLoss = 0.0;
  double _bRoiPct = 0.0;

  // Layer Results
  double _lEggsPer50kgFeed = 0.0;
  double _lFeedCost = 0.0;
  double _lEggSale = 0.0;
  double _lNetProfitLoss = 0.0;
  double _lRoiPct = 0.0;

  void _calculateRoi() {
    FocusScope.of(context).unfocus();

    if (_selectedType == BirdType.broiler) {
      final birdPlaced = int.tryParse(_birdPlacedCtrl.text.trim()) ?? 0;
      final chickPrice = double.tryParse(_chickPriceCtrl.text.trim()) ?? 0.0;
      final mortality = int.tryParse(_mortalityCtrl.text.trim()) ?? 0;
      final totalFeedKg = double.tryParse(_totalFeedKgCtrl.text.trim()) ?? 0.0;
      final totalWeightKg = double.tryParse(_totalWeightKgCtrl.text.trim()) ?? 0.0;
      final feedPricePerKg = double.tryParse(_feedPricePerKgCtrl.text.trim()) ?? 0.0;
      final marketPricePerKg = double.tryParse(_marketPricePerKgCtrl.text.trim()) ?? 0.0;

      if (birdPlaced <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isEnglish ? "Please enter bird quantity." : "অনুগ্রহ করে মুরগির সংখ্যা লিখুন।",
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      final liveBirds = (birdPlaced - mortality).clamp(0, birdPlaced);
      final fcr = totalWeightKg > 0 ? (totalFeedKg / totalWeightKg) : 0.0;
      final meatPer50kg = totalFeedKg > 0 ? (totalWeightKg / totalFeedKg) * 50.0 : 0.0;

      final chickCost = birdPlaced * chickPrice;
      final feedCost = totalFeedKg * feedPricePerKg;
      final otherCost = birdPlaced * 23.0; // Standard fixed overhead 23 Tk per bird
      final totalCost = chickCost + feedCost + otherCost;
      final sale = totalWeightKg * marketPricePerKg;
      final netProfitLoss = sale - totalCost;
      final roiPct = totalCost > 0 ? (netProfitLoss / totalCost) * 100.0 : 0.0;

      setState(() {
        _bBirdPlaced = birdPlaced;
        _bMortality = mortality;
        _bLiveBirds = liveBirds;
        _bFcr = fcr;
        _bMeatPer50kgFeed = meatPer50kg;
        _bChickCost = chickCost;
        _bFeedCost = feedCost;
        _bOtherCost = otherCost;
        _bTotalCost = totalCost;
        _bSale = sale;
        _bNetProfitLoss = netProfitLoss;
        _bRoiPct = roiPct;
        _hasCalculated = true;
      });
    } else {
      // Layer Mode
      final dailyFeedGm = double.tryParse(_dailyFeedGmCtrl.text.trim()) ?? 0.0;
      final henDayPct = double.tryParse(_henDayPctCtrl.text.trim()) ?? 0.0;
      final eggPrice = double.tryParse(_eggPriceCtrl.text.trim()) ?? 0.0;
      final feedPricePerKg = double.tryParse(_layerFeedPricePerKgCtrl.text.trim()) ?? 0.0;

      if (dailyFeedGm <= 0 || feedPricePerKg <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isEnglish ? "Please enter valid daily feed and feed price." : "অনুগ্রহ করে ফিড ও দামের পরিমাণ লিখুন।",
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      final eggsPer50kgFeed = (50000.0 / dailyFeedGm) * (henDayPct / 100.0);
      final feedCost = (50.0 * feedPricePerKg) + 450.0; // 50kg feed cost + 450 Tk fixed overhead
      final eggSale = eggsPer50kgFeed * eggPrice;
      final netProfitLoss = eggSale - feedCost;
      final roiPct = feedCost > 0 ? (netProfitLoss / feedCost) * 100.0 : 0.0;

      setState(() {
        _lEggsPer50kgFeed = eggsPer50kgFeed;
        _lFeedCost = feedCost;
        _lEggSale = eggSale;
        _lNetProfitLoss = netProfitLoss;
        _lRoiPct = roiPct;
        _hasCalculated = true;
      });
    }
  }

  @override
  void dispose() {
    _birdPlacedCtrl.dispose();
    _chickPriceCtrl.dispose();
    _mortalityCtrl.dispose();
    _totalFeedKgCtrl.dispose();
    _totalWeightKgCtrl.dispose();
    _feedPricePerKgCtrl.dispose();
    _marketPricePerKgCtrl.dispose();
    _dailyFeedGmCtrl.dispose();
    _henDayPctCtrl.dispose();
    _eggPriceCtrl.dispose();
    _layerFeedPricePerKgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          isEnglish ? "ROI Calculator" : "আর-ও-আই (ROI) ক্যালকুলেটর",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Header matching reference app
            Text(
              "ROI Calculator (Broiler and Layer)",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            const SizedBox(height: 14),

            // Radio Options matching reference app exactly
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedType = BirdType.broiler;
                      _hasCalculated = false;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        _selectedType == BirdType.broiler
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: _selectedType == BirdType.broiler
                            ? Colors.teal
                            : Colors.grey.shade600,
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "Broiler/Color bird",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedType = BirdType.layer;
                      _hasCalculated = false;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        _selectedType == BirdType.layer
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: _selectedType == BirdType.layer
                            ? Colors.teal
                            : Colors.grey.shade600,
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "Layer",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Input Form Container (Matching Reference Hints Exactly)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: _selectedType == BirdType.broiler
                    ? [
                        _buildUnderlineField(_birdPlacedCtrl, "Opening Bird quantity"),
                        _buildUnderlineField(_chickPriceCtrl, "Chick price per piece (Tk)"),
                        _buildUnderlineField(_mortalityCtrl, "Mortality Quantity"),
                        _buildUnderlineField(_totalFeedKgCtrl, "Total feed (kg)"),
                        _buildUnderlineField(_totalWeightKgCtrl, "Total weight (kg)"),
                        _buildUnderlineField(_feedPricePerKgCtrl, "Feed price/kg"),
                        _buildUnderlineField(_marketPricePerKgCtrl, "Market price/kg"),
                      ]
                    : [
                        _buildUnderlineField(_dailyFeedGmCtrl, "Daily feed (gm)"),
                        _buildUnderlineField(_henDayPctCtrl, "Hen day %"),
                        _buildUnderlineField(_eggPriceCtrl, "Egg price"),
                        _buildUnderlineField(_layerFeedPricePerKgCtrl, "Feed price/kg"),
                      ],
              ),
            ),
            const SizedBox(height: 16),

            // CALCULATE Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade700,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  elevation: 0,
                ),
                onPressed: _calculateRoi,
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Result Container matching Reference App structure & colors
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _selectedType == BirdType.broiler ? "🐔 " : "🥚 ",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        _selectedType == BirdType.broiler ? "RESULT" : "LAYER RESULT",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: _hasCalculated && (_selectedType == BirdType.broiler ? _bNetProfitLoss < 0 : _lNetProfitLoss < 0)
                              ? Colors.red.shade700
                              : Colors.green.shade900,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  if (_hasCalculated) ...[
                    if (_selectedType == BirdType.broiler) ...[
                      _buildResultLine(
                        "Bird placed: $_bBirdPlaced",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      _buildResultLine(
                        "Mortality: $_bMortality",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      _buildResultLine(
                        "Live birds: $_bLiveBirds",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      const SizedBox(height: 10),
                      _buildResultLine(
                        "FCR: ${_bFcr.toStringAsFixed(2)}",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      _buildResultLine(
                        "Meat per 50kg feed: ${_bMeatPer50kgFeed.toStringAsFixed(2)} kg",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      const SizedBox(height: 10),
                      _buildResultLine(
                        "Chick Cost: ৳ ${_bChickCost.toStringAsFixed(2)}",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      _buildResultLine(
                        "Feed Cost: ৳ ${_bFeedCost.toStringAsFixed(2)}",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      _buildResultLine(
                        "Other Cost: ৳ ${_bOtherCost.toStringAsFixed(2)}",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      const SizedBox(height: 10),
                      _buildResultLine(
                        "Total Cost: ৳ ${_bTotalCost.toStringAsFixed(2)}",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      _buildResultLine(
                        "Sale: ৳ ${_bSale.toStringAsFixed(2)}",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      const SizedBox(height: 10),
                      _buildBoldResultLine(
                        _bNetProfitLoss >= 0
                            ? "PROFIT: ৳ ${_bNetProfitLoss.toStringAsFixed(2)}"
                            : "LOSS: ৳ ${_bNetProfitLoss.abs().toStringAsFixed(2)}",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                      _buildBoldResultLine(
                        "ROI: ${_bRoiPct.toStringAsFixed(2)} %",
                        isLoss: _bNetProfitLoss < 0,
                      ),
                    ] else ...[
                      // Layer Results
                      _buildResultLine(
                        "Eggs per 50kg feed: ${_lEggsPer50kgFeed.toStringAsFixed(2)}",
                        isLoss: _lNetProfitLoss < 0,
                      ),
                      const SizedBox(height: 10),
                      _buildResultLine(
                        "Feed Cost: ৳ ${_lFeedCost.toStringAsFixed(2)}",
                        isLoss: _lNetProfitLoss < 0,
                      ),
                      _buildResultLine(
                        "Egg Sale: ৳ ${_lEggSale.toStringAsFixed(2)}",
                        isLoss: _lNetProfitLoss < 0,
                      ),
                      const SizedBox(height: 10),
                      _buildBoldResultLine(
                        _lNetProfitLoss >= 0
                            ? "PROFIT: ৳ ${_lNetProfitLoss.toStringAsFixed(2)}"
                            : "LOSS: ৳ ${_lNetProfitLoss.abs().toStringAsFixed(2)}",
                        isLoss: _lNetProfitLoss < 0,
                      ),
                      _buildBoldResultLine(
                        "ROI: ${_lRoiPct.toStringAsFixed(2)} %",
                        isLoss: _lNetProfitLoss < 0,
                      ),
                    ],
                  ] else ...[
                    Text(
                      "Result will appear here",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildUnderlineField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.5),
          contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _buildResultLine(String text, {required bool isLoss}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w600,
          color: isLoss ? Colors.red.shade700 : Colors.green.shade900,
        ),
      ),
    );
  }

  Widget _buildBoldResultLine(String text, {required bool isLoss}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15.5,
          fontWeight: FontWeight.bold,
          color: isLoss ? Colors.red.shade700 : Colors.green.shade900,
        ),
      ),
    );
  }
}
