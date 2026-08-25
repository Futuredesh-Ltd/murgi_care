import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/controller.dart';
import '../core/app_strings.dart';
import 'tabs/home_tab.dart';
import 'tabs/detection_tab.dart';
import 'tabs/search_tab.dart';
import 'tabs/doctors_tab.dart';
import 'tabs/databank_tab.dart';
import 'tabs/profile_tab.dart';
import 'screens/admin_dashboard_screen.dart';
import 'auth_screen.dart';
import 'widgets/custom_widgets.dart';
import 'widgets/scale_animation_page.dart';

class MyhomeScreen extends StatefulWidget {
  const MyhomeScreen({super.key});

  @override
  State<MyhomeScreen> createState() => _MyhomeScreenState();
}

class _MyhomeScreenState extends State<MyhomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CustomWidgets.handleAppUpdate(context);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _showLoginDialog(BuildContext context, bool isEnglish) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(AppStrings.limitReached(isEnglish)),
        content: Text(AppStrings.limitMessage(isEnglish)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppStrings.cancel(isEnglish)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AuthScreen()),
              );
            },
            child: Text(AppStrings.loginOrRegister(isEnglish)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiseaseProvider>(
      builder: (context, provider, child) {
        final List<Widget> tabs = [
          ScaleAnimationPage(
            key: const ValueKey(0),
            child: HomeTab(
              isEnglish: provider.isEnglish,
              onOpenDetection: () => _onTabSelected(1),
            ),
          ),
          ScaleAnimationPage(
            key: const ValueKey(1),
            child: DetectionTab(showLoginDialog: _showLoginDialog),
          ),
          ScaleAnimationPage(
            key: const ValueKey(2),
            child: SearchTab(isEnglish: provider.isEnglish),
          ),
          ScaleAnimationPage(
            key: const ValueKey(3),
            child: DoctorsTab(isEnglish: provider.isEnglish),
          ),
          ScaleAnimationPage(
            key: const ValueKey(4),
            child: DataBankTab(isEnglish: provider.isEnglish),
          ),
          ScaleAnimationPage(
            key: const ValueKey(5),
            child: ProfileTab(isEnglish: provider.isEnglish),
          ),
        ];

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          extendBody: true,
          appBar: _buildAppBar(context, provider),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: tabs,
          ),
          bottomNavigationBar: _buildBottomNav(context, provider.isEnglish),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, DiseaseProvider provider) {
    final user = FirebaseAuth.instance.currentUser;

    return AppBar(
      leading: (_currentIndex == 1 && provider.image != null)
          ? IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.redAccent),
              onPressed: () => provider.reset(),
              tooltip: provider.isEnglish ? "Reset" : "রিসেট",
            )
          : const SizedBox.shrink(),
      title: Text(
        'MurgiCare',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Theme.of(context).brightness == Brightness.light
              ? const Color.fromARGB(255, 8, 63, 9)
              : const Color(0xFF4ADE80),
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      actions: [
        if (user != null)
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .snapshots(),
            builder: (context, snapshot) {
              final data = snapshot.data?.data() as Map<String, dynamic>?;
              final userType = data?['userType'] ?? '';
              final bool isAdmin =
                  user.email?.toLowerCase().trim() == 'admin@gmail.com' ||
                  userType.toString().toLowerCase() == 'admin';

              if (isAdmin) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ActionChip(
                    avatar: const Icon(
                      Icons.admin_panel_settings,
                      size: 16,
                      color: Colors.white,
                    ),
                    label: Text(
                      provider.isEnglish ? "ADMIN" : "এডমিন",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AdminDashboardScreen(
                            isEnglish: provider.isEnglish,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        TextButton(
          onPressed: () => provider.toggleLanguage(),
          child: Text(
            provider.isEnglish ? "বাংলা" : "ENG",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isEnglish) {
    final List<Map<String, dynamic>> navItems = [
      {
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home_rounded,
        'label': isEnglish ? "Home" : "হোম",
      },
      {
        'icon': Icons.center_focus_strong_outlined,
        'activeIcon': Icons.center_focus_strong_rounded,
        'label': isEnglish ? "Detect" : "শনাক্ত",
        'isSpecial': true,
      },
      {
        'icon': Icons.search_outlined,
        'activeIcon': Icons.search_rounded,
        'label': isEnglish ? "Search" : "খুঁজুন",
      },
      {
        'icon': Icons.medical_services_outlined,
        'activeIcon': Icons.medical_services_rounded,
        'label': isEnglish ? "Doctors" : "ডাক্তার",
      },
      {
        'icon': Icons.folder_shared_outlined,
        'activeIcon': Icons.folder_shared_rounded,
        'label': isEnglish ? "DataBank" : "ডেটাব্যাংক",
      },
      {
        'icon': Icons.person_outline,
        'activeIcon': Icons.person_rounded,
        'label': isEnglish ? "Profile" : "প্রোফাইল",
      },
    ];

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.95),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isDark
                  ? Colors.teal.withOpacity(0.3)
                  : Colors.teal.withOpacity(0.18),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.4)
                    : Colors.teal.withOpacity(0.12),
                blurRadius: 18,
                spreadRadius: 2,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isSelected = _currentIndex == index;
              final isSpecial = item['isSpecial'] == true;

              return Expanded(
                child: GestureDetector(
                  onTap: () => _onTabSelected(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 6,
                    ),
                    decoration: isSelected
                        ? BoxDecoration(
                            color: isSpecial
                                ? Colors.teal
                                : Colors.teal.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(22),
                          )
                        : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isSelected ? item['activeIcon'] : item['icon'],
                          size: isSelected ? 21 : 19,
                          color: isSelected
                              ? (isSpecial ? Colors.white : Colors.teal)
                              : (isDark
                                    ? Colors.white60
                                    : Colors.grey.shade600),
                        ),
                        const SizedBox(height: 2),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: isSelected ? 10 : 9,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? (isSpecial ? Colors.white : Colors.teal)
                                : (isDark
                                      ? Colors.white60
                                      : Colors.grey.shade600),
                          ),
                          child: Text(
                            item['label'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
