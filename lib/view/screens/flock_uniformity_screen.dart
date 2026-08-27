import 'package:flutter/material.dart';
import 'dart:math';

class FlockUniformityScreen extends StatefulWidget {
  final bool isEnglish;

  const FlockUniformityScreen({super.key, required this.isEnglish});

  @override
  State<FlockUniformityScreen> createState() => _FlockUniformityScreenState();
}

class _FlockUniformityScreenState extends State<FlockUniformityScreen> {
  bool get isEnglish => widget.isEnglish;

  final TextEditingController _weightController = TextEditingController();
  final List<double> _weights = [];

  double _totalWeightKg = 0.0;
  int _birdCount = 0;
  double _avgWeightG = 0.0;
  double _plus10G = 0.0;
  double _minus10G = 0.0;
  double _uniformityPct = 0.0;
  double _cvPct = 0.0;

  bool _hasCalculated = false;

  void _addWeight() {
    final text = _weightController.text.trim();
    final val = double.tryParse(text);
    if (val != null && val > 0) {
      setState(() {
        _weights.add(val);
        _weightController.clear();
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Added: ${val.toStringAsFixed(0)}g (Total: ${_weights.length} birds)"
                : "যোগ করা হয়েছে: ${val.toStringAsFixed(0)}g (মোট: ${_weights.length}টি মুরগী)",
          ),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.teal,
        ),
      );
    }
  }

  void _calculateResult() {
    if (_weights.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEnglish
                ? "Please add at least one bird weight first."
                : "অনুগ্রহ করে প্রথমে অন্তত ১টি মুরগির ওজন যোগ করুন।",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final n = _weights.length;
    final sumG = _weights.reduce((a, b) => a + b);
    final avg = sumG / n;
    final plus10 = avg * 1.10;
    final minus10 = avg * 0.90;

    int inRangeCount = 0;
    double varianceSum = 0.0;

    for (var w in _weights) {
      if (w >= minus10 && w <= plus10) {
        inRangeCount++;
      }
      varianceSum += pow(w - avg, 2);
    }

    final uniformity = (inRangeCount / n) * 100;
    final stdDev = sqrt(varianceSum / n);
    final cv = avg > 0 ? (stdDev / avg) * 100 : 0.0;

    setState(() {
      _totalWeightKg = sumG / 1000.0;
      _birdCount = n;
      _avgWeightG = avg;
      _plus10G = plus10;
      _minus10G = minus10;
      _uniformityPct = uniformity;
      _cvPct = cv;
      _hasCalculated = true;
    });
  }

  void _resetResult() {
    setState(() {
      _weights.clear();
      _weightController.clear();
      _totalWeightKg = 0.0;
      _birdCount = 0;
      _avgWeightG = 0.0;
      _plus10G = 0.0;
      _minus10G = 0.0;
      _uniformityPct = 0.0;
      _cvPct = 0.0;
      _hasCalculated = false;
    });
  }

  void _removeWeightAt(int index) {
    setState(() {
      _weights.removeAt(index);
      if (_hasCalculated && _weights.isNotEmpty) {
        _calculateResult();
      } else if (_weights.isEmpty) {
        _resetResult();
      }
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          isEnglish ? "Chicken Weight & Uniformity" : "মুরগীর ওজন ও ইউনিফর্মটি",
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
                  children: [
                    Text(
                      isEnglish
                          ? "Add Weight (g) One by One"
                          : "একটি করে ওজন (g) যোগ করুন",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange.shade700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _weightController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onSubmitted: (_) => _addWeight(),
                      decoration: InputDecoration(
                        hintText: isEnglish
                            ? "Enter 1 weight at a time"
                            : "১টি করে ওজন লিখুন",
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Button 1: Add
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: _addWeight,
                        child: Text(
                          isEnglish ? "Click to Add" : "যোগ করতে ক্লিক করুন",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Button 2: Calculate
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange.shade700,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: _calculateResult,
                        child: Text(
                          isEnglish ? "Calculate Result" : "ফলাফল জানুন",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Button 3: Clear
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: _resetResult,
                        child: Text(
                          isEnglish ? "Clear Result" : "ফলাফল মুছুন",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    if (_weights.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      const Divider(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          isEnglish
                              ? "Added Weights (${_weights.length}):"
                              : "যোগ করা ওজনসমূহ (${_weights.length}টি):",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(_weights.length, (index) {
                          return Chip(
                            backgroundColor: Colors.teal.shade50,
                            side: BorderSide(color: Colors.teal.shade200),
                            label: Text(
                              "#${index + 1}: ${_weights[index].toStringAsFixed(0)}g",
                              style: TextStyle(
                                color: Colors.teal.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            deleteIcon: const Icon(
                              Icons.cancel,
                              size: 18,
                              color: Colors.teal,
                            ),
                            onDeleted: () => _removeWeightAt(index),
                          );
                        }),
                      ),
                    ],
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
                  children: [
                    _buildMetricRow(
                      isEnglish ? "Total Weight :" : "মোট ওজন :",
                      "${_totalWeightKg.toStringAsFixed(2)} kg",
                    ),
                    _buildMetricRow(
                      isEnglish
                          ? "Weighed Birds Count :"
                          : "ওজনকৃত মুরগীর সংখ্যা :",
                      "$_birdCount pcs",
                    ),
                    _buildMetricRow(
                      isEnglish ? "Average Weight :" : "গড় ওজন :",
                      "${_avgWeightG.toStringAsFixed(0)} g",
                    ),
                    _buildMetricRow(
                      isEnglish ? "+10% of Avg Weight :" : "গড় ওজনের ১০% (+) :",
                      "${_plus10G.toStringAsFixed(0)} g",
                    ),
                    _buildMetricRow(
                      isEnglish ? "-10% of Avg Weight :" : "গড় ওজনের ১০% (-) :",
                      "${_minus10G.toStringAsFixed(0)} g",
                    ),
                    _buildMetricRow(
                      "Uniformity (%) :",
                      "${_uniformityPct.toStringAsFixed(_uniformityPct % 1 == 0 ? 0 : 1)} %",
                      isHighlight: true,
                    ),
                    _buildMetricRow(
                      "CV (%) :",
                      "${_cvPct.toStringAsFixed(2)} %",
                      isHighlight: true,
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

  Widget _buildMetricRow(
    String label,
    String value, {
    bool isHighlight = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.w600,
              color: isHighlight ? Colors.black87 : Colors.grey.shade800,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isHighlight ? Colors.teal.shade900 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
