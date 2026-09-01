import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controller/local_databank_providers.dart';
import '../screens/databank/flock_data_management_screen.dart';
import '../screens/databank/vaccination_schedule_screen.dart';
import '../screens/databank/lab_report_screen.dart';
import '../screens/databank/disease_identification_screen.dart';
import '../screens/databank/breeder_monitor_screen.dart';
import '../screens/databank/feed_formulation_screen.dart';
import '../screens/databank/molting_monitor_screen.dart';
import '../screens/databank/investment_calculator_screen.dart';
import '../screens/databank/biosecurity_audit_screen.dart';

class DataBankTab extends ConsumerWidget {
  final bool isEnglish;

  const DataBankTab({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = isEnglish;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hubState = ref.watch(dataBankHubProvider);
    final hubNotifier = ref.read(dataBankHubProvider.notifier);

    final List<Map<String, dynamic>> modules = [
      {
        'titleEn': 'Flock Data Management',
        'titleBn': 'ফ্লক ডাটা ব্যবস্থাপনা',
        'descEn': 'Add new flock, input daily flock data and view flock wise summary.',
        'descBn': 'নতুন ফ্লক যোগ করুন, দৈনিক হিসাব রাখুন এবং সার্বিক সারসংক্ষেপ দেখুন।',
        'icon': Icons.data_usage_rounded,
        'color': Colors.blue,
        'screen': FlockDataManagementScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Vaccination Schedule Making and Tracking.',
        'titleBn': 'ভ্যাকসিন সিডিউল ও ট্র্যাকিং',
        'descEn': 'Add new flock and input disease name or edit on demo vaccination schedule.',
        'descBn': 'নতুন ফ্লকের ভ্যাকসিনের সময়সূচী তৈরি ও ট্র্যাকিং করুন।',
        'icon': Icons.medical_services_rounded,
        'color': Colors.indigo,
        'screen': VaccinationScheduleScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Flock wise Lab Report input and Analysis.',
        'titleBn': 'ল্যাব রিপোর্ট ইনপুট ও এ্যানালাইসিস',
        'descEn': 'Add new flock, input Lab test data and view flock wise analysis.',
        'descBn': 'ল্যাব টেস্ট ও পোস্টমর্টেম রিপোর্ট সংরক্ষণ ও পর্যবেক্ষণ করুন।',
        'icon': Icons.biotech_rounded,
        'color': Colors.purple,
        'screen': LabReportScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Disease Identification, Treatment and Analysis.',
        'titleBn': 'রোগ শনাক্তকরণ, চিকিৎসা ও বিশ্লেষণ',
        'descEn': "Bird's abnormal sign and symptom select, disease identification and treatment.",
        'descBn': 'লক্ষণ নির্বাচন করে রোগ শনাক্তকরণ ও পরামর্শ সমাধান পান।',
        'icon': Icons.health_and_safety_rounded,
        'color': Colors.redAccent,
        'screen': DiseaseIdentificationScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Breeder Development Monitor.',
        'titleBn': 'ব্রিডার ডেভেলপমেন্ট মনিটর',
        'descEn': 'Add new flock, input weekly flock data and view flock wise summary.',
        'descBn': 'সাপ্তাহিক ওজন, ইউনিফরমিটি ও ডিম উৎপাদনের ট্র্যাকিং।',
        'icon': Icons.trending_up_rounded,
        'color': Colors.teal,
        'screen': BreederMonitorScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Feed Formulation for Poultry.',
        'titleBn': 'পোল্ট্রি ফিড ফর্মুলেশন',
        'descEn': 'Select breed, input data and make a formulation for low cost of poultry feed',
        'descBn': 'কম খরচে পুষ্টিকর পোল্ট্রি খাবার তৈরি ও অনুপাত হিসাব।',
        'icon': Icons.grain_rounded,
        'color': Colors.amber.shade900,
        'screen': FeedFormulationScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Molting Monitoring for Poultry.',
        'titleBn': 'মোল্টিং মনিটরিং ও ট্র্যাকিং',
        'descEn': 'Add new flock, input data and monitor molting process',
        'descBn': 'লেয়ার মুরগির মোল্টিং প্রক্রিয়া ও রিকভারি মনিটরিং।',
        'icon': Icons.egg_rounded,
        'color': Colors.deepOrange,
        'screen': MoltingMonitorScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Investment Calculator and Project Planning.',
        'titleBn': 'বিনিয়োগ ক্যালকুলেটর ও প্রজেক্ট প্ল্যানিং',
        'descEn': 'Add new project, input data and monitor investment process',
        'descBn': 'শেড নির্মাণ, বাচ্চা ক্রয়, খাবার বাজেট ও নিট লাভ/ক্ষতি হিসাব।',
        'icon': Icons.calculate_rounded,
        'color': Colors.green.shade800,
        'screen': InvestmentCalculatorScreen(isEnglish: isEng),
      },
      {
        'titleEn': 'Farm and Hatchery Biosecurity Audit Check.',
        'titleBn': 'ফার্ম ও হ্যাচারি জৈব নিরাপত্তা অডিট',
        'descEn': 'Add new farm, input data and monitor biosecurity process',
        'descBn': '১০টি বিষয়ের ওপর জৈব নিরাপত্তা অডিট স্কোর পরিমাপ করুন।',
        'icon': Icons.shield_rounded,
        'color': Colors.cyan.shade800,
        'screen': BiosecurityAuditScreen(isEnglish: isEng),
      },
    ];

    final filteredModules = modules.where((m) {
      if (hubState.searchQuery.isEmpty) return true;
      final q = hubState.searchQuery.toLowerCase();
      return m['titleEn'].toString().toLowerCase().contains(q) ||
          m['titleBn'].toString().toLowerCase().contains(q) ||
          m['descEn'].toString().toLowerCase().contains(q) ||
          m['descBn'].toString().toLowerCase().contains(q);
    }).toList();

    return RefreshIndicator(
      onRefresh: () => hubNotifier.loadHubStats(),
      color: Colors.teal,
      child: hubState.isLoading
          ? const Center(child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator(color: Colors.teal)))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDark
                            ? [Colors.teal.shade900, Colors.teal.shade700]
                            : [const Color(0xFF0F766E), const Color(0xFF0D9488)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withValues(alpha: 0.25),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.storage_rounded, color: Colors.white, size: 28),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isEng ? "Poultry Solution Hub" : "ডিজিটাল খামার ডেটাব্যাংক",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    isEng ? "Offline Local Storage • Instant Data Sync" : "অফলাইন লোকাল ডাটাবেজ • সম্পূর্ণ সুরক্ষিত",
                                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Quick Stats Row
                        Row(
                          children: [
                            _headerStatBox(isEng ? "Flocks" : "ফ্লক", "${hubState.flockCount}", Icons.pets),
                            _headerStatBox(isEng ? "Formulas" : "ফিড ফর্মুলা", "${hubState.formulaCount}", Icons.rice_bowl),
                            _headerStatBox(isEng ? "Projects" : "প্রজেক্ট", "${hubState.projectCount}", Icons.assignment),
                            _headerStatBox(
                              isEng ? "Audit Score" : "অডিট স্কোর",
                              "${hubState.lastAuditScore.toStringAsFixed(0)}%",
                              Icons.shield,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: isEng ? "Search DataBank Tools..." : "ডেটাব্যাংক টুলস খুঁজুন...",
                      prefixIcon: const Icon(Icons.search, color: Colors.teal),
                      suffixIcon: hubState.searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, size: 18),
                              onPressed: () => hubNotifier.setSearchQuery(''),
                            )
                          : null,
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.teal.withValues(alpha: 0.2)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.teal.withValues(alpha: 0.2)),
                      ),
                    ),
                    onChanged: (val) => hubNotifier.setSearchQuery(val),
                  ),
                  const SizedBox(height: 16),

                  // List of 9 DataBank Cards
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredModules.length,
                    itemBuilder: (context, index) {
                      final item = filteredModules[index];
                      final Color itemColor = item['color'];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 14),
                        elevation: 2,
                        shadowColor: itemColor.withValues(alpha: 0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: itemColor.withValues(alpha: 0.2), width: 1),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => item['screen']),
                            );
                            hubNotifier.loadHubStats();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: itemColor.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(
                                    item['icon'],
                                    color: itemColor,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        isEng ? item['titleEn'] : item['titleBn'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: isDark ? Colors.white : Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        isEng ? item['descEn'] : item['descBn'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isDark ? Colors.white60 : Colors.grey[600],
                                          height: 1.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.teal.shade400,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Widget _headerStatBox(String label, String val, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 14),
            const SizedBox(height: 2),
            Text(
              val,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 9),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
