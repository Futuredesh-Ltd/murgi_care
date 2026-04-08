import 'package:flutter/material.dart';

class FcrCalculatorDialog extends StatelessWidget {
  final bool isEnglish;

  const FcrCalculatorDialog({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final feed = TextEditingController();
    final weight = TextEditingController();

    return AlertDialog(
      title: Text(isEnglish ? "FCR Calculator" : "এফসিআর ক্যালকুলেটর"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: feed,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: isEnglish ? "Total Feed (kg)" : "মোট খাদ্য (কেজি)",
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: weight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: isEnglish ? "Total Weight (kg)" : "মোট ওজন (কেজি)",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(isEnglish ? "Cancel" : "বাতিল"),
        ),
        ElevatedButton(
          onPressed: () {
            double f = double.tryParse(feed.text) ?? 0;
            double w = double.tryParse(weight.text) ?? 1;
            double res = w > 0 ? f / w : 0;
            Navigator.pop(context);
            _showResultDialog(
              context,
              isEnglish,
              "FCR Result",
              "${isEnglish ? "Your FCR is" : "আপনার এফসিআর"}: ${res.toStringAsFixed(2)}",
            );
          },
          child: Text(isEnglish ? "Calculate" : "হিসাব করুন"),
        ),
      ],
    );
  }

  void _showResultDialog(BuildContext context, bool isEnglish, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg, style: const TextStyle(fontSize: 16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
