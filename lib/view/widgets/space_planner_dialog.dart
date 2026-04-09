import 'package:flutter/material.dart';

class SpacePlannerDialog extends StatelessWidget {
  final bool isEnglish;

  const SpacePlannerDialog({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final len = TextEditingController();
    final wid = TextEditingController();

    return AlertDialog(
      title: Text(isEnglish ? "House Capacity" : "ঘরের ধারণক্ষমতা"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: len,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: isEnglish ? "Length (ft)" : "দৈর্ঘ্য (ফুট)",
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: wid,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: isEnglish ? "Width (ft)" : "প্রস্থ (ফুট)",
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
            double area =
                (double.tryParse(len.text) ?? 0) * (double.tryParse(wid.text) ?? 0);
            Navigator.pop(context);
            _showResultDialog(
              context,
              isEnglish,
              "Space Result",
              "${isEnglish ? "Area" : "জায়গা"}: ${area.toStringAsFixed(0)} sqft\n"
              "${isEnglish ? "Winter Capacity" : "শীতকালীন ক্ষমতা"}: ${(area / 1.0).floor()} birds\n"
              "${isEnglish ? "Summer Capacity" : "গ্রীষ্মকালীন ক্ষমতা"}: ${(area / 1.5).floor()} birds",
            );
          },
          child: Text(isEnglish ? "Analyze" : "বিশ্লেষণ"),
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
