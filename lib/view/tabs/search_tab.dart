import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/poultry_service.dart';
import '../../model/supplier_model.dart';
import '../../controller/riverpod_providers.dart';

class SearchTab extends ConsumerWidget {
  final bool isEnglish;

  const SearchTab({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchTabProvider);
    final selectedCategory = searchState.selectedCategory;
    final searchQuery = searchState.searchQuery;
    final poultryService = PoultryService();

    final List<Map<String, dynamic>> categories = [
      {
        "key": "feed_chick",
        "title": "ফিড ও বাচ্চা",
        "titleEn": "Feed & Chicks",
        "icon": Icons.egg_rounded,
        "color": Colors.orange,
      },
      {
        "key": "layer",
        "title": "লেয়ার",
        "titleEn": "Layer",
        "icon": Icons.pets_rounded,
        "color": Colors.amber,
      },
      {
        "key": "equipment",
        "title": "খামার যন্ত্রপাতি",
        "titleEn": "Farm Equipment",
        "icon": Icons.precision_manufacturing_rounded,
        "color": Colors.blue,
      },
      {
        "key": "vaccine",
        "title": "ভ্যাকসিন",
        "titleEn": "Vaccines",
        "icon": Icons.vaccines_rounded,
        "color": Colors.redAccent,
      },
      {
        "key": "medicine",
        "title": "মেডিসিন খুঁজুন",
        "titleEn": "Medicine",
        "icon": Icons.medical_services_rounded,
        "color": Colors.purple,
      },
      {
        "key": "raw_material",
        "title": "ফিডের কাঁচামাল",
        "titleEn": "Feed Raw Material",
        "icon": Icons.grass_rounded,
        "color": Colors.green,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          TextField(
            onChanged: (val) =>
                ref.read(searchTabProvider.notifier).setSearchQuery(val),
            decoration: InputDecoration(
              hintText: isEnglish
                  ? "Search suppliers, feed, equipment..."
                  : "সাপ্লায়ার বা প্রতিষ্ঠানের নাম দিয়ে খুঁজুন...",
              prefixIcon: const Icon(Icons.search, color: Colors.teal),
              suffixIcon: selectedCategory != null
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () =>
                          ref.read(searchTabProvider.notifier).clearCategory(),
                    )
                  : null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              filled: true,
              fillColor: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 16),

          // Categories Grid
          Text(
            isEnglish ? "Categories" : "ক্যাটাগরি সমূহ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = selectedCategory == cat["key"];
              final Color color = cat["color"] as Color;

              return InkWell(
                onTap: () {
                  ref
                      .read(searchTabProvider.notifier)
                      .selectCategory(cat["key"] as String);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? color : Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: color.withOpacity(0.4)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        cat["icon"] as IconData,
                        color: isSelected ? Colors.white : color,
                        size: 26,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        isEnglish
                            ? (cat["titleEn"] as String)
                            : (cat["title"] as String),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? Colors.white
                              : Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Supplier List Stream
          Text(
            isEnglish ? "Suppliers Directory" : "সাপ্লায়ার ও ডিলার তালিকা",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),

          StreamBuilder<List<Supplier>>(
            stream:
                poultryService.getSuppliersStream(category: selectedCategory),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              var suppliers = snapshot.data ?? [];
              if (searchQuery.isNotEmpty) {
                suppliers = suppliers.where((s) {
                  return s.name
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ||
                      s.district
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase()) ||
                      s.address
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase());
                }).toList();
              }

              if (suppliers.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  child: Text(
                    isEnglish
                        ? "No suppliers found in this category."
                        : "কোনো সাপ্লায়ার তথ্য পাওয়া যায়নি।",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: suppliers.length,
                itemBuilder: (context, index) {
                  final sup = suppliers[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _buildSupplierAvatarWidget(sup.name, sup.image, radius: 28),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sup.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "${sup.address}, ${sup.district}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context).brightness == Brightness.dark
                                              ? Colors.grey[300]
                                              : Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (sup.details.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(
                              sup.details,
                              style: const TextStyle(fontSize: 13, height: 1.3),
                            ),
                          ],
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (sup.whatsapp.isNotEmpty) ...[
                                ElevatedButton.icon(
                                  onPressed: () => _launchWhatsApp(sup.whatsapp),
                                  icon: const Icon(Icons.chat, size: 16),
                                  label: const Text("WhatsApp"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                              ElevatedButton.icon(
                                onPressed: () => _makePhoneCall(sup.phone),
                                icon: const Icon(Icons.call, size: 16),
                                label: Text(isEnglish ? "Call Now" : "কল করুন"),
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

  void _makePhoneCall(String phone) async {
    final Uri url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _launchWhatsApp(String phone) async {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d+]'), '');
    final Uri url = Uri.parse("https://wa.me/$cleanPhone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildSupplierAvatarWidget(String name, String imgPath, {double radius = 28}) {
    final double size = radius * 2;
    String firstLetter = 'S';
    final trimmed = name.trim();
    if (trimmed.isNotEmpty) {
      firstLetter = trimmed.substring(0, 1).toUpperCase();
    }

    final colors = [
      Colors.teal,
      Colors.indigo,
      Colors.deepOrange,
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.amber.shade900,
      Colors.pink.shade700,
    ];
    final avatarColor = colors[name.hashCode.abs() % colors.length];

    Widget nameLetterAvatar = CircleAvatar(
      radius: radius,
      backgroundColor: avatarColor.withOpacity(0.15),
      child: Text(
        firstLetter,
        style: TextStyle(
          fontSize: radius * 0.9,
          fontWeight: FontWeight.bold,
          color: avatarColor,
        ),
      ),
    );

    if (imgPath.isNotEmpty) {
      if (imgPath.startsWith('http')) {
        return ClipOval(
          child: Image.network(
            imgPath,
            height: size,
            width: size,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => nameLetterAvatar,
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
              errorBuilder: (_, __, ___) => nameLetterAvatar,
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
              errorBuilder: (_, __, ___) => nameLetterAvatar,
            ),
          );
        }
      } catch (_) {}
    }

    return nameLetterAvatar;
  }
}
