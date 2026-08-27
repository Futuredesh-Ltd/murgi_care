import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/poultry_service.dart';
import '../../model/doctor_model.dart';
import '../../controller/riverpod_providers.dart';

class DoctorsTab extends ConsumerWidget {
  final bool isEnglish;

  const DoctorsTab({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEng = isEnglish;
    final searchQuery = ref.watch(doctorsTabProvider);
    final poultryService = PoultryService();

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
                  ? "Search doctor by name or district..."
                  : "ডাক্তারের নাম বা জেলা দিয়ে খুঁজুন...",
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
          const SizedBox(height: 12),

          StreamBuilder<List<Doctor>>(
            stream: poultryService.getDoctorsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
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
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.teal.shade100,
                                backgroundImage: doc.profileImage.isNotEmpty
                                    ? NetworkImage(doc.profileImage)
                                    : null,
                                child: doc.profileImage.isEmpty
                                    ? const Icon(Icons.person_rounded,
                                        size: 36, color: Colors.teal)
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doc.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      doc.qualification,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[800]),
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
                          _infoRow(
                              Icons.work_history_rounded,
                              isEng ? "Experience" : "অভিজ্ঞতা",
                              doc.experience),
                          _infoRow(
                              Icons.location_on_rounded,
                              isEng ? "Chamber Address" : "চেম্বার ঠিকানা",
                              "${doc.address}, ${doc.district}"),
                          if (doc.availableTime.isNotEmpty)
                            _infoRow(
                                Icons.access_time_rounded,
                                isEng ? "Available Time" : "সাক্ষাতের সময়",
                                doc.availableTime),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton.icon(
                                onPressed: () => _showDoctorDetailDialog(
                                    context, doc, isEng),
                                icon: const Icon(Icons.info_outline, size: 16),
                                label:
                                    Text(isEng ? "View Details" : "বিস্তারিত"),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () => _makePhoneCall(doc.phone),
                                icon: const Icon(Icons.call, size: 16),
                                label: Text(isEng ? "Call Doctor" : "কল করুন"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
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
                style: const TextStyle(fontSize: 12, color: Colors.black87),
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

  void _showDoctorDetailDialog(BuildContext context, Doctor doc, bool isEng) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(doc.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("যোগ্যতা: ${doc.qualification}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text("বিশেষজ্ঞতা: ${doc.specialization}"),
            const SizedBox(height: 6),
            Text(
                "জেলা: ${doc.district} ${doc.upazila.isNotEmpty ? '(${doc.upazila})' : ''}"),
            const SizedBox(height: 6),
            Text("ফোন: ${doc.phone}"),
            if (doc.email.isNotEmpty) Text("ইমেইল: ${doc.email}"),
            const SizedBox(height: 6),
            Text("সময়সূচী: ${doc.availableTime}"),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("বন্ধ করুন")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              Navigator.pop(ctx);
              _makePhoneCall(doc.phone);
            },
            child: const Text("কল করুন"),
          ),
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
}
