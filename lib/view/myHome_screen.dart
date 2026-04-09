import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';
import '../core/app_strings.dart';
import 'tabs/detection_tab.dart';
import 'tabs/tools_tab.dart';
import 'tabs/profile_tab.dart';
import 'auth_screen.dart';
import 'widgets/custom_widgets.dart';

class MyhomeScreen extends StatefulWidget {
  const MyhomeScreen({super.key});

  @override
  State<MyhomeScreen> createState() => _MyhomeScreenState();
}

class _MyhomeScreenState extends State<MyhomeScreen> {
  int _currentIndex = 0;

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CustomWidgets.handleAppUpdate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiseaseProvider>(
      builder: (context, provider, child) {
        final List<Widget> tabs = [
          DetectionTab(showLoginDialog: _showLoginDialog),
          ToolsTab(isEnglish: provider.isEnglish),
          ProfileTab(isEnglish: provider.isEnglish),
        ];

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: _buildAppBar(context, provider),
          body: IndexedStack(index: _currentIndex, children: tabs),
          bottomNavigationBar: _buildBottomNav(context, provider.isEnglish),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, DiseaseProvider provider) {
    return AppBar(
      leading: (_currentIndex == 0 && provider.image != null)
          ? IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.redAccent),
              onPressed: () => provider.reset(),
              tooltip: provider.isEnglish ? "Reset" : "রিসেট",
            )
          : const SizedBox.shrink(),
      title: Text(
        'MurgiCare Detector',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Theme.of(context).brightness == Brightness.light
              ? const Color.fromARGB(255, 8, 63, 9)
              : const Color(0xFF4ADE80),
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      actions: [
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
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(1.0),
      //   child: Container(color: Theme.of(context).dividerColor, height: 1.0),
      // ),
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isEnglish) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics_outlined),
            activeIcon: const Icon(Icons.analytics_rounded),
            label: isEnglish ? "Detect" : "শনাক্ত",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.build_circle_outlined),
            activeIcon: const Icon(Icons.build_circle_rounded),
            label: isEnglish ? "Tools" : "টুলস",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: isEnglish ? "Profile" : "প্রোফাইল",
          ),
        ],
      ),
    );
  }
}
