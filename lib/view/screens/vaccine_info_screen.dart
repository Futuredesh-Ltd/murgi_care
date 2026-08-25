import 'package:flutter/material.dart';

class VaccineInfoScreen extends StatelessWidget {
  final bool isEnglish;

  const VaccineInfoScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEnglish ? "Vaccine Information" : "ভ্যাকসিন তালিকা ও সময়সূচী"),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: isEnglish ? "Broiler" : "ব্রয়লার"),
              Tab(text: isEnglish ? "Sonali" : "সোনালী"),
              Tab(text: isEnglish ? "Layer" : "লেয়ার"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBroilerSchedule(context),
            _buildSonaliSchedule(context),
            _buildLayerSchedule(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBroilerSchedule(BuildContext context) {
    final list = [
      {"age": "১ম দিন", "name": "IB + ND (Live)", "method": "চোখে ড্রপ বা স্প্রে", "disease": "রানীক্ষেত ও ইনফেকশাস ব্রঙ্কাইটিস"},
      {"age": "১০-১২ দিন", "name": "IBD / Gumboro (Intermediate)", "method": "চোখে ড্রপ বা খাবারের পানিতে", "disease": "গামবোরো രോഗ"},
      {"age": "১৭-১৯ দিন", "name": "IBD / Gumboro (Booster)", "method": "খাবারের পানিতে", "disease": "গামবোরো (বুস্টার)"},
      {"age": "২১-২৩ দিন", "name": "ND / Ranikhet (Booster)", "method": "চোখে ড্রপ বা পানির সাথে", "disease": "রানীক্ষেত (বুস্টার)"},
    ];

    return _buildList(list);
  }

  Widget _buildSonaliSchedule(BuildContext context) {
    final list = [
      {"age": "১-৩ দিন", "name": "BCRDV (Marek's / NCD)", "method": "চোখে ড্রপ", "disease": "রানীক্ষেত"},
      {"age": "১০-১২ দিন", "name": "Gumboro (IBD)", "method": "চোখে ড্রপ", "disease": "গামবোরো"},
      {"age": "২০-২২ দিন", "name": "Gumboro Booster", "method": "পানির সাথে", "disease": "গামবোরো বুস্টার"},
      {"age": "৩৫ দিন", "name": "Fowl Pox", "method": "ডানার চামড়ায় পাংচার", "disease": "বসন্ত"},
      {"age": "৬০ দিন", "name": "RDV", "method": "মাংসপেশিতে ইনজেকশন", "disease": "রানীক্ষেত বড় মুরগি"},
    ];

    return _buildList(list);
  }

  Widget _buildLayerSchedule(BuildContext context) {
    final list = [
      {"age": "১ম দিন", "name": "Marek's + IB", "method": "চামড়ার নিচে / ড্রপ", "disease": "মারেক্স ও ব্রঙ্কাইটিস"},
      {"age": "৭ দিন", "name": "ND + IB (Live)", "method": "চোখে ড্রপ", "disease": "রানীক্ষেত"},
      {"age": "১৪ দিন", "name": "IBD (Gumboro)", "method": "চোখে ড্রপ", "disease": "গামবোরো"},
      {"age": "২৮ দিন", "name": "Fowl Pox", "method": "ডানায় খোঁচা", "disease": "বসন্ত"},
      {"age": "৮ম সপ্তাহ", "name": "Coryza (Killed)", "method": "ইনজেকশন", "disease": "কোরাইজা"},
      {"age": "১৬শ সপ্তাহ", "name": "ND + IB + EDS (Killed Trio)", "method": "ইনজেকশন", "disease": "ডিম উৎপাদন সুরক্ষা"},
    ];

    return _buildList(list);
  }

  Widget _buildList(List<Map<String, String>> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item["age"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade900,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "প্রয়োগ: ${item["method"]}",
                        style: const TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                      Text(
                        "প্রতিরোধ: ${item["disease"]}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
