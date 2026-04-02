// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:murgi_care/model/dissease_info.dart';
import 'package:murgi_care/view/auth_screen.dart';
import 'package:murgi_care/view/profile_screen.dart';
import 'package:murgi_care/view/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/controller.dart';

class MyhomeScreen extends StatelessWidget {
  const MyhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CustomWidgets.handleAppUpdate(context);
    });
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: Consumer<DiseaseProvider>(
          builder: (context, provider, child) {
            if (provider.image == null) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.redAccent),
              onPressed: () => provider.reset(),
              tooltip: provider.isEnglish ? "Reset" : "রিসেট",
            );
          },
        ),
        title: const Text(
          'MurgiCare Detector',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color.fromARGB(255, 8, 63, 9),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          Consumer<DiseaseProvider>(
            builder: (context, provider, child) {
              return TextButton(
                onPressed: () => provider.toggleLanguage(),
                child: Text(
                  provider.isEnglish ? "বাংলা" : "ENG",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade200, height: 1.0),
        ),
      ),
      body: Consumer<DiseaseProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- 1. Image Display Card ---
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: provider.image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 50,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              provider.isEnglish
                                  ? "No chicken image is selected"
                                  : "মুরগির কোনো ছবি নির্বাচন করা হয়নি",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(provider.image!, fit: BoxFit.cover),
                        ),
                ),
                const SizedBox(height: 32),

                // --- 2. Logic: Result Section ---
                if (provider.loading)
                  const Column(
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Analyzing...",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                else if (provider.outputs != null &&
                    provider.outputs!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildResultCard(provider.outputs![0], provider.isEnglish),
                      const SizedBox(height: 24),
                      _buildDiseaseInfo(
                        provider.outputs![0]['label'].toString(),
                        provider.isEnglish,
                      ),
                    ],
                  )
                else
                  Center(
                    child: Text(
                      provider.isEnglish
                          ? "Select an image to check chickens health status"
                          : "মুরগির স্বাস্থ্য পরীক্ষা করতে একটি ছবি নির্বাচন করুন",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),

                const SizedBox(height: 40),

                // --- 5. Action Buttons ---
                Row(
                  children: [
                    Expanded(
                      child: CustomWidgets.buildActionButton(
                        icon: Icons.camera_alt_rounded,
                        label: provider.isEnglish ? "Camera" : "ক্যামেরা",
                        color: Colors.teal,
                        onTap: () =>
                            provider.pickImage(ImageSource.camera, context),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomWidgets.buildActionButton(
                        icon: Icons.photo_library_rounded,
                        label: provider.isEnglish ? "Gallery" : "গ্যালারি",
                        color: Colors.indigo,
                        onTap: () =>
                            provider.pickImage(ImageSource.gallery, context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                const Divider(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomWidgets.buildFooterItem(
                      icon: Icons.report_problem_outlined,
                      label: provider.isEnglish ? "Caution" : "সতর্কতা",
                      color: Colors.orange,
                      onTap: () => CustomWidgets.showDisclaimer(
                        context,
                        provider.isEnglish,
                      ),
                    ),
                    CustomWidgets.buildFooterItem(
                      icon: Icons.info_outline,
                      label: provider.isEnglish ? "About" : "তথ্য",
                      color: Colors.indigo,
                      onTap: () => CustomWidgets.showAboutUs(
                        context,
                        provider.isEnglish,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // --- 6. Auth Status ---
                _buildAuthSection(provider),
                const SizedBox(height: 40),

                // --- 7. NEW: Smart Tools Section (Calculators) ---
                _buildGuideHeader(
                  provider.isEnglish,
                  Icons.calculate_rounded,
                  provider.isEnglish
                      ? "Smart Poultry Tools"
                      : "স্মার্ট পোল্ট্রি টুলস",
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildToolCard(
                        icon: Icons.speed_rounded,
                        title: provider.isEnglish ? "FCR Check" : "এফসিআর চেক",
                        color: Colors.purple,
                        onTap: () =>
                            _showFCRCalculator(context, provider.isEnglish),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildToolCard(
                        icon: Icons.grid_view_rounded,
                        title: provider.isEnglish ? "Capacity" : "ধারণক্ষমতা",
                        color: Colors.deepOrange,
                        onTap: () =>
                            _showSpacePlanner(context, provider.isEnglish),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // --- 3. Poultry Management Quick Guide ---
                _buildGuideHeader(
                  provider.isEnglish,
                  Icons.menu_book_rounded,
                  provider.isEnglish ? "Management Guide" : "ব্যবস্থাপনা গাইড",
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildGuideCard(
                        context,
                        icon: Icons.analytics_outlined,
                        title: provider.isEnglish ? "Growth" : "বৃদ্ধি",
                        color: Colors.orange,
                        onTap: () =>
                            _showGrowthChart(context, provider.isEnglish),
                      ),
                      _buildGuideCard(
                        context,
                        icon: Icons.vaccines_outlined,
                        title: provider.isEnglish ? "Vaccines" : "ভ্যাকসিন",
                        color: Colors.redAccent,
                        onTap: () =>
                            _showVaccineSchedule(context, provider.isEnglish),
                      ),
                      _buildGuideCard(
                        context,
                        icon: Icons.restaurant_menu_outlined,
                        title: provider.isEnglish ? "Feeding" : "খাদ্য",
                        color: Colors.blue,
                        onTap: () =>
                            _showFeedingGuide(context, provider.isEnglish),
                      ),
                      _buildGuideCard(
                        context,
                        icon: Icons.wb_sunny_outlined,
                        title: provider.isEnglish ? "Temp" : "তাপমাত্রা",
                        color: Colors.teal,
                        onTap: () =>
                            _showTempGuide(context, provider.isEnglish),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // --- 4. NEW: Farm Tips & Bio-Security Section ---
                _buildGuideHeader(
                  provider.isEnglish,
                  Icons.tips_and_updates_rounded,
                  provider.isEnglish ? "Smart Farming Tips" : "ফার্মিং টিপস",
                ),
                const SizedBox(height: 12),
                _buildTipTile(
                  icon: Icons.water_drop_rounded,
                  title: provider.isEnglish
                      ? "Water Purification"
                      : "পানি পরিশোধন",
                  subtitle: provider.isEnglish
                      ? "Chlorine & Bleaching mix"
                      : "ব্লিচিং ও ক্লোরিন মিশ্রণ",
                  color: Colors.blueAccent,
                  onTap: () =>
                      _showDetailedTip(context, provider.isEnglish, "water"),
                ),
                _buildTipTile(
                  icon: Icons.house_rounded,
                  title: provider.isEnglish
                      ? "House Orientation"
                      : "ঘর নির্মাণ পদ্ধতি",
                  subtitle: provider.isEnglish
                      ? "East-West Ventilation"
                      : "পূর্ব-পশ্চিম সঠিক ভেন্টিলেশন",
                  color: Colors.brown,
                  onTap: () =>
                      _showDetailedTip(context, provider.isEnglish, "house"),
                ),
                _buildTipTile(
                  icon: Icons.security_rounded,
                  title: provider.isEnglish ? "Bio-Security" : "জৈব নিরাপত্তা",
                  subtitle: provider.isEnglish
                      ? "Keep farm disease-free"
                      : "খামার রোগমুক্ত রাখার উপায়",
                  color: Colors.green,
                  onTap: () =>
                      _showDetailedTip(context, provider.isEnglish, "security"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  // --- UI COMPONENTS ---

  Widget _buildGuideHeader(bool isEnglish, IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.teal),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildToolCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }

  // --- INTERACTIVE TOOLS ---

  void _showFCRCalculator(BuildContext context, bool isEnglish) {
    final TextEditingController feed = TextEditingController();
    final TextEditingController weight = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
              double res = f / w;
              Navigator.pop(context);
              _showResultDialog(
                context,
                isEnglish,
                "FCR Result",
                "${isEnglish ? "Your FCR is" : "আপনার এফসিআর"}: ${res.toStringAsFixed(2)}",
                res < 1.6,
              );
            },
            child: Text(isEnglish ? "Calculate" : "হিসাব করুন"),
          ),
        ],
      ),
    );
  }

  void _showSpacePlanner(BuildContext context, bool isEnglish) {
    final TextEditingController len = TextEditingController();
    final TextEditingController wid = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
                  (double.tryParse(len.text) ?? 0) *
                  (double.tryParse(wid.text) ?? 0);
              Navigator.pop(context);
              _showResultDialog(
                context,
                isEnglish,
                "Space Result",
                "${isEnglish ? "Area" : "জায়গা"}: ${area.toStringAsFixed(0)} sqft\n"
                    "${isEnglish ? "Winter Capacity" : "শীতকালীন ক্ষমতা"}: ${(area / 1.0).floor()} birds\n"
                    "${isEnglish ? "Summer Capacity" : "গ্রীষ্মকালীন ক্ষমতা"}: ${(area / 1.5).floor()} birds",
                true,
              );
            },
            child: Text(isEnglish ? "Analyze" : "বিশ্লেষণ"),
          ),
        ],
      ),
    );
  }

  void _showResultDialog(
    BuildContext context,
    bool isEnglish,
    String title,
    String msg,
    bool isGood,
  ) {
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

  // --- AUTH & DATA SHEETS ---

  Widget _buildAuthSection(DiseaseProvider provider) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        bool isLoggedIn = snapshot.hasData && snapshot.data != null;
        if (isLoggedIn) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.teal.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.teal.shade50,
                    child: const Icon(Icons.person, color: Colors.teal),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.isEnglish ? "My Profile" : "আমার প্রোফাইল",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          snapshot.data?.email ?? "",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          );
        }
        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(
                provider.isEnglish
                    ? "Unlock full service with account"
                    : "অ্যাকাউন্ট দিয়ে পূর্ণ সুবিধা আনলক করুন",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AuthScreen()),
                ),
                child: Text(
                  provider.isEnglish ? "Login or Sign Up" : "লগইন বা সাইন আপ",
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showGrowthChart(BuildContext context, bool isEnglish) {
    _showSheet(
      context,
      isEnglish ? "Growth & FCR Standard" : "বৃদ্ধি ও এফসিআর স্ট্যান্ডার্ড",
      [
        _tableRow(isEnglish ? "Age" : "বয়স", "Weight", "FCR"),
        const Divider(),
        _tableRow("1 Day", "62g", "-"),
        _tableRow("14 Day", "527g", "1.04"),
        _tableRow("28 Day", "1604g", "1.34"),
        _tableRow("40 Day", "2755g", "1.58"),
      ],
    );
  }

  void _showVaccineSchedule(BuildContext context, bool isEnglish) {
    _showSheet(context, isEnglish ? "Vaccination List" : "টিকাদান তালিকা", [
      _listRow(
        "Day 1",
        isEnglish ? "IB (Live) - Eye Drop" : "আইবি (লাইভ) - চোখে ড্রপ",
      ),
      _listRow(
        "Day 3-5",
        isEnglish ? "ND/Ranikhet - Eye Drop" : "রানীক্ষেত - চোখে ড্রপ",
      ),
      _listRow(
        "Day 10-12",
        isEnglish ? "IBD/Gumboro - Eye Drop" : "গামবোরো - চোখে ড্রপ",
      ),
      _listRow(
        "Day 22-24",
        isEnglish ? "ND/Ranikhet - Water" : "রানীক্ষেত - পানির সাথে",
      ),
    ]);
  }

  void _showFeedingGuide(BuildContext context, bool isEnglish) {
    _showSheet(context, isEnglish ? "Feeding Schedule" : "খাদ্য তালিকা", [
      _listRow("0-14 Days", isEnglish ? "Starter" : "স্টার্টার"),
      _listRow("15-24 Days", isEnglish ? "Grower" : "গ্রোয়ার"),
      _listRow("25+ Days", isEnglish ? "Finisher" : "ফিনিশার"),
    ]);
  }

  void _showTempGuide(BuildContext context, bool isEnglish) {
    _showSheet(context, isEnglish ? "Brooding Temp" : "ব্রুডিং তাপমাত্রা", [
      _tableRow("Week 1", "33-35°C", "95°F"),
      _tableRow("Week 2", "32°C", "90°F"),
      _tableRow("Week 3", "29°C", "85°F"),
    ]);
  }

  void _showDetailedTip(BuildContext context, bool isEnglish, String type) {
    String title = "";
    List<Widget> content = [];
    if (type == "water") {
      title = isEnglish ? "Water Treatment" : "পানি পরিশোধন";
      content = [
        _listRow("Chlorine", "1 tablet / 500 L"),
        _listRow("Bleaching", "3g / 100 L"),
      ];
    } else if (type == "house") {
      title = isEnglish ? "House Setup" : "ঘর নির্মাণ";
      content = [
        _listRow("Width", "20-25 ft"),
        _listRow("Direction", "East-West"),
      ];
    } else if (type == "security") {
      title = isEnglish ? "Bio-Security" : "জৈব নিরাপত্তা";
      content = [
        _listRow("Footbath", "Gate usage"),
        _listRow("Visitors", "No entry"),
      ];
    }
    _showSheet(context, title, content);
  }

  void _showSheet(BuildContext context, String title, List<Widget> children) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...children,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _tableRow(String c1, String c2, String c3) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              c1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(c2, textAlign: TextAlign.center)),
          Expanded(child: Text(c3, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  Widget _listRow(String key, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• $key: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.teal,
            ),
          ),
          Expanded(child: Text(val, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  // --- CORE DETECTION LOGIC (UNCHANGED) ---

  Widget buildResultCard(dynamic output, bool isEnglish) {
    String rawLabel = output['label'].toString();
    String cleanId = _getCleanId(rawLabel);
    String formattedLabel = formatLabel(rawLabel, isEnglish);
    double confidence = (output['confidence'] as double) * 100;
    if (cleanId == 'others') return CustomWidgets.buildInvalidCard(isEnglish);
    bool isHealthy = cleanId == 'healthy';
    Color themeColor = isHealthy ? Colors.green : Colors.redAccent;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: isHealthy ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: themeColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            formattedLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${isEnglish ? "Confidence" : "নিশ্চয়তা"}: ${confidence.toStringAsFixed(1)}%",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseInfo(String rawLabel, bool isEnglish) {
    String id = _getCleanId(rawLabel);
    if (id == "healthy" || id == 'others') return const SizedBox.shrink();
    final data = diseaseInfo[id];
    if (data == null) return const SizedBox.shrink();
    return Column(
      children: [
        CustomWidgets.buildInfoTile(
          title: isEnglish ? "Symptoms" : "লক্ষণ",
          content: isEnglish
              ? (data['symptoms_en'] ?? "")
              : (data['symptoms'] ?? ""),
          icon: Icons.warning_amber_rounded,
          accentColor: Colors.orange,
        ),
        CustomWidgets.buildInfoTile(
          title: isEnglish ? "Prevention" : "প্রতিরোধ",
          content: isEnglish
              ? (data['prevention_en'] ?? "")
              : (data['prevention'] ?? ""),
          icon: Icons.shield_outlined,
          accentColor: Colors.blue,
        ),
        CustomWidgets.buildInfoTile(
          title: isEnglish ? "Treatment" : "প্রাথমিক চিকিৎসা",
          content: isEnglish
              ? (data['treatment_en'] ?? "")
              : (data['treatment'] ?? ""),
          icon: Icons.medical_services_outlined,
          accentColor: Colors.green,
        ),
      ],
    );
  }

  String _getCleanId(String label) {
    String clean = label.replaceAll(RegExp(r'[0-9]'), '').trim().toLowerCase();
    if (clean.contains('others')) return 'others';
    if (clean.contains('cocci')) return 'cocci';
    if (clean.contains('ncd')) return 'ncd';
    if (clean.contains('salmo')) return 'salmo';
    if (clean.contains('healthy')) return 'healthy';
    if (clean.contains('crd')) return 'crd';
    if (clean.contains('fowlpox')) return 'fowlpox';
    if (clean.contains('bumblefoot')) return 'bumblefoot';
    if (clean.contains('coryza')) return 'coryza';
    return clean;
  }

  String formatLabel(String label, bool isEnglish) {
    String clean = _getCleanId(label);
    switch (clean) {
      case 'others':
        return isEnglish ? 'Invalid Image' : 'সঠিক ছবি নয়';
      case 'cocci':
        return isEnglish ? 'Coccidiosis' : 'রক্ত আমাশয়';
      case 'healthy':
        return isEnglish ? 'Healthy' : 'সুস্থ মুরগি';
      case 'ncd':
        return isEnglish ? 'Newcastle Disease' : 'রানীক্ষেত';
      case 'salmo':
        return isEnglish ? 'Salmonella' : 'সালমোনেলা';
      case 'crd':
        return isEnglish ? 'CRD' : 'সিআরডি (শ্বাসকষ্ট)';
      case 'fowlpox':
        return isEnglish ? 'Fowl Pox' : 'বসন্ত (পক্স)';
      case 'bumblefoot':
        return isEnglish ? 'Bumblefoot' : 'বাম্বলফুট';
      case 'coryza':
        return isEnglish ? 'Coryza' : 'কোরাইজা (সর্দি)';
      default:
        return clean.isNotEmpty
            ? '${clean[0].toUpperCase()}${clean.substring(1)}'
            : clean;
    }
  }
}
