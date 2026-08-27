import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/admin_dashboard_screen.dart';
import '../auth_screen.dart';

class AppDrawer extends StatelessWidget {
  final bool isEnglish;
  final Function(int mainTabIndex, {int? homeSubTabIndex}) onSelectTab;
  final VoidCallback onToggleLanguage;

  const AppDrawer({
    super.key,
    required this.isEnglish,
    required this.onSelectTab,
    required this.onToggleLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Drawer Header
          _buildDrawerHeader(context, user, isDark),

          // Drawer Body Options
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              children: [
                _buildSectionTitle(context, isEnglish ? "Home Tabs" : "হোম সেকশন"),
                _buildDrawerItem(
                  context,
                  icon: Icons.home_rounded,
                  title: isEnglish ? "Default Home" : "ডিফল্ট হোম",
                  subtitle: isEnglish ? "Main Dashboard & Tools" : "প্রধান ড্যাশবোর্ড ও সেবাসমূহ",
                  color: Colors.teal,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(0, homeSubTabIndex: 0);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.pets_rounded,
                  title: isEnglish ? "Parents Stock" : "প্যারেন্টস স্টক",
                  subtitle: isEnglish ? "Breeder Flocks & Management" : "ব্রিডার স্টক ও নির্দেশিকা",
                  color: Colors.indigo,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(0, homeSubTabIndex: 1);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.egg_rounded,
                  title: isEnglish ? "Hatchery" : "হ্যাচারি",
                  subtitle: isEnglish ? "Incubation & Chick Production" : "ইনকিউবেশন ও বাচ্চা উৎপাদন",
                  color: Colors.orange.shade800,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(0, homeSubTabIndex: 2);
                  },
                ),

                const Divider(height: 24, indent: 8, endIndent: 8),
                _buildSectionTitle(context, isEnglish ? "Quick Navigation" : "দ্রুত নেভিগেশন"),

                _buildDrawerItem(
                  context,
                  icon: Icons.center_focus_strong_rounded,
                  title: isEnglish ? "Disease Detection" : "রোগ নির্ণয়",
                  subtitle: isEnglish ? "AI Poultry Diagnostics" : "এআই দিয়ে রোগ শনাক্ত করুন",
                  color: Colors.teal.shade700,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(1);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.search_rounded,
                  title: isEnglish ? "Search & Market" : "খুঁজুন ও বাজার দর",
                  subtitle: isEnglish ? "Live Price & Directory" : "লাইভ বাজার দর ও সমাধান",
                  color: Colors.blue.shade700,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(2);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.medical_services_rounded,
                  title: isEnglish ? "Doctors Directory" : "ডাক্তারদের তালিকা",
                  subtitle: isEnglish ? "Veterinary Specialists" : "পোল্ট্রি বিশেষজ্ঞ ডাক্তার",
                  color: Colors.deepPurple,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(3);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.folder_shared_rounded,
                  title: isEnglish ? "DataBank" : "ডেটাব্যাংক",
                  subtitle: isEnglish ? "Poultry Library & Diseases" : "তথ্যভাণ্ডার ও গাইড",
                  color: Colors.amber.shade900,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(4);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.person_rounded,
                  title: isEnglish ? "Profile Settings" : "প্রোফাইল সেটিংস",
                  subtitle: isEnglish ? "Account & Preferences" : "অ্যাকাউন্ট ও সেটিংস",
                  color: Colors.cyan.shade800,
                  onTap: () {
                    Navigator.pop(context);
                    onSelectTab(5);
                  },
                ),

                // Admin Dashboard if admin user
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

                      if (!isAdmin) return const SizedBox.shrink();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(height: 24, indent: 8, endIndent: 8),
                          _buildSectionTitle(context, isEnglish ? "Administration" : "এডমিন প্যানেল"),
                          _buildDrawerItem(
                            context,
                            icon: Icons.admin_panel_settings_rounded,
                            title: isEnglish ? "Admin Dashboard" : "এডমিন ড্যাশবোর্ড",
                            subtitle: isEnglish ? "Manage Banners, Prices & Data" : "তথ্য ও বাজার দর নিয়ন্ত্রণ",
                            color: Colors.redAccent,
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AdminDashboardScreen(isEnglish: isEnglish),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
              ],
            ),
          ),

          // Drawer Footer Actions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.grey.shade900
                  : Colors.teal.shade50.withOpacity(0.5),
              border: Border(
                top: BorderSide(
                  color: isDark ? Colors.grey.shade800 : Colors.teal.shade100,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.teal,
                      side: const BorderSide(color: Colors.teal),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.language_rounded, size: 18),
                    label: Text(
                      isEnglish ? "বাংলা ভাষা" : "English Mode",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      onToggleLanguage();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                if (user != null)
                  IconButton(
                    tooltip: isEnglish ? "Sign Out" : "লগ আউট",
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.red.shade50,
                      foregroundColor: Colors.redAccent,
                    ),
                    icon: const Icon(Icons.logout_rounded),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  )
                else
                  IconButton(
                    tooltip: isEnglish ? "Sign In" : "লগ ইন",
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.teal.shade100,
                      foregroundColor: Colors.teal,
                    ),
                    icon: const Icon(Icons.login_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AuthScreen()),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context, User? user, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF0F2027), const Color(0xFF203A43)]
              : [const Color(0xFF004D40), const Color(0xFF00796B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.pets_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "MurgiCare",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      isEnglish ? "Smart Poultry Care" : "স্মার্ট পোল্ট্রি কেয়ার",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (user != null) ...[
            Text(
              user.displayName ?? (user.email ?? "Farmer Account"),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (user.email != null)
              Text(
                user.email!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ] else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isEnglish ? "Guest User" : "অতিথি ব্যবহারকারী",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 6, top: 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.teal.shade700,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        onTap: onTap,
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 13, color: Colors.grey),
      ),
    );
  }
}
