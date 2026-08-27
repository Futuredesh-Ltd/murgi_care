import 'package:flutter/material.dart';

class ChickQualityCalculatorScreen extends StatefulWidget {
  final bool isEnglish;

  const ChickQualityCalculatorScreen({super.key, required this.isEnglish});

  @override
  State<ChickQualityCalculatorScreen> createState() =>
      _ChickQualityCalculatorScreenState();
}

class _ChickQualityCalculatorScreenState
    extends State<ChickQualityCalculatorScreen> {
  bool get isEnglish => widget.isEnglish;

  String _selectedBreed = "ব্রয়লার";
  final TextEditingController _eggWeightCtrl = TextEditingController();
  final TextEditingController _chickWeightCtrl = TextEditingController();

  bool _hasCalculated = false;

  // Calculation outputs
  String _breedName = "";
  double _eggWeight = 0.0;
  double _chickWeight = 0.0;
  double _actualYield = 0.0;
  double _standardYield = 68.0;
  double _standardChickWeight = 0.0;

  String _machineStatus = "";
  String _weightAssessment = "";
  String _recommendationText = "";

  void _calculateQuality() {
    FocusScope.of(context).unfocus();

    final eggWt = double.tryParse(_eggWeightCtrl.text.trim()) ?? 0.0;
    final chickWt = double.tryParse(_chickWeightCtrl.text.trim()) ?? 0.0;

    if (eggWt <= 0 || chickWt <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please enter valid egg and chick weights."
                : "অনুগ্রহ করে সঠিক ডিম ও বাচ্চার ওজন লিখুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Validation matching Screenshot 1
    if (chickWt > eggWt) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Text("🐔 ", style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text(
                  isEnglish
                      ? "❌ Invalid Input! Chick weight can never be greater than egg weight."
                      : "❌ ভুল ইনপুট! বাচ্চার ওজন কখনোই ডিমের ওজনের থেকে বেশি হতে পারে না।",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade900,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          duration: const Duration(seconds: 4),
        ),
      );
      return;
    }

    final actualYieldPct = (chickWt / eggWt) * 100.0;

    double stdYieldPct = 68.0;
    if (_selectedBreed.contains("লেয়ার")) {
      stdYieldPct = 67.0;
    } else if (_selectedBreed.contains("সোনালী")) {
      stdYieldPct = 67.5;
    }

    final stdChickWeightG = eggWt * (stdYieldPct / 100.0);

    final yieldDiff = stdYieldPct - actualYieldPct;
    final weightDiffPct = ((stdChickWeightG - chickWt) / stdChickWeightG) * 100.0;

    String machineStat = "";
    if (yieldDiff > 3.0) {
      machineStat =
          "⚠ গুরুত্বপূর্ন সমস্যা — Yield অনেক কম (${yieldDiff.toStringAsFixed(2)}% কম)। সম্ভাব্য কারণ: ডিহাইড্রেশন, ওভারহিট, সময়ের আগে হ্যাচিং, টার্নিং ইস্যু বা ডিম স্টোরেজ সমস্যা।";
    } else if (yieldDiff < -3.0) {
      machineStat =
          "⚠ ভারী বাচ্চা — Yield বেশি (${(-yieldDiff).toStringAsFixed(2)}% বেশি)। সম্ভাব্য কারণ: ইনকিউবেটর আর্দ্রতা বেশি বা ডিম থেকে পর্যাপ্ত পানি বাষ্পীভূত হয়নি।";
    } else {
      machineStat =
          "✅ হ্যাচারি মেশিন স্ট্যাটাস চমৎকার! Yield স্বাভাবিক ও আদর্শ (স্ট্যান্ডার্ডের কাছাকাছি)।";
    }

    String wtAssess = "";
    if (weightDiffPct > 5.0) {
      wtAssess =
          "⚠ বিপজ্জনকভাবে কম ওজন (${weightDiffPct.toStringAsFixed(2)}% কম)। সম্ভাব্য কারণ: ডিহাইড্রেশন, অপ্রতুল হ্যাচিং সময়, বা ইনকিউবেশনের সমস্যা।";
    } else if (weightDiffPct < -5.0) {
      wtAssess =
          "⚠ বাচ্চার ওজন অতিরিক্ত বেশি (${(-weightDiffPct).toStringAsFixed(2)}% বেশি)।";
    } else {
      wtAssess = "✅ বাচ্চার ওজন আদর্শ পর্যায়ে রয়েছে।";
    }

    StringBuffer advice = StringBuffer();
    advice.writeln("১) ইনকিউবেটর রেকর্ড চেক করুন — প্রতিটি ব্যাচে Temp/Humidity/Turning/Pulling time নোট করুন।");
    advice.writeln("২) টেম্পারেচার ও আর্দ্রতা (ডাটালগ) পুনরায় যাচাই করুন; সেটপয়েন্ট ও রিডিং মিলছে কি দেখুন।");
    advice.writeln("৩) টার্নিং মেকানিজম ও টার্নিং ফ্রিকোয়েন্সি ঠিক আছে কিনা দেখুন।");
    advice.writeln("৪) ডিম সোর্টিং ও স্টোরেজ — পরিবহন ও স্টোরেজে ঠান্ডা/গরম ফ্রাকচার আছে কি না চেক করুন।\n");

    if (yieldDiff > 3.0) {
      advice.writeln("➔ Yield অনেক কম (${yieldDiff.toStringAsFixed(2)}%): সম্ভাব্য কারণ — অতিরিক্ত Egg weight loss, ইনকিউবেটর আর্দ্রতা কম/অতিরিক্ত, ভেন্টিলেশন বা টার্নিং সমস্যা। পরামর্শ: last 3 days এর RH ও temp লগ দেখুন এবং সেন্সর ক্যালিব্রেট করুন।\n");
    }

    if (weightDiffPct > 5.0) {
      advice.writeln("➔ ওজন খুব কম (${weightDiffPct.toStringAsFixed(2)}%): বাচ্চারা ডিহাইড্রেটেড হতে পারে — পুলিং ও ওযার্মিং টেবিল চেক করুন এবং ওজন মাপার পদ্ধতি যাচাই করুন।\n");
    }

    advice.writeln("৫) ক্রস-চেক: যদি Yield ও Weight দুটোই ব্যতিক্রমী হয়, তবে measurement method (sample selection, scale calibration) যাচাই করুন।");
    advice.writeln("৬) রুট-কজ এনালাইসিস: ৩ ব্যাচের ইতিহাস তুলনা করে suspect date/time pinpoint করুন।\n");
    advice.write("সারাংশ: লগ রাখুন, সেন্সর ক্যালিব্রেট করুন, ছোট স্কেল টেস্ট চালিয়ে পরিবর্তন কনফার্ম করুন।");

    setState(() {
      _breedName = _selectedBreed;
      _eggWeight = eggWt;
      _chickWeight = chickWt;
      _actualYield = actualYieldPct;
      _standardYield = stdYieldPct;
      _standardChickWeight = stdChickWeightG;
      _machineStatus = machineStat;
      _weightAssessment = wtAssess;
      _recommendationText = advice.toString();
      _hasCalculated = true;
    });
  }

  void _clearForm() {
    setState(() {
      _eggWeightCtrl.clear();
      _chickWeightCtrl.clear();
      _selectedBreed = "ব্রয়লার";
      _hasCalculated = false;
    });
  }

  @override
  void dispose() {
    _eggWeightCtrl.dispose();
    _chickWeightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Chick Quality Calculator" : "চিক Quality Calculator",
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
            // Header Title Card (Matching Screenshot 1)
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
                    Row(
                      children: [
                        const Text("🐥 ", style: TextStyle(fontSize: 22)),
                        Text(
                          isEnglish
                              ? "Chick Quality Calculator"
                              : "Chick Quality Calculator",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isEnglish
                          ? "Accurate Chick Yield & Hatchery Machine Status from Hatching Eggs"
                          : "হ্যাচিং ডিম থেকে বাচ্চার এক্যুরেট Yield ও মেশিন স্ট্যাটাস",
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

            // Form Inputs Container (Matching Screenshot 1)
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
                    // Field 1: Breed Dropdown
                    Text(
                      isEnglish ? "Parent Breed" : "প্যারেন্ট মুরগির জাত",
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
                      items: [
                        DropdownMenuItem(
                          value: "ব্রয়লার",
                          child: Text(isEnglish ? "Broiler" : "ব্রয়লার"),
                        ),
                        DropdownMenuItem(
                          value: "লেয়ার",
                          child: Text(isEnglish ? "Layer" : "লেয়ার"),
                        ),
                        DropdownMenuItem(
                          value: "সোনালী",
                          child: Text(isEnglish ? "Sonali" : "সোনালী"),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _selectedBreed = val;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Field 2: Hatching Egg Weight
                    Text(
                      isEnglish
                          ? "Hatching Egg Weight (grams)"
                          : "হ্যাচিং ডিমের ওজন (গ্রাম)",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _eggWeightCtrl,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: "20",
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
                    const SizedBox(height: 16),

                    // Field 3: Chick Weight
                    Text(
                      isEnglish
                          ? "Chick Weight (grams)"
                          : "বাচ্চার ওজন (গ্রাম)",
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _chickWeightCtrl,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        hintText: "30",
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

                    // Action Buttons Row (Calculate - Teal, Clear - Grey)
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
                        onPressed: _calculateQuality,
                        child: Text(
                          isEnglish ? "Calculate" : "Calculate",
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
                          isEnglish ? "Clear" : "Clear",
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

            // Output Card (Matching Screenshots 2 & 3)
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
                          _buildLine("🐥", "${isEnglish ? "Parent:" : "প্যারেন্ট:"} $_breedName"),
                          _buildLine("🥚", "${isEnglish ? "Egg Weight:" : "ডিমের ওজন:"} ${_eggWeight.toStringAsFixed(2)} g"),
                          _buildLine("🐥", "${isEnglish ? "Chick Weight (Actual):" : "বাচ্চার ওজন (Actual):"} ${_chickWeight.toStringAsFixed(2)} g"),
                          const SizedBox(height: 12),

                          _buildLine("📊", "Actual Chick Yield: ${_actualYield.toStringAsFixed(2)} %"),
                          _buildLine("📘", "Standard Chick Yield: ${_standardYield.toStringAsFixed(2)} %"),
                          const SizedBox(height: 8),

                          _buildLine("📌", "Standard Chick Weight (from StdYield): ${_standardChickWeight.toStringAsFixed(2)} g"),
                          const SizedBox(height: 16),

                          _buildSectionTitle("🔎 Hatchery Machine Status:"),
                          const SizedBox(height: 4),
                          Text(
                            _machineStatus,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),

                          _buildSectionTitle("⚖ Weight Assessment:"),
                          const SizedBox(height: 4),
                          Text(
                            _weightAssessment,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),

                          _buildSectionTitle("💡 সংক্ষিপ্ত পরামর্শ:"),
                          const SizedBox(height: 6),
                          Text(
                            _recommendationText,
                            style: TextStyle(
                              fontSize: 13.5,
                              height: 1.45,
                              color: Colors.grey.shade800,
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
