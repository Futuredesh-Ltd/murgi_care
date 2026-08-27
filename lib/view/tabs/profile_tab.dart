import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../auth_screen.dart';
import '../profile_screen.dart';
import '../screens/admin_dashboard_screen.dart';
import '../../controller/riverpod_providers.dart';

class ProfileTab extends ConsumerWidget {
  final bool isEnglish;

  const ProfileTab({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(diseaseRiverpodProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Icon(Icons.person_pin, size: 80, color: Colors.teal.shade200),
          const SizedBox(height: 16),
          Text(
            provider.isEnglish ? "Account Settings" : "অ্যাকাউন্ট সেটিংস",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          
          // Dark Mode Toggle
          Material(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.teal.withOpacity(0.2)),
              ),
              child: SwitchListTile(
                title: Text(
                  provider.isEnglish ? "Dark Mode" : "ডার্ক মোড",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                secondary: const Icon(Icons.dark_mode_rounded, color: Colors.teal),
                value: provider.themeMode == ThemeMode.dark,
                onChanged: (value) => ref.read(diseaseRiverpodProvider.notifier).toggleTheme(),
                activeColor: Colors.teal,
              ),
            ),
          ),
          const SizedBox(height: 16),

              // Admin Panel Navigation Tile (Strictly for Admin users only)
              Builder(
                builder: (context) {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user == null) return const SizedBox.shrink();

                  return StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, authSnap) {
                      if (!authSnap.hasData || authSnap.data == null) return const SizedBox.shrink();
                      
                      final currentUser = authSnap.data!;
                      return StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance.collection('users').doc(currentUser.uid).snapshots(),
                        builder: (context, userSnap) {
                          final data = userSnap.data?.data() as Map<String, dynamic>?;
                          final userType = data?['userType'] ?? '';
                          final bool isAdmin = currentUser.email?.toLowerCase().trim() == 'admin@gmail.com' ||
                              userType.toString().toLowerCase() == 'admin';

                          if (!isAdmin) return const SizedBox.shrink();

                          return Column(
                            children: [
                              Material(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.teal.withOpacity(0.2)),
                                  ),
                                  child: ListTile(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AdminDashboardScreen(isEnglish: provider.isEnglish),
                                      ),
                                    ),
                                    leading: const Icon(Icons.admin_panel_settings_rounded, color: Colors.redAccent),
                                    title: Text(
                                      provider.isEnglish ? "Admin Control Panel" : "এডমিন কন্ট্রোল প্যানেল",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      provider.isEnglish ? "Manage Banners, Prices, Announcements" : "ব্যানার, বাজার দর ও কনটেন্ট নিয়ন্ত্রণ",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.teal),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),

              _buildAuthSection(context, provider.isEnglish),
            ],
          ),
        );
  }

  Widget _buildAuthSection(BuildContext context, bool isEnglish) {
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.teal.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
                ],
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
                          isEnglish ? "My Profile" : "আমার প্রোফাইল",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          snapshot.data?.email ?? "",
                          style: TextStyle(color: Colors.grey[600], fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.teal),
                ],
              ),
            ),
          );
        }
        
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.teal.withOpacity(0.1)),
          ),
          child: Column(
            children: [
              Icon(Icons.lock_outline_rounded, size: 40, color: Colors.teal.shade300),
              const SizedBox(height: 16),
              Text(
                isEnglish ? "Unlock full service with an account" : "অ্যাকাউন্ট দিয়ে পূর্ণ সুবিধা আনলক করুন",
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AuthScreen()),
                  ),
                  child: Text(
                    isEnglish ? "Login or Sign Up" : "লগইন বা সাইন আপ",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
