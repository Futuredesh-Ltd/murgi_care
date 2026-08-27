import 'package:flutter/material.dart';

enum BirdCategory { broiler, layerColorPullet, broilerBreeder }

class SpaceEquipmentCalculatorScreen extends StatefulWidget {
  final bool isEnglish;

  const SpaceEquipmentCalculatorScreen({super.key, required this.isEnglish});

  @override
  State<SpaceEquipmentCalculatorScreen> createState() =>
      _SpaceEquipmentCalculatorScreenState();
}

class _SpaceEquipmentCalculatorScreenState
    extends State<SpaceEquipmentCalculatorScreen> {
  bool get isEnglish => widget.isEnglish;

  BirdCategory _selectedCategory = BirdCategory.broiler;

  final TextEditingController _birdCountCtrl = TextEditingController();
  final TextEditingController _ageDaysCtrl = TextEditingController();

  bool _hasCalculated = false;

  // Calculation Results
  String _categoryLabel = "";
  int _ageDays = 0;
  double _birdCount = 0.0;
  double _spacePerBirdSqFt = 0.0;
  double _totalSpaceSqFt = 0.0;
  double _totalSpaceSqM = 0.0;

  int _feedersCount = 0;
  String _feederNote = "";

  int _drinkersCount = 0;
  String _drinkerNote = "";

  int _broodersCount = 0;
  String _brooderNote = "";

  int _guardersCount = 0;
  String _guarderNote = "";

  void _calculateSpaceAndEquipment() {
    FocusScope.of(context).unfocus();

    final count = double.tryParse(_birdCountCtrl.text.trim()) ?? 0.0;
    final days = int.tryParse(_ageDaysCtrl.text.trim()) ?? 0;

    if (count <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter valid total bird count."
                : "অনুগ্রহ করে মোট মুরগির সংখ্যা লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    double sqftPerBird = 1.0;
    String catText = "";

    if (_selectedCategory == BirdCategory.broiler) {
      catText = isEnglish ? "Broiler" : "ব্রয়লার";
      if (days <= 14) {
        sqftPerBird = 0.50;
      } else if (days <= 28) {
        sqftPerBird = 0.85;
      } else {
        sqftPerBird = 1.20;
      }
    } else if (_selectedCategory == BirdCategory.layerColorPullet) {
      catText = isEnglish ? "Layer/Color bird/Pullet" : "লেয়ার/কালার বার্ড/পুলেট";
      if (days <= 14) {
        sqftPerBird = 0.35;
      } else if (days <= 35) {
        sqftPerBird = 0.75;
      } else if (days <= 70) {
        sqftPerBird = 1.25;
      } else {
        sqftPerBird = 1.85;
      }
    } else {
      catText = isEnglish ? "Broiler Breeder" : "ব্রয়লার ব্রিডার";
      if (days <= 21) {
        sqftPerBird = 0.60;
      } else if (days <= 70) {
        sqftPerBird = 1.50;
      } else {
        sqftPerBird = 2.25;
      }
    }

    final totalSqFt = count * sqftPerBird;
    final totalSqM = totalSqFt / 10.7639;

    final feeders = (count / 50.0).ceil();
    final drinkers = (count / 50.0).ceil();

    int brooders = 0;
    String brooderMsg = "";
    if (days <= 21) {
      brooders = (count / 500.0).ceil();
      brooderMsg = isEnglish
          ? "Note (Brooder): 1 Brooder = 500 Chicks"
          : "নোট (ব্রুডার): ব্রুডার: ১টি = ৫০০ বাচ্চা";
    } else {
      brooders = 0;
      brooderMsg = isEnglish
          ? "Note (Brooder): Brooding phase completed"
          : "নোট (ব্রুডার): ব্রুডিং পর্যায় শেষ";
    }

    int guarders = 0;
    String guarderMsg = "";
    if (days <= 14) {
      guarders = (count / 250.0).ceil();
      guarderMsg = isEnglish
          ? "Note (Guarder): 1 Chick Guarder = 250 Chicks"
          : "নোট (গার্ডার): ১৪ দিন পর্যন্ত ১টি গার্ডার = ২৫০ বাচ্চা";
    } else {
      guarders = 0;
      guarderMsg = isEnglish
          ? "Note (Guarder): No separate chick guarder needed after 14 days. Expanding floor space is sufficient."
          : "নোট (গার্ডার): ১৪ দিনের পরে আলাদা গার্ডার প্রয়োজন নেই। প্রয়োজন অনুযায়ী জায়গা বাড়ালেই যথেষ্ট।";
    }

    setState(() {
      _categoryLabel = catText;
      _ageDays = days;
      _birdCount = count;
      _spacePerBirdSqFt = sqftPerBird;
      _totalSpaceSqFt = totalSqFt;
      _totalSpaceSqM = totalSqM;
      _feedersCount = feeders;
      _feederNote = isEnglish
          ? "Note (Feeder): Standard: 1 Feeder per 50 Chicks"
          : "নোট (ফিডার): সাধারণ: ৫০ বাচ্চায় ১ ফিডার";
      _drinkersCount = drinkers;
      _drinkerNote = isEnglish
          ? "Note (Drinker): Standard Drinker — 1 per 50 Chicks"
          : "নোট (পাত্র): সাধারণ পানির পাত্র — ৫০ বাচ্চায় ১টি";
      _broodersCount = brooders;
      _brooderNote = brooderMsg;
      _guardersCount = guarders;
      _guarderNote = guarderMsg;
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _birdCountCtrl.clear();
      _ageDaysCtrl.clear();
      _selectedCategory = BirdCategory.broiler;
      _hasCalculated = false;
    });
  }

  @override
  void dispose() {
    _birdCountCtrl.dispose();
    _ageDaysCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish
              ? "Space, Feeder & Drinker Calculator"
              : "জায়গা, ফিডার ও ড্রিঙ্কার হিসাব",
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
            // Top Title Header Container (Matching Screenshots)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isEnglish
                    ? "Space, Feeder & Drinker Calculator"
                    : "জায়গা, ফিডার ও ড্রিঙ্কার হিসাব",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Form Inputs Container
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
                    // Field 1: Category Dropdown
                    Text(
                      isEnglish ? "Select Bird Type" : "মুরগির ধরন নির্বাচন করুন",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<BirdCategory>(
                      initialValue: _selectedCategory,
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
                      items: [
                        DropdownMenuItem(
                          value: BirdCategory.broiler,
                          child: Text(isEnglish ? "Broiler" : "ব্রয়লার"),
                        ),
                        DropdownMenuItem(
                          value: BirdCategory.layerColorPullet,
                          child: Text(
                            isEnglish
                                ? "Layer/Color bird/Pullet"
                                : "লেয়ার/কালার বার্ড/পুলেট",
                          ),
                        ),
                        DropdownMenuItem(
                          value: BirdCategory.broilerBreeder,
                          child: Text(
                            isEnglish ? "Broiler Breeder" : "ব্রয়লার ব্রিডার",
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _selectedCategory = val;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Field 2: Bird Quantity
                    Text(
                      isEnglish ? "Total Bird Quantity" : "মোট মুরগির সংখ্যা",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _birdCountCtrl,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Total Bird Quantity"
                            : "মোট মুরগির সংখ্যা",
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
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Field 3: Age in Days
                    Text(
                      isEnglish ? "Age (Days)" : "বয়স (দিন)",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _ageDaysCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: isEnglish ? "Age (Days)" : "বয়স (দিন)",
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
                              onPressed: _calculateSpaceAndEquipment,
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
                          _buildIconLine("🐓", "${isEnglish ? "Type:" : "টাইপ:"} $_categoryLabel"),
                          _buildIconLine("📅", "${isEnglish ? "Age:" : "বয়স:"} $_ageDays ${isEnglish ? "Days" : "দিন"}"),
                          _buildIconLine("👨‍🌾", "${isEnglish ? "Total Birds:" : "মোট মুরগি:"} ${_birdCount.toInt()}"),
                          const SizedBox(height: 12),

                          _buildIconLine("➔", "${isEnglish ? "Space per bird:" : "প্রতি মুরগি স্পেস:"} ${_spacePerBirdSqFt.toStringAsFixed(2)} ${isEnglish ? "sq.ft" : "বর্গফুট"}"),
                          _buildBoldText("${isEnglish ? "Total Space:" : "মোট জায়গা:"} ${_totalSpaceSqFt.toStringAsFixed(2)} ${isEnglish ? "sq.ft" : "বর্গফুট"}"),
                          _buildBoldText("${isEnglish ? "Total Space (Sq.m):" : "মোট জায়গা (Sq.m):"} ${_totalSpaceSqM.toStringAsFixed(2)} ${isEnglish ? "বর্গমিটার" : "বর্গমিটার"}"),
                          const SizedBox(height: 14),

                          _buildIconLine("🍽️", "${isEnglish ? "Feeders:" : "ফিডার:"} $_feedersCount ${isEnglish ? "pcs" : "টি"}"),
                          _buildIconLine("📌", _feederNote, isNote: true),
                          const SizedBox(height: 14),

                          _buildIconLine("💧", "${isEnglish ? "Drinkers:" : "পানির পাত্র:"} $_drinkersCount ${isEnglish ? "pcs" : "টি"}"),
                          _buildIconLine("📌", _drinkerNote, isNote: true),
                          const SizedBox(height: 14),

                          _buildIconLine("🔥", "${isEnglish ? "Brooders:" : "ব্রুডার:"} $_broodersCount ${isEnglish ? "pcs" : "টি"}"),
                          _buildIconLine("📌", _brooderNote, isNote: true),
                          const SizedBox(height: 14),

                          _buildIconLine(
                            "⭕",
                            _guardersCount > 0
                                ? "${isEnglish ? "Guarders:" : "গার্ডার:"} $_guardersCount ${isEnglish ? "pcs" : "টি"}"
                                : "${isEnglish ? "Guarders: 0 (Not required)" : "গার্ডার: 0 (প্রয়োজন নেই)"}",
                          ),
                          _buildIconLine("📌", _guarderNote, isNote: true),
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

  Widget _buildIconLine(String iconEmoji, String text, {bool isNote = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(iconEmoji, style: const TextStyle(fontSize: 15)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: isNote ? 13.5 : 15,
                fontWeight: isNote ? FontWeight.w600 : FontWeight.bold,
                color: isNote ? Colors.red.shade800 : Colors.black87,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoldText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, bottom: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
