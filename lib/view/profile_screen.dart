import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:murgi_care/controller/controller.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final isEnglish = context.read<DiseaseProvider>().isEnglish;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Light background for contrast
      appBar: AppBar(
        title: Text(isEnglish ? "My Profile" : "আমার প্রোফাইল"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final userData = snapshot.data?.data() as Map<String, dynamic>?;

          return SingleChildScrollView(
            child: Column(
              children: [
                // --- Header Profile Section ---
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey[200],
                              backgroundImage:
                                  (userData?['profilePic'] != null &&
                                      userData!['profilePic'] != '')
                                  ? NetworkImage(userData['profilePic'])
                                  : null,
                              child:
                                  (userData?['profilePic'] == null ||
                                      userData?['profilePic'] == '')
                                  ? const Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Colors.teal,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        userData?['name'] ?? "User Name",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user?.email ?? "",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // --- Info Card ---
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Theme.of(context).dividerColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _buildInfoRow(
                                Icons.phone_android_rounded,
                                isEnglish ? "Phone" : "ফোন",
                                userData?['phone'] ?? "N/A",
                                Colors.blue,
                              ),
                              const Divider(height: 30),
                              _buildInfoRow(
                                Icons.location_on_rounded,
                                isEnglish ? "Address" : "ঠিকানা",
                                userData?['address'] ?? "N/A",
                                Colors.orange,
                              ),
                              const Divider(height: 30),
                              _buildInfoRow(
                                Icons.work_rounded,
                                isEnglish ? "Occupation" : "ধরণ",
                                userData?['userType'] ?? "Farmer",
                                Colors.purple,
                              ),
                              const Divider(height: 30),
                              _buildInfoRow(
                                Icons.wc_rounded,
                                isEnglish ? "Gender" : "লিঙ্গ",
                                userData?['gender'] ?? "N/A",
                                Colors.pink,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // --- Action Buttons ---
                      _buildActionButton(
                        onPressed: () => _handleLogout(context, isEnglish),
                        icon: Icons.logout_rounded,
                        label: isEnglish ? "Logout" : "লগ আউট",
                        color: Colors.orange.shade800,
                        isOutlined: true,
                      ),
                      const SizedBox(height: 16),
                      _buildActionButton(
                        onPressed: () => _showDeleteDialog(context, isEnglish),
                        icon: Icons.delete_forever_rounded,
                        label: isEnglish
                            ? "Delete Account"
                            : "অ্যাকাউন্ট মুছে ফেলুন",
                        color: Colors.red.shade700,
                        isOutlined: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
    Color iconColor,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
    required bool isOutlined,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: isOutlined
          ? OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: color, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                foregroundColor: color,
              ),
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          : ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
    );
  }

  void _handleLogout(BuildContext context, bool isEnglish) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) Navigator.pop(context);
  }

  void _showDeleteDialog(BuildContext context, bool isEnglish) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(isEnglish ? "Delete Account?" : "অ্যাকাউন্ট মুছবেন?"),
        content: Text(
          isEnglish
              ? "This action is permanent and will delete all your data."
              : "এই কাজটি স্থায়ী এবং আপনার সব ডাটা মুছে যাবে।",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              isEnglish ? "Cancel" : "বাতিল",
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.currentUser?.delete();
                if (context.mounted)
                  Navigator.popUntil(context, (route) => route.isFirst);
              } catch (e) {
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please re-login to perform this action."),
                    ),
                  );
                }
              }
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
