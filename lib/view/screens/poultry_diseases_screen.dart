import 'package:flutter/material.dart';
import '../../model/dissease_info.dart';

class PoultryDiseasesScreen extends StatefulWidget {
  final bool isEnglish;

  const PoultryDiseasesScreen({super.key, required this.isEnglish});

  @override
  State<PoultryDiseasesScreen> createState() => _PoultryDiseasesScreenState();
}

class _PoultryDiseasesScreenState extends State<PoultryDiseasesScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final isEng = widget.isEnglish;
    final entries = diseaseInfo.entries.where((e) {
      final val = e.value;
      final name = isEng ? (val['name_en'] ?? '') : (val['name'] ?? '');
      return name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(isEng ? "Poultry Disease Directory" : "রোগ বালাই নির্দেশিকা"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              decoration: InputDecoration(
                hintText: isEng ? "Search disease..." : "রোগের নাম দিয়ে খুঁজুন...",
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final item = entries[index].value;
                final name = isEng ? item['name_en'] : item['name'];
                final symptoms = isEng ? item['symptoms_en'] : item['symptoms'];
                final prevention = isEng ? item['prevention_en'] : item['prevention'];
                final treatment = isEng ? item['treatment_en'] : item['treatment'];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.redAccent.withOpacity(0.15),
                      child: const Icon(Icons.coronavirus_outlined, color: Colors.redAccent),
                    ),
                    title: Text(
                      name ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoBlock(
                              isEng ? "Symptoms:" : "লক্ষণ সমূহ:",
                              symptoms ?? '',
                              Colors.orange.shade800,
                            ),
                            const SizedBox(height: 10),
                            _buildInfoBlock(
                              isEng ? "Prevention:" : "প্রতিরোধ ব্যবস্থা:",
                              prevention ?? '',
                              Colors.teal.shade800,
                            ),
                            const SizedBox(height: 10),
                            _buildInfoBlock(
                              isEng ? "Treatment:" : "চিকিৎসা ও ওষুধ:",
                              treatment ?? '',
                              Colors.blue.shade800,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(String title, String content, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: titleColor),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(fontSize: 13, height: 1.4),
        ),
      ],
    );
  }
}
