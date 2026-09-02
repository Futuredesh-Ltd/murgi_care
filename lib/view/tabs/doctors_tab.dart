import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/poultry_service.dart';
import '../../model/doctor_model.dart';
import '../../model/doctor_request_model.dart';
import '../../controller/riverpod_providers.dart';

class DoctorsTab extends ConsumerWidget {
  final bool isEnglish;

  const DoctorsTab({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = isEnglish;
    final searchQuery = ref.watch(doctorsTabProvider);
    final poultryService = PoultryService();
    final user = FirebaseAuth.instance.currentUser;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (val) =>
                ref.read(doctorsTabProvider.notifier).setSearchQuery(val),
            decoration: InputDecoration(
              hintText: isEng
                  ? "Search doctor by name, district or specialty..."
                  : "ডাক্তারের নাম, জেলা বা বিশেষজ্ঞতা দিয়ে খুঁজুন...",
              prefixIcon: const Icon(Icons.search, color: Colors.teal),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              filled: true,
              fillColor: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 16),

          Text(
            isEng
                ? "Veterinary Doctors & Specialists"
                : "পশুচিকিৎসক ও বিশেষজ্ঞবৃন্দ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            isEng
                ? "To contact doctors via phone or WhatsApp, please submit an access request to Admin."
                : "ডাক্তারের ফোন নম্বর বা হোয়াটসঅ্যাপ এক্সেসের জন্য অনুরোধ বাটনে চাপ দিন (এডমিন অনুমোদন করবেন)।",
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
          const SizedBox(height: 16),

          // User Contact Requests Stream
          StreamBuilder<List<DoctorContactRequest>>(
            stream: poultryService.getUserDoctorRequestsStream(user?.uid ?? ''),
            builder: (context, reqSnapshot) {
              final userRequests = reqSnapshot.data ?? [];

              return StreamBuilder<List<Doctor>>(
                stream: poultryService.getDoctorsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  var doctors = snapshot.data ?? [];
                  if (searchQuery.isNotEmpty) {
                    doctors = doctors.where((d) {
                      return d.name
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()) ||
                          d.district
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()) ||
                          d.specialization
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase());
                    }).toList();
                  }

                  if (doctors.isEmpty) {
                    return Container(
                      padding: const EdgeInsets.all(32),
                      alignment: Alignment.center,
                      child: Text(
                        isEng
                            ? "No doctors found."
                            : "কোনো ডাক্তার তথ্য পাওয়া যায়নি।",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doc = doctors[index];
                      // Find matching request for this doctor
                      DoctorContactRequest? docReq;
                      try {
                        docReq = userRequests.firstWhere((r) => r.doctorId == doc.id);
                      } catch (_) {
                        docReq = null;
                      }

                      return _buildDoctorCard(
                        context: context,
                        doc: doc,
                        request: docReq,
                        poultryService: poultryService,
                        user: user,
                        isEng: isEng,
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard({
    required BuildContext context,
    required Doctor doc,
    required DoctorContactRequest? request,
    required PoultryService poultryService,
    required User? user,
    required bool isEng,
  }) {
    final bool isAccepted = request?.isApproved ?? false;
    final bool isPending = request?.status == 'pending' && !isAccepted;
    final bool isRejected = request?.status == 'rejected' && !isAccepted;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => _showFullScreenImageDialog(context, doc.name, doc.profileImage),
                  child: Tooltip(
                    message: "ছবি বড় করে দেখুন",
                    child: _buildDoctorAvatarWidget(doc.profileImage, radius: 36),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doc.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        doc.qualification,
                        style: TextStyle(
                            fontSize: 13,
                            color: isDark ? Colors.grey[300] : Colors.grey[800]),
                      ),
                      Text(
                        doc.specialization,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            if (doc.description.isNotEmpty) ...[
              Text(
                doc.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey[300] : Colors.grey[800]),
              ),
              const SizedBox(height: 8),
            ],
            _infoRow(context, Icons.work_history_rounded,
                isEng ? "Experience" : "অভিজ্ঞতা", doc.experience),
            _infoRow(
                context,
                Icons.location_on_rounded,
                isEng ? "Chamber Address" : "চেম্বার ঠিকানা",
                "${doc.address}, ${doc.district} ${doc.upazila.isNotEmpty ? '(${doc.upazila})' : ''}"),
            if (doc.availableTime.isNotEmpty)
              _infoRow(context, Icons.access_time_rounded,
                  isEng ? "Visiting Time" : "সাক্ষাতের সময়", doc.availableTime),
            const SizedBox(height: 12),

            // CONTACT ACCESS SECTION
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isAccepted
                    ? (isDark ? Colors.green.shade900.withOpacity(0.3) : Colors.green.shade50)
                    : (isPending
                        ? (isDark ? Colors.amber.shade900.withOpacity(0.3) : Colors.amber.shade50)
                        : (isDark ? Colors.teal.shade900.withOpacity(0.3) : Colors.teal.shade50)),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isAccepted
                      ? Colors.green
                      : (isPending ? Colors.amber : Colors.teal.shade200),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isAccepted) ...[
                    Row(
                      children: const [
                        Icon(Icons.verified_rounded, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Text(
                          "নম্বর এক্সেস অনুমোদিত (Approved)",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 16, color: Colors.teal),
                        const SizedBox(width: 6),
                        Text("ফোন: ${doc.phone}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    if (doc.whatsapp.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.chat, size: 16, color: Colors.green),
                          const SizedBox(width: 6),
                          Text("WhatsApp: ${doc.whatsapp}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ],
                  ] else if (isPending) ...[
                    Row(
                      children: const [
                        Icon(Icons.hourglass_top_rounded,
                            color: Colors.amber, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "অনুরোধ পেন্ডিং রয়েছে (এডমিন অনুমোদনের অপেক্ষায়)",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ] else if (isRejected) ...[
                    Row(
                      children: const [
                        Icon(Icons.gpp_bad_rounded,
                            color: Colors.redAccent, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "অনুরোধ প্রত্যাখ্যাত করা হয়েছে।",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    Row(
                      children: const [
                        Icon(Icons.lock_rounded, color: Colors.teal, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "নম্বর দেখতে ও হোয়াটসঅ্যাপ করতে এডমিনের অনুমতি প্রয়োজন।",
                            style: TextStyle(fontSize: 12, color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showDoctorDetailDialog(
                        context, doc, request, poultryService, user, isEng),
                    icon: const Icon(Icons.info_outline, size: 16),
                    label: Text(
                      isEng ? "View Details" : "বিস্তারিত",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (isAccepted) ...[
                  IconButton(
                    onPressed: () => _makePhoneCall(doc.phone),
                    icon: const Icon(Icons.call, color: Colors.teal),
                    tooltip: "ফোন করুন",
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _openWhatsApp(doc.whatsapp.isNotEmpty ? doc.whatsapp : doc.phone),
                      icon: const Icon(Icons.chat_rounded, size: 16),
                      label: const Text("WhatsApp", maxLines: 1, overflow: TextOverflow.ellipsis),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ] else if (isPending) ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: null, // Disabled while pending
                      icon: const Icon(Icons.hourglass_empty_rounded, size: 16),
                      label: const Text("অনুরোধ অপেক্ষমাণ", maxLines: 1, overflow: TextOverflow.ellipsis),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _handleContactRequest(
                          context, doc, poultryService, user, isEng),
                      icon: const Icon(Icons.phone_locked_rounded, size: 16),
                      label: Text(
                        isRejected
                            ? "পুনরায় অনুরোধ করুন"
                            : "নম্বরের জন্য অনুরোধ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(BuildContext context, IconData icon, String label, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.teal),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white70 : Colors.black87),
                children: [
                  TextSpan(
                      text: "$label: ",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleContactRequest(
    BuildContext context,
    Doctor doc,
    PoultryService poultryService,
    User? user,
    bool isEng,
  ) {
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("অনুরোধ করতে দয়া করে অ্যাপে লগইন করুন।"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final nameCtrl = TextEditingController(text: user.displayName ?? '');
    final phoneCtrl = TextEditingController(text: user.phoneNumber ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("${doc.name} এর নম্বরের জন্য অনুরোধ"),
        content: SizedBox(
          width: MediaQuery.of(ctx).size.width * 0.85,
          child: SingleChildScrollView(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "আপনার অনুরোধটি এডমিন প্যানেলে পাঠানো হবে। এডমিন অনুমোদন দিলে আপনি সরাসরি কল ও হোয়াটসঅ্যাপ করতে পারবেন।",
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                  labelText: "আপনার নাম *",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "আপনার মোবাইল নম্বর *",
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ],
          ),
        ),
      ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("বাতিল"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () async {
              if (nameCtrl.text.trim().isEmpty || phoneCtrl.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("দয়া করে আপনার নাম ও মোবাইল নম্বর প্রদান করুন।")),
                );
                return;
              }

              final req = DoctorContactRequest(
                id: '',
                userId: user.uid,
                userName: nameCtrl.text.trim(),
                userPhone: phoneCtrl.text.trim(),
                userEmail: user.email ?? '',
                doctorId: doc.id,
                doctorName: doc.name,
                doctorSpecialization: doc.specialization,
                status: 'pending',
                requestedAt: DateTime.now(),
              );

              final ok = await poultryService.requestDoctorContact(req);
              if (ctx.mounted) {
                Navigator.of(ctx).pop();
              }
              if (context.mounted) {
                if (ok) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          "আপনার অনুরোধ সফলভাবে পাঠানো হয়েছে! এডমিন অনুমোদন করলে নম্বর এক্সেস পাবেন।"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("অনুরোধ পাঠাতে ব্যর্থ হয়েছে। আবার চেষ্টা করুন।")),
                  );
                }
              }
            },
            child: const Text("অনুরোধ পাঠান", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showDoctorDetailDialog(
    BuildContext context,
    Doctor doc,
    DoctorContactRequest? request,
    PoultryService poultryService,
    User? user,
    bool isEng,
  ) {
    final bool isAccepted = request?.isApproved ?? false;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(doc.name),
        content: SizedBox(
          width: MediaQuery.of(ctx).size.width * 0.85,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (doc.profileImage.isNotEmpty) ...[
                  GestureDetector(
                    onTap: () => _showFullScreenImageDialog(context, doc.name, doc.profileImage),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: _buildDoctorImageWidget(
                            doc.profileImage,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.fullscreen_rounded, color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                Text("যোগ্যতা: ${doc.qualification}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text("বিশেষজ্ঞতা: ${doc.specialization}",
                    style: const TextStyle(color: Colors.teal)),
                const SizedBox(height: 6),
                Text("অভিজ্ঞতা: ${doc.experience}"),
                const SizedBox(height: 6),
                Text(
                    "জেলা/ঠিকানা: ${doc.address}, ${doc.district} ${doc.upazila.isNotEmpty ? '(${doc.upazila})' : ''}"),
                if (doc.availableTime.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text("সাক্ষাতের সময়সূচী: ${doc.availableTime}"),
                ],
                if (doc.description.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  const Text("বিস্তারিত বিবরণ:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    doc.description,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[300]
                          : Colors.grey[800],
                    ),
                  ),
                ],
                const Divider(height: 24),
                if (isAccepted) ...[
                  Text("ফোন নম্বর: ${doc.phone}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.teal)),
                  const SizedBox(height: 4),
                  Text("WhatsApp: ${doc.whatsapp}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                ] else ...[
                  const Text(
                    "নম্বর জানতে ও কথা বলতে এডমিন অনুমোদনের জন্য অনুরোধ পাঠান।",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("বন্ধ করুন"),
          ),
          if (isAccepted) ...[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                Navigator.pop(ctx);
                _makePhoneCall(doc.phone);
              },
              icon: const Icon(Icons.call, size: 16),
              label: const Text("কল করুন", style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pop(ctx);
                _openWhatsApp(doc.whatsapp.isNotEmpty ? doc.whatsapp : doc.phone);
              },
              icon: const Icon(Icons.chat, size: 16),
              label: const Text("WhatsApp", style: TextStyle(color: Colors.white)),
            ),
          ] else ...[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                Navigator.pop(ctx);
                _handleContactRequest(context, doc, poultryService, user, isEng);
              },
              child: const Text("নম্বরের অনুরোধ পাঠান",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ],
      ),
    );
  }

  void _makePhoneCall(String phone) async {
    final Uri url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _openWhatsApp(String number) async {
    final cleanNum = number.replaceAll(RegExp(r'[^0-9+]'), '');
    final Uri url = Uri.parse("https://wa.me/$cleanNum");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildDoctorAvatarWidget(String imgPath, {double radius = 32}) {
    final double size = radius * 2;
    Widget fallbackIcon = CircleAvatar(
      radius: radius,
      backgroundColor: Colors.teal.shade100,
      child: Icon(Icons.person_rounded, size: radius * 1.1, color: Colors.teal),
    );

    if (imgPath.isEmpty) {
      return fallbackIcon;
    }

    if (imgPath.startsWith('http')) {
      return ClipOval(
        child: Image.network(
          imgPath,
          height: size,
          width: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => fallbackIcon,
        ),
      );
    }

    if (imgPath.startsWith('data:image')) {
      try {
        final base64Str = imgPath.split(',').last;
        final bytes = base64Decode(base64Str);
        return ClipOval(
          child: Image.memory(
            bytes,
            height: size,
            width: size,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => fallbackIcon,
          ),
        );
      } catch (_) {}
    }

    try {
      final file = File(imgPath);
      if (file.existsSync()) {
        return ClipOval(
          child: Image.file(
            file,
            height: size,
            width: size,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => fallbackIcon,
          ),
        );
      }
    } catch (_) {}

    return fallbackIcon;
  }

  void _showFullScreenImageDialog(BuildContext context, String title, String imgPath) {
    if (imgPath.isEmpty) return;
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.black,
              title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: _buildDoctorImageWidget(
                imgPath,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorImageWidget(String imgPath, {double? height, double? width, BoxFit fit = BoxFit.cover}) {
    if (imgPath.isEmpty) {
      return Container(
        height: height,
        width: width,
        color: Colors.teal.shade50,
        child: const Icon(Icons.person, size: 50, color: Colors.teal),
      );
    }
    if (imgPath.startsWith('http')) {
      return Image.network(
        imgPath,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, __, ___) => Container(
          height: height,
          width: width,
          color: Colors.teal.shade50,
          child: const Icon(Icons.broken_image, size: 40, color: Colors.teal),
        ),
      );
    }
    if (imgPath.startsWith('data:image')) {
      try {
        final base64Str = imgPath.split(',').last;
        final bytes = base64Decode(base64Str);
        return Image.memory(
          bytes,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (_, __, ___) => Container(
            height: height,
            width: width,
            color: Colors.teal.shade50,
            child: const Icon(Icons.broken_image, size: 40, color: Colors.teal),
          ),
        );
      } catch (_) {}
    }
    try {
      final file = File(imgPath);
      if (file.existsSync()) {
        return Image.file(
          file,
          height: height,
          width: width,
          fit: fit,
        );
      }
    } catch (_) {}

    return Container(
      height: height,
      width: width,
      color: Colors.teal.shade50,
      child: const Icon(Icons.person, size: 50, color: Colors.teal),
    );
  }
}
