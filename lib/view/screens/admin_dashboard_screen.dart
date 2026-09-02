import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/poultry_service.dart';
import '../../model/banner_model.dart';
import '../../model/announcement_model.dart';
import '../../model/doctor_model.dart';
import '../../model/doctor_request_model.dart';
import '../../model/supplier_model.dart';
import '../../model/market_price_model.dart';
import '../../model/daily_card_model.dart';
import '../../model/article.dart';
import '../../controller/riverpod_providers.dart';

class AdminDashboardScreen extends StatelessWidget {
  final bool isEnglish;

  const AdminDashboardScreen({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    final PoultryService poultryService = PoultryService();
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return _buildAccessDenied(context, isEnglish, "দয়া করে এডমিন অ্যাকাউন্ট দিয়ে লগইন করুন।");
    }

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
      builder: (context, snapshot) {
        final data = snapshot.data?.data() as Map<String, dynamic>?;
        final userType = data?['userType'] ?? '';
        final bool isAdmin = user.email?.toLowerCase().trim() == 'admin@gmail.com' ||
            userType.toString().toLowerCase() == 'admin';

        if (!isAdmin) {
          return _buildAccessDenied(context, isEnglish, "শুধুমাত্র অনুমোদিত এডমিন ইউজার এই পেজটি ব্যবহার করতে পারবেন।");
        }

        return DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: AppBar(
              title: Text(isEnglish ? "Admin Control Panel" : "এডমিন কন্ট্রোল প্যানেল"),
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: const Icon(Icons.cloud_upload_rounded),
                  tooltip: isEnglish ? "Initialize Firestore Data" : "ফায়ারস্টোর ডাটা তৈরি করুন",
                  onPressed: () async {
                    await poultryService.seedFirestore();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("ফায়ারস্টোর কালেকশন ও ডেমো ডাটা সফলভাবে যোগ করা হয়েছে!"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: [
                  Tab(text: isEnglish ? "Articles / Posts" : "নিবন্ধ ও আর্টিকেলে প্রকাশ"),
                  Tab(text: isEnglish ? "Wholesale Market" : "আজকের পাইকারি বাজার"),
                  Tab(text: isEnglish ? "Photo Banners" : "ছবি স্লাইডার (ব্যানার)"),
                  Tab(text: isEnglish ? "Daily Card Details" : "দৈনিক কার্ড বিবরণ"),
                  Tab(text: isEnglish ? "Announcements" : "জরুরী ঘোষণা"),
                  Tab(text: isEnglish ? "Doctors" : "পশুচিকিৎসক"),
                  Tab(text: isEnglish ? "Suppliers" : "সাপ্লায়ার ও ডিলার"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                AdminArticlesTab(),
                AdminMarketPricesTab(),
                AdminBannersTab(),
                AdminDailyCardTab(),
                AdminAnnouncementsTab(),
                AdminDoctorsTab(),
                AdminSuppliersTab(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAccessDenied(BuildContext context, bool isEnglish, String message) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? "Access Denied" : "এক্সেস প্রত্যাখ্যাত"),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.gpp_bad_rounded, size: 80, color: Colors.redAccent),
              const SizedBox(height: 16),
              Text(
                isEnglish ? "Unauthorized Access" : "অনুমতিপ্রাপ্ত নন",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: Text(isEnglish ? "Go Back" : "ফিরে যান", style: const TextStyle(color: Colors.white)),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 1. ADMIN MARKET PRICES (AJKE PAIKARI BAZAR) ---
class AdminMarketPricesTab extends StatelessWidget {
  const AdminMarketPricesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final service = PoultryService();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("নতুন বাজার ক্যাটাগরি যোগ করুন", style: TextStyle(color: Colors.white)),
        onPressed: () => _showAddCategoryDialog(context, service),
      ),
      body: StreamBuilder<List<MarketCategoryPrice>>(
        stream: service.getMarketPricesStream(),
        builder: (context, snapshot) {
          final cats = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cats.length,
            itemBuilder: (context, index) {
              final c = cats[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            c.titleBn,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                            icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                            label: const Text("দাম আপডেট", style: TextStyle(color: Colors.white)),
                            onPressed: () => _showEditPriceDialog(context, service, c),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text("লাইভ অ্যানিমেশন টেক্সট: ${c.marqueeText}", style: const TextStyle(fontSize: 13, color: Colors.black87)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  static void _showEditPriceDialog(BuildContext context, PoultryService service, MarketCategoryPrice cat) {
    List<PriceEntry> items = List.from(cat.items);
    if (items.isEmpty) {
      items.add(PriceEntry(name: "নতুন আইটেম", price: "১০০", unit: "কেজি"));
    }

    final nameCtrls = items.map((i) => TextEditingController(text: i.name)).toList();
    final priceCtrls = items.map((i) => TextEditingController(text: i.price)).toList();
    final unitCtrls = items.map((i) => TextEditingController(text: i.unit)).toList();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text("${cat.titleBn} এর দাম আপডেট"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(nameCtrls.length, (idx) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: nameCtrls[idx],
                              decoration: const InputDecoration(labelText: "আইটেমের নাম", border: OutlineInputBorder()),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: priceCtrls[idx],
                              decoration: const InputDecoration(labelText: "দাম (৳)", border: OutlineInputBorder()),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: unitCtrls[idx],
                              decoration: const InputDecoration(labelText: "একক", border: OutlineInputBorder()),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.redAccent),
                            onPressed: () {
                              setDialogState(() {
                                nameCtrls.removeAt(idx);
                                priceCtrls.removeAt(idx);
                                unitCtrls.removeAt(idx);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.add, color: Colors.teal),
                    label: const Text("নতুন আইটেম যোগ করুন", style: TextStyle(color: Colors.teal)),
                    onPressed: () {
                      setDialogState(() {
                        nameCtrls.add(TextEditingController(text: "নতুন আইটেম"));
                        priceCtrls.add(TextEditingController(text: "১০০"));
                        unitCtrls.add(TextEditingController(text: "কেজি"));
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  List<PriceEntry> updatedItems = [];
                  for (int i = 0; i < nameCtrls.length; i++) {
                    if (nameCtrls[i].text.isNotEmpty) {
                      updatedItems.add(
                        PriceEntry(
                          name: nameCtrls[i].text,
                          price: priceCtrls[i].text,
                          unit: unitCtrls[i].text,
                        ),
                      );
                    }
                  }
                  final ok = await service.updateMarketPriceCategory(
                    cat.id,
                    MarketCategoryPrice(
                      id: cat.id,
                      titleBn: cat.titleBn,
                      titleEn: cat.titleEn,
                      items: updatedItems,
                    ).toMap(),
                  );
                  if (context.mounted) {
                    if (ok) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("দাম সফলভাবে আপডেট করা হয়েছে!"), backgroundColor: Colors.green));
                    }
                    Navigator.pop(ctx);
                  }
                },
                child: const Text("সংরক্ষণ করুন", style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }

  static void _showAddCategoryDialog(BuildContext context, PoultryService service) {
    final keyCtrl = TextEditingController();
    final titleBnCtrl = TextEditingController();
    final titleEnCtrl = TextEditingController();

    final List<Map<String, String>> presetCategories = [
      {'id': 'feed_price', 'bn': 'ফিডের দাম', 'en': 'Feed Prices'},
      {'id': 'chick', 'bn': 'মুরগির বাচ্চার দাম', 'en': 'Chick Prices'},
      {'id': 'egg', 'bn': 'ডিমের দাম', 'en': 'Egg Prices'},
      {'id': 'chicken', 'bn': 'মুরগির দাম (লাইভস্টক)', 'en': 'Chicken Prices'},
      {'id': 'raw_material', 'bn': 'কাঁচামালের দাম', 'en': 'Raw Material Prices'},
      {'id': 'medicine_price', 'bn': 'মেডিসিন ও ভ্যাকসিনের দাম', 'en': 'Medicine Prices'},
      {'id': 'equipment_price', 'bn': 'ফার্ম সরঞ্জামের দাম', 'en': 'Equipment Prices'},
      {'id': 'custom', 'bn': 'কাস্টম ক্যাটাগরি', 'en': 'Custom Category'},
    ];

    String selectedPreset = 'feed_price';
    keyCtrl.text = 'feed_price';
    titleBnCtrl.text = 'ফিডের দাম';
    titleEnCtrl.text = 'Feed Prices';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("নতুন বাজার ক্যাটাগরি যোগ করুন"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("ক্যাটাগরি নির্বাচন করুন (Category Selection):", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedPreset,
                        items: presetCategories.map((cat) {
                          return DropdownMenuItem<String>(
                            value: cat['id'],
                            child: Text("${cat['bn']} (${cat['en']})"),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setDialogState(() {
                              selectedPreset = val;
                              if (val != 'custom') {
                                final match = presetCategories.firstWhere((element) => element['id'] == val);
                                keyCtrl.text = match['id']!;
                                titleBnCtrl.text = match['bn']!;
                                titleEnCtrl.text = match['en']!;
                              } else {
                                keyCtrl.clear();
                                titleBnCtrl.clear();
                                titleEnCtrl.clear();
                              }
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: keyCtrl,
                    decoration: const InputDecoration(labelText: "ক্যাটাগরি আইডি (key)", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: titleBnCtrl,
                    decoration: const InputDecoration(labelText: "বাংলা শিরোনাম (Bangla Title)", border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: titleEnCtrl,
                    decoration: const InputDecoration(labelText: "ইংরেজি শিরোনাম (English Title)", border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  if (keyCtrl.text.isNotEmpty && titleBnCtrl.text.isNotEmpty) {
                    final ok = await service.updateMarketPriceCategory(
                      keyCtrl.text.trim(),
                      MarketCategoryPrice(
                        id: keyCtrl.text.trim(),
                        titleBn: titleBnCtrl.text.trim(),
                        titleEn: titleEnCtrl.text.trim().isEmpty ? titleBnCtrl.text.trim() : titleEnCtrl.text.trim(),
                        items: [PriceEntry(name: "স্যাম্পল আইটেম", price: "১০০", unit: "কেজি")],
                      ).toMap(),
                    );
                    if (context.mounted) {
                      if (ok) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("ক্যাটাগরি সফলভাবে যোগ করা হয়েছে!"), backgroundColor: Colors.green));
                        Navigator.pop(ctx);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("ফায়ারস্টোর সেভে সমস্যা হয়েছে!"), backgroundColor: Colors.redAccent));
                      }
                    }
                  }
                },
                child: const Text("যোগ করুন", style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}

// --- 2. ADMIN BANNERS (PHOTO SLIDER WITH NO LIMIT) ---
class AdminBannersTab extends StatelessWidget {
  const AdminBannersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final service = PoultryService();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () => _showBannerDialog(context, service),
        icon: const Icon(Icons.add_a_photo, color: Colors.white),
        label: const Text("নতুন ব্যানার ছবি আপলোড করুন", style: TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder<List<BannerItem>>(
        stream: service.getAllBannersForAdminStream(),
        builder: (context, snapshot) {
          final banners = snapshot.data ?? [];
          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                color: Colors.teal.shade50,
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.teal, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "বর্তমানে ${banners.length} টি স্লাইডার ছবি ফায়ারস্টোর কালেকশনে সংরক্ষিত আছে। এডমিন যেকোনো নতুন ছবি যোগ, আপডেট বা ডিলিট করতে পারবেন (কোনো লিমিট নেই)।",
                        style: const TextStyle(fontSize: 12, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    final b = banners[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: b.imageUrl.isNotEmpty
                              ? Image.network(b.imageUrl, width: 65, height: 65, fit: BoxFit.cover)
                              : Container(
                                  width: 65,
                                  height: 65,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.image, color: Colors.grey),
                                ),
                        ),
                        title: Text(
                          b.title.isNotEmpty ? b.title : "ব্যানার স্লাইড #${b.priority}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (b.description.isNotEmpty) Text(b.description, maxLines: 1, overflow: TextOverflow.ellipsis),
                            const SizedBox(height: 4),
                            Text("Priority: ${b.priority} | Active: ${b.isActive ? 'হ্যাঁ' : 'না'}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Switch(
                              value: b.isActive,
                              activeColor: Colors.teal,
                              onChanged: (val) => service.updateBanner(b.id, {'isActive': val}),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
                              tooltip: "ছবি মুছে ফেলুন",
                              onPressed: () => _confirmDeleteBanner(context, service, b.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static void _confirmDeleteBanner(BuildContext context, PoultryService service, String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("ব্যানার মুছে ফেলার নিশ্চিতকরণ"),
        content: const Text("আপনি কি নিশ্চিত যে এই ব্যানার ছবিটি ফায়ারস্টোর থেকে মুছে ফেলতে চান?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () async {
              await service.deleteBanner(id);
              if (context.mounted) Navigator.pop(ctx);
            },
            child: const Text("ডিলিট করুন", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  static void _showBannerDialog(BuildContext context, PoultryService service) {
    final urlCtrl = TextEditingController();
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final priorityCtrl = TextEditingController(text: '1');
    List<File> selectedFiles = [];
    bool isUploading = false;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("নতুন ব্যানার ছবি আপলোড করুন"),
            content: SizedBox(
              width: 320,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (selectedFiles.isNotEmpty) ...[
                      Text("সিলেক্টকৃত ছবি (${selectedFiles.length}টি):", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedFiles.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(selectedFiles[index], width: 90, height: 90, fit: BoxFit.cover),
                                  ),
                                  Positioned(
                                    top: 2,
                                    right: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        setDialogState(() {
                                          selectedFiles.removeAt(index);
                                        });
                                      },
                                      child: const CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.redAccent,
                                        child: Icon(Icons.close, size: 14, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                    ] else if (urlCtrl.text.isNotEmpty) ...[
                      SizedBox(
                        width: 280,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            urlCtrl.text,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => const Icon(Icons.broken_image, size: 50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                      icon: const Icon(Icons.collections_rounded, color: Colors.white),
                      label: const Text("এক বা একাধিক ছবি সিলেক্ট করুন (Multi)", style: TextStyle(color: Colors.white, fontSize: 13)),
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedList = await picker.pickMultiImage(imageQuality: 85);
                        if (pickedList.isNotEmpty) {
                          setDialogState(() {
                            selectedFiles = pickedList.map((x) => File(x.path)).toList();
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    const Text("অথবা সরাসরি ছবির লিংক দিন:", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 4),
                    TextField(
                      controller: urlCtrl,
                      decoration: const InputDecoration(labelText: "ছবির URL (imageUrl)", border: OutlineInputBorder()),
                      onChanged: (val) => setDialogState(() {}),
                    ),
                    const SizedBox(height: 12),
                    TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "শিরোনাম (Title)", border: OutlineInputBorder())),
                    const SizedBox(height: 12),
                    TextField(controller: descCtrl, decoration: const InputDecoration(labelText: "বিবরণ (Description)", border: OutlineInputBorder())),
                    if (selectedFiles.length <= 1) ...[
                      const SizedBox(height: 12),
                      TextField(
                        controller: priorityCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: "Priority Order (১, ২, ৩...)", border: OutlineInputBorder()),
                      ),
                    ],
                    if (isUploading) ...[
                      const SizedBox(height: 16),
                      const CircularProgressIndicator(),
                      const SizedBox(height: 8),
                      Text(selectedFiles.length > 1 ? "${selectedFiles.length}টি ছবি ফায়ারস্টোরে আপলোড করা হচ্ছে..." : "ছবি ফায়ারস্টোরে আপলোড হচ্ছে..."),
                    ],
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: isUploading
                    ? null
                    : () async {
                        if (selectedFiles.isNotEmpty) {
                          setDialogState(() => isUploading = true);
                          final count = await service.addMultipleBanners(
                            selectedFiles,
                            title: titleCtrl.text,
                            description: descCtrl.text,
                          );
                          setDialogState(() => isUploading = false);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("$count টি ছবি সফলভাবে ফায়ারস্টোর কালেকশনে যোগ করা হয়েছে!"), backgroundColor: Colors.green),
                            );
                            Navigator.pop(ctx);
                          }
                        } else if (urlCtrl.text.isNotEmpty) {
                          await service.addBanner(
                            BannerItem(
                              id: '',
                              imageUrl: urlCtrl.text.trim(),
                              title: titleCtrl.text,
                              description: descCtrl.text,
                              priority: int.tryParse(priorityCtrl.text) ?? 1,
                              isActive: true,
                            ),
                          );
                          if (context.mounted) Navigator.pop(ctx);
                        }
                      },
                child: Text(selectedFiles.length > 1 ? "সবকটি সেভ করুন (${selectedFiles.length})" : "সংরক্ষণ করুন", style: const TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}

// --- 3. ADMIN DAILY CARD DETAILS (DAILY CARD UPDATER) ---
class AdminDailyCardTab extends ConsumerStatefulWidget {
  const AdminDailyCardTab({super.key});

  @override
  ConsumerState<AdminDailyCardTab> createState() => _AdminDailyCardTabState();
}

class _AdminDailyCardTabState extends ConsumerState<AdminDailyCardTab> {
  final _service = PoultryService();
  final _countryCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  final _timeCtrl = TextEditingController();
  final _tipCtrl = TextEditingController();
  final _weatherCtrl = TextEditingController();

  void _loadData(DailyCardInfo info) {
    final adminState = ref.read(adminDashboardProvider);
    if (!adminState.isLoaded) {
      _countryCtrl.text = info.country;
      _dateCtrl.text = info.dateText;
      _timeCtrl.text = info.timeText;
      _tipCtrl.text = info.dailyTip;
      _weatherCtrl.text = info.weather;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(adminDashboardProvider.notifier).setIsLoaded(true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final adminState = ref.watch(adminDashboardProvider);
    final isSaving = adminState.isSaving;

    return Scaffold(
      body: StreamBuilder<DailyCardInfo>(
        stream: _service.getDailyCardStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _loadData(snapshot.data!);
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.teal.shade50,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.style_rounded, color: Colors.teal, size: 28),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "হোম স্ক্রীনের 'দৈনিক কার্ড বিবরণ' আপডেট করুন। এখান থেকে এডমিন কান্ট্রি, তারিখ, সময়, দৈনিক খামার পরামর্শ ও আবহাওয়া তথ্য আপডেট করতে পারবেন যা সরাসরি ফায়ারস্টোর `daily_card` কালেকশনে সংরক্ষিত হবে।",
                            style: TextStyle(fontSize: 13, color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("লাইভ প্রিভিউ (হোম স্ক্রীনে যেমন দেখাবে):", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.teal.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.redAccent, size: 20),
                              const SizedBox(width: 6),
                              Text(_countryCtrl.text.isEmpty ? "বাংলাদেশ" : _countryCtrl.text, style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded, color: Colors.teal, size: 18),
                              const SizedBox(width: 6),
                              Text(_dateCtrl.text.isEmpty ? "আজকের তারিখ" : _dateCtrl.text, style: const TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time_rounded, color: Colors.orange, size: 18),
                              const SizedBox(width: 6),
                              Text(_timeCtrl.text.isEmpty ? "সময়" : _timeCtrl.text, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
                            ],
                          ),
                        ],
                      ),
                      if (_tipCtrl.text.isNotEmpty || _weatherCtrl.text.isNotEmpty) ...[
                        const Divider(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.lightbulb_outline_rounded, color: Colors.amber, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _tipCtrl.text.isNotEmpty ? _tipCtrl.text : _weatherCtrl.text,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.teal),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _countryCtrl,
                  decoration: const InputDecoration(labelText: "দেশ / এলাকা (Country)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.flag)),
                  onChanged: (val) => ref.read(adminDashboardProvider.notifier).touch(),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _dateCtrl,
                  decoration: const InputDecoration(labelText: "তারিখ টেক্সট (যেমন: ২৫ আগস্ট ২০২৬)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.calendar_month)),
                  onChanged: (val) => ref.read(adminDashboardProvider.notifier).touch(),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _timeCtrl,
                  decoration: const InputDecoration(labelText: "সময় টেক্সট (যেমন: দুপুর ২:৩০)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.timer)),
                  onChanged: (val) => ref.read(adminDashboardProvider.notifier).touch(),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _tipCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: "আজকের খামার টিপস / পরামর্শ (Daily Advice)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.tips_and_updates)),
                  onChanged: (val) => ref.read(adminDashboardProvider.notifier).touch(),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _weatherCtrl,
                  decoration: const InputDecoration(labelText: "আবহাওয়া বিবরণ (Weather)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.cloud)),
                  onChanged: (val) => ref.read(adminDashboardProvider.notifier).touch(),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                    icon: isSaving ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Icon(Icons.save, color: Colors.white),
                    label: Text(isSaving ? "সংরক্ষণ করা হচ্ছে..." : "ফায়ারস্টোরে সেভ করুন", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: isSaving
                        ? null
                        : () async {
                            ref.read(adminDashboardProvider.notifier).setIsSaving(true);
                            await _service.updateDailyCard(
                              DailyCardInfo(
                                id: 'today',
                                country: _countryCtrl.text.trim(),
                                dateText: _dateCtrl.text.trim(),
                                timeText: _timeCtrl.text.trim(),
                                dailyTip: _tipCtrl.text.trim(),
                                weather: _weatherCtrl.text.trim(),
                              ),
                            );
                            ref.read(adminDashboardProvider.notifier).setIsSaving(false);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("দৈনিক কার্ড তথ্য সফলভাবে ফায়ারস্টোরে আপডেট করা হয়েছে!"), backgroundColor: Colors.green),
                              );
                            }
                          },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- 4. ADMIN ANNOUNCEMENTS ---
class AdminAnnouncementsTab extends StatelessWidget {
  const AdminAnnouncementsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final service = PoultryService();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () => _showAnnouncementDialog(context, service),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("নতুন ঘোষণা যোগ করুন", style: TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder<List<AnnouncementItem>>(
        stream: service.getAnnouncementsStream(),
        builder: (context, snapshot) {
          final items = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final a = items[index];
              return Card(
                child: ListTile(
                  title: Text(a.title),
                  subtitle: Text(a.message),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => service.deleteAnnouncement(a.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  static void _showAnnouncementDialog(BuildContext context, PoultryService service) {
    final titleCtrl = TextEditingController();
    final msgCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("নতুন ঘোষণা"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "শিরোনাম")),
            TextField(controller: msgCtrl, maxLines: 3, decoration: const InputDecoration(labelText: "ঘোষণার মেসেজ")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            onPressed: () async {
              if (msgCtrl.text.isNotEmpty) {
                await service.addAnnouncement(
                  AnnouncementItem(
                    id: '',
                    title: titleCtrl.text.isEmpty ? "ঘোষণা" : titleCtrl.text,
                    message: msgCtrl.text,
                  ),
                );
                if (context.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text("যোগ করুন"),
          ),
        ],
      ),
    );
  }
}

// --- 5. ADMIN DOCTORS ---
class AdminDoctorsTab extends StatefulWidget {
  const AdminDoctorsTab({super.key});

  @override
  State<AdminDoctorsTab> createState() => _AdminDoctorsTabState();
}

class _AdminDoctorsTabState extends State<AdminDoctorsTab> {
  String _selectedStatusFilter = 'all';

  @override
  Widget build(BuildContext context) {
    final service = PoultryService();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.teal.shade700,
            child: const TabBar(
              indicatorColor: Colors.amberAccent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(
                  icon: Icon(Icons.people_alt_rounded, size: 18),
                  text: "ডাক্তার তালিকা",
                ),
                Tab(
                  icon: Icon(Icons.mark_email_unread_rounded, size: 18),
                  text: "নম্বর রিকোয়েস্ট",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Sub-tab 1: Doctors List & Add/Edit
            _buildDoctorsListSubTab(context, service),
            // Sub-tab 2: Contact Access Requests
            _buildRequestsSubTab(context, service),
          ],
        ),
      ),
    );
  }

  // --- SUB TAB 1: DOCTORS LIST ---
  Widget _buildDoctorsListSubTab(BuildContext context, PoultryService service) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () => _showAddOrEditDoctorDialog(context, service),
        icon: const Icon(Icons.add_a_photo_rounded, color: Colors.white),
        label: const Text("নতুন ডাক্তার যোগ করুন",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: StreamBuilder<List<Doctor>>(
        stream: service.getDoctorsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snapshot.data ?? [];
          if (docs.isEmpty) {
            return Center(
              child: Text(
                "কোনো ডাক্তার তথ্য ডাটাবেজে পাওয়া যায়নি।\nনিচের বাটনে ক্লিক করে নতুন ডাক্তার যোগ করুন।",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final d = docs[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDoctorAvatarWidget(d.profileImage, null, radius: 30),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  d.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.teal),
                                ),
                                Text(
                                  d.qualification,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  d.specialization,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_rounded,
                                color: Colors.teal),
                            onPressed: () =>
                                _showAddOrEditDoctorDialog(context, service, existing: d),
                            tooltip: "সম্পাদনা করুন",
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_forever_rounded,
                                color: Colors.redAccent),
                            onPressed: () => _confirmDeleteDoctor(context, service, d),
                            tooltip: "ডিলিট করুন",
                          ),
                        ],
                      ),
                      if (d.description.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "বিবরণ: ${d.description}",
                            style: const TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ),
                      ],
                      const Divider(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 6,
                        children: [
                          _chipInfo(Icons.call, "ফোন: ${d.phone}", Colors.teal),
                          _chipInfo(
                              Icons.chat,
                              "WhatsApp: ${d.whatsapp.isNotEmpty ? d.whatsapp : d.phone}",
                              Colors.green),
                          _chipInfo(Icons.location_on, "জেলা: ${d.district}", Colors.blueGrey),
                          if (d.experience.isNotEmpty)
                            _chipInfo(Icons.workspace_premium, "অভিজ্ঞতা: ${d.experience}", Colors.orange),
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
    );
  }

  Widget _chipInfo(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // --- SUB TAB 2: ACCESS REQUESTS ---
  Widget _buildRequestsSubTab(BuildContext context, PoultryService service) {
    return Column(
      children: [
        // Status filter bar
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Colors.teal.shade50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Text("ফিল্টার: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text("সব"),
                  selected: _selectedStatusFilter == 'all',
                  onSelected: (val) => setState(() => _selectedStatusFilter = 'all'),
                ),
                const SizedBox(width: 6),
                ChoiceChip(
                  label: const Text("পেন্ডিং"),
                  selected: _selectedStatusFilter == 'pending',
                  selectedColor: Colors.amber.shade200,
                  onSelected: (val) => setState(() => _selectedStatusFilter = 'pending'),
                ),
                const SizedBox(width: 6),
                ChoiceChip(
                  label: const Text("অনুমোদিত"),
                  selected: _selectedStatusFilter == 'accepted',
                  selectedColor: Colors.green.shade200,
                  onSelected: (val) => setState(() => _selectedStatusFilter = 'accepted'),
                ),
                const SizedBox(width: 6),
                ChoiceChip(
                  label: const Text("প্রত্যাখ্যাত"),
                  selected: _selectedStatusFilter == 'rejected',
                  selectedColor: Colors.red.shade200,
                  onSelected: (val) => setState(() => _selectedStatusFilter = 'rejected'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<List<DoctorContactRequest>>(
            stream: service.getDoctorContactRequestsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var reqs = snapshot.data ?? [];
              if (_selectedStatusFilter != 'all') {
                reqs = reqs.where((r) => r.status == _selectedStatusFilter).toList();
              }

              if (reqs.isEmpty) {
                return Center(
                  child: Text(
                    "কোনো নম্বর এক্সেস অনুরোধ পাওয়া যায়নি।",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: reqs.length,
                itemBuilder: (context, index) {
                  final req = reqs[index];
                  Color statusColor = Colors.amber;
                  String statusText = "অপেক্ষমাণ (Pending)";
                  if (req.status == 'accepted') {
                    statusColor = Colors.green;
                    statusText = "অনুমোদিত (Accepted)";
                  } else if (req.status == 'rejected') {
                    statusColor = Colors.red;
                    statusText = "প্রত্যাখ্যাত (Rejected)";
                  }

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.person_pin_rounded,
                                        color: Colors.teal),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        req.userName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: statusColor.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: statusColor),
                                ),
                                child: Text(
                                  statusText,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: statusColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text("যেই ডাক্তারের নম্বরের অনুরোধ: ${req.doctorName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, color: Colors.teal)),
                          if (req.userPhone.isNotEmpty)
                            Text("ইউজারের ফোন: ${req.userPhone}"),
                          if (req.userEmail.isNotEmpty)
                            Text("ইউজারের ইমেইল: ${req.userEmail}"),
                          if (req.requestedAt != null)
                            Text(
                              "অনুরোধের তারিখ: ${req.requestedAt.toString().split('.')[0]}",
                              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                            ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete_outline,
                                    color: Colors.grey),
                                onPressed: () => service.deleteDoctorRequest(req.id),
                                tooltip: "রিকোয়েস্ট ডিলিট করুন",
                              ),
                              const Spacer(),
                              if (req.status != 'rejected')
                                OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.redAccent),
                                  icon: const Icon(Icons.close, size: 16),
                                  label: const Text("প্রত্যাখ্যান করুন"),
                                  onPressed: () async {
                                    await service.updateDoctorRequestStatus(
                                        req.id, 'rejected', permission: 'no');
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("অনুরোধ প্রত্যাখ্যাত করা হয়েছে।")),
                                      );
                                    }
                                  },
                                ),
                              const SizedBox(width: 8),
                              if (req.status != 'accepted')
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      foregroundColor: Colors.white),
                                  icon: const Icon(Icons.check, size: 16),
                                  label: const Text("অনুমোদন করুন (Accept)"),
                                  onPressed: () async {
                                    await service.updateDoctorRequestStatus(
                                        req.id, 'accepted', permission: 'yes');
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("অনুরোধ সফলভাবে অনুমোদন করা হয়েছে! permission='yes' সেট করা হয়েছে।"),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                    }
                                  },
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
        ),
      ],
    );
  }

  // --- ADD / EDIT DOCTOR DIALOG ---
  void _showAddOrEditDoctorDialog(BuildContext context, PoultryService service,
      {Doctor? existing}) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final imgCtrl = TextEditingController(text: existing?.profileImage ?? '');
    final descCtrl = TextEditingController(text: existing?.description ?? '');
    final qualCtrl = TextEditingController(text: existing?.qualification ?? '');
    final specCtrl = TextEditingController(text: existing?.specialization ?? '');
    final expCtrl = TextEditingController(text: existing?.experience ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final whatsappCtrl = TextEditingController(text: existing?.whatsapp ?? '');
    final addrCtrl = TextEditingController(text: existing?.address ?? '');
    final distCtrl = TextEditingController(text: existing?.district ?? '');
    final upazilaCtrl = TextEditingController(text: existing?.upazila ?? '');
    final timeCtrl = TextEditingController(text: existing?.availableTime ?? '');

    File? selectedImageFile;
    bool isUploading = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            Future<void> pickImage(ImageSource source) async {
              try {
                final picker = ImagePicker();
                final picked = await picker.pickImage(source: source, imageQuality: 80);
                if (picked != null) {
                  setDialogState(() {
                    selectedImageFile = File(picked.path);
                  });
                }
              } catch (e) {
                debugPrint("Image pick error: $e");
              }
            }

            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: Text(existing == null ? "নতুন ডাক্তার যোগ করুন" : "ডাক্তারের তথ্য আপডেট করুন"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // AVATAR PREVIEW WITH CAMERA BADGE
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          _buildDoctorAvatarWidget(imgCtrl.text.trim(), selectedImageFile, radius: 45),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.teal,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                                  builder: (bCtx) => Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.photo_library_rounded, color: Colors.teal),
                                          title: const Text("গ্যালারি থেকে ছবি বেছে নিন"),
                                          onTap: () {
                                            Navigator.pop(bCtx);
                                            pickImage(ImageSource.gallery);
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt_rounded, color: Colors.teal),
                                          title: const Text("ক্যামেরা দিয়ে ছবি তুলুন"),
                                          onTap: () {
                                            Navigator.pop(bCtx);
                                            pickImage(ImageSource.camera);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                          builder: (bCtx) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.photo_library_rounded, color: Colors.teal),
                                  title: const Text("গ্যালারি থেকে ছবি বেছে নিন"),
                                  onTap: () {
                                    Navigator.pop(bCtx);
                                    pickImage(ImageSource.gallery);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt_rounded, color: Colors.teal),
                                  title: const Text("ক্যামেরা দিয়ে ছবি তুলুন"),
                                  onTap: () {
                                    Navigator.pop(bCtx);
                                    pickImage(ImageSource.camera);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_a_photo_rounded, size: 18),
                      label: Text(selectedImageFile != null ? "ছবি পরিবর্তিত হয়েছে (চেঞ্জ করুন)" : "ছবি আপলোড করুন (Upload Image)"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(
                          labelText: "ডাক্তারের নাম *", prefixIcon: Icon(Icons.person)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: imgCtrl,
                      decoration: const InputDecoration(
                          labelText: "অথবা প্রোফাইল ছবি URL (Image Link)",
                          hintText: "https://...",
                          prefixIcon: Icon(Icons.image)),
                      onChanged: (val) => setDialogState(() {}),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descCtrl,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: "বিস্তারিত বিবরণ (Description)",
                          hintText: "ডাক্তার সম্পর্কে বিস্তারিত বিবরণ...",
                          prefixIcon: Icon(Icons.description)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: qualCtrl,
                      decoration: const InputDecoration(
                          labelText: "যোগ্যতা (DVM, MS, PhD...)",
                          prefixIcon: Icon(Icons.school)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: specCtrl,
                      decoration: const InputDecoration(
                          labelText: "বিশেষজ্ঞতা (যেমন: পোল্ট্রি বিশেষজ্ঞ)",
                          prefixIcon: Icon(Icons.medical_services)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: expCtrl,
                      decoration: const InputDecoration(
                          labelText: "অভিজ্ঞতা (যেমন: ১০ বছর)",
                          prefixIcon: Icon(Icons.work)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: "ফোন নম্বর (Phone Number) *",
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: whatsappCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: "WhatsApp নম্বর",
                          hintText: "খালি রাখলে ফোন নম্বর ব্যবহৃত হবে",
                          prefixIcon: Icon(Icons.chat)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: addrCtrl,
                      decoration: const InputDecoration(
                          labelText: "চেম্বার ঠিকানা",
                          prefixIcon: Icon(Icons.location_city)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: distCtrl,
                            decoration: const InputDecoration(
                                labelText: "জেলা", prefixIcon: Icon(Icons.map)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: upazilaCtrl,
                            decoration: const InputDecoration(
                                labelText: "উপজেলা", prefixIcon: Icon(Icons.pin_drop)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: timeCtrl,
                      decoration: const InputDecoration(
                          labelText: "সাক্ষাতের সময়সূচী (Visiting Hours)",
                          prefixIcon: Icon(Icons.access_time)),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isUploading ? null : () => Navigator.pop(ctx),
                  child: const Text("বাতিল"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  onPressed: isUploading
                      ? null
                      : () async {
                          if (nameCtrl.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("দয়া করে ডাক্তারের নাম লিখুন।")),
                            );
                            return;
                          }

                          setDialogState(() {
                            isUploading = true;
                          });

                          String finalImgUrl = imgCtrl.text.trim();
                          if (selectedImageFile != null) {
                            final uploadedUrl = await service.uploadDoctorImage(selectedImageFile!);
                            if (uploadedUrl != null && uploadedUrl.isNotEmpty) {
                              finalImgUrl = uploadedUrl;
                            }
                          }

                          final docObj = Doctor(
                            id: existing?.id ?? '',
                            name: nameCtrl.text.trim(),
                            qualification: qualCtrl.text.trim(),
                            specialization: specCtrl.text.trim(),
                            experience: expCtrl.text.trim(),
                            phone: phoneCtrl.text.trim(),
                            whatsapp: whatsappCtrl.text.trim().isNotEmpty
                                ? whatsappCtrl.text.trim()
                                : phoneCtrl.text.trim(),
                            address: addrCtrl.text.trim(),
                            district: distCtrl.text.trim(),
                            upazila: upazilaCtrl.text.trim(),
                            profileImage: finalImgUrl,
                            description: descCtrl.text.trim(),
                            availableTime: timeCtrl.text.trim(),
                          );

                          if (existing == null) {
                            await service.addDoctor(docObj);
                          } else {
                            await service.updateDoctor(existing.id, docObj.toMap());
                          }

                          if (context.mounted) {
                            Navigator.pop(ctx);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(existing == null
                                    ? "নতুন ডাক্তার সফলভাবে যোগ করা হয়েছে!"
                                    : "ডাক্তারের তথ্য আপডেট করা হয়েছে!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                  child: isUploading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text("সংরক্ষণ করুন", style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDoctorAvatarWidget(String imgPath, File? localFile, {double radius = 35}) {
    final double size = radius * 2;
    Widget fallbackIcon = CircleAvatar(
      radius: radius,
      backgroundColor: Colors.teal.shade100,
      child: Icon(Icons.person, size: radius * 1.1, color: Colors.teal),
    );

    if (localFile != null) {
      return ClipOval(
        child: Image.file(
          localFile,
          height: size,
          width: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => fallbackIcon,
        ),
      );
    }
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

  void _confirmDeleteDoctor(BuildContext context, PoultryService service, Doctor doctor) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("ডাক্তার ডিলিট করতে চান?"),
        content: Text("${doctor.name} এর প্রোফাইল কি ডাটাবেজ থেকে মুছে ফেলতে চান?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () async {
              await service.deleteDoctor(doctor.id);
              if (context.mounted) Navigator.pop(ctx);
            },
            child: const Text("ডিলিট করুন", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// --- 6. ADMIN SUPPLIERS ---
class AdminSuppliersTab extends StatelessWidget {
  const AdminSuppliersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final service = PoultryService();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () => _showAddOrEditSupplierDialog(context, service),
        icon: const Icon(Icons.add_a_photo_rounded, color: Colors.white),
        label: const Text("নতুন সাপ্লায়ার যোগ করুন",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: StreamBuilder<List<Supplier>>(
        stream: service.getSuppliersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final sups = snapshot.data ?? [];
          if (sups.isEmpty) {
            return Center(
              child: Text(
                "কোনো সাপ্লায়ার তথ্য ডাটাবেজে পাওয়া যায়নি।\nনতুন সাপ্লায়ার যোগ করতে নিচের বাটনে চাপ দিন।",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
            );
          }
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sups.length,
            itemBuilder: (context, index) {
              final s = sups[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildSupplierAvatarWidget(s.name, s.image, null, radius: 28),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.teal),
                                ),
                                Text(
                                  "${s.address}, ${s.district}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: isDark ? Colors.grey[300] : Colors.grey[700]),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit_rounded, color: Colors.teal),
                            onPressed: () =>
                                _showAddOrEditSupplierDialog(context, service, existing: s),
                            tooltip: "সম্পাদনা করুন",
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_forever_rounded,
                                color: Colors.redAccent),
                            onPressed: () => _confirmDeleteSupplier(context, service, s),
                            tooltip: "ডিলিট করুন",
                          ),
                        ],
                      ),
                      if (s.details.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "বিবরণ: ${s.details}",
                            style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.white70 : Colors.black87),
                          ),
                        ),
                      ],
                      const Divider(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.call, size: 14, color: Colors.teal),
                          const SizedBox(width: 4),
                          Text("ফোন: ${s.phone}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal)),
                          if (s.whatsapp.isNotEmpty) ...[
                            const SizedBox(width: 16),
                            const Icon(Icons.chat, size: 14, color: Colors.green),
                            const SizedBox(width: 4),
                            Text("WhatsApp: ${s.whatsapp}",
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ],
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
    );
  }

  void _showAddOrEditSupplierDialog(BuildContext context, PoultryService service,
      {Supplier? existing}) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final imgCtrl = TextEditingController(text: existing?.image ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final whatsappCtrl = TextEditingController(text: existing?.whatsapp ?? '');
    final addrCtrl = TextEditingController(text: existing?.address ?? '');
    final distCtrl = TextEditingController(text: existing?.district ?? '');
    final detCtrl = TextEditingController(text: existing?.details ?? '');
    String category = existing?.category ?? 'feed_chick';

    File? selectedImageFile;
    bool isUploading = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            Future<void> pickImage(ImageSource source) async {
              try {
                final picker = ImagePicker();
                final picked = await picker.pickImage(source: source, imageQuality: 80);
                if (picked != null) {
                  setDialogState(() {
                    selectedImageFile = File(picked.path);
                  });
                }
              } catch (e) {
                debugPrint("Supplier Image pick error: $e");
              }
            }

            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: Text(existing == null ? "নতুন সাপ্লায়ার যোগ করুন" : "সাপ্লায়ারের তথ্য আপডেট করুন"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // AVATAR PREVIEW WITH NAME INITIAL OR IMAGE
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          _buildSupplierAvatarWidget(
                            nameCtrl.text.isEmpty ? "S" : nameCtrl.text,
                            imgCtrl.text.trim(),
                            selectedImageFile,
                            radius: 40,
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.teal,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.camera_alt, size: 15, color: Colors.white),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                                  builder: (bCtx) => Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.photo_library_rounded, color: Colors.teal),
                                          title: const Text("গ্যালারি থেকে ছবি বেছে নিন"),
                                          onTap: () {
                                            Navigator.pop(bCtx);
                                            pickImage(ImageSource.gallery);
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt_rounded, color: Colors.teal),
                                          title: const Text("ক্যামেরা দিয়ে ছবি তুলুন"),
                                          onTap: () {
                                            Navigator.pop(bCtx);
                                            pickImage(ImageSource.camera);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                          builder: (bCtx) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.photo_library_rounded, color: Colors.teal),
                                  title: const Text("গ্যালারি থেকে ছবি বেছে নিন"),
                                  onTap: () {
                                    Navigator.pop(bCtx);
                                    pickImage(ImageSource.gallery);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt_rounded, color: Colors.teal),
                                  title: const Text("ক্যামেরা দিয়ে ছবি তুলুন"),
                                  onTap: () {
                                    Navigator.pop(bCtx);
                                    pickImage(ImageSource.camera);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_a_photo_rounded, size: 18),
                      label: Text(selectedImageFile != null ? "ছবি সিলেক্ট হয়েছে" : "সাপ্লায়ার ছবি আপলোড করুন"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(
                          labelText: "প্রতিষ্ঠানের/সাপ্লায়ারের নাম *", prefixIcon: Icon(Icons.store)),
                      onChanged: (val) => setDialogState(() {}),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: imgCtrl,
                      decoration: const InputDecoration(
                          labelText: "অথবা ছবির URL (Image Link)",
                          hintText: "https://...",
                          prefixIcon: Icon(Icons.image)),
                      onChanged: (val) => setDialogState(() {}),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      initialValue: category,
                      isExpanded: true,
                      decoration: const InputDecoration(
                          labelText: "ক্যাটাগরি", prefixIcon: Icon(Icons.category)),
                      items: const [
                        DropdownMenuItem(
                          value: 'feed_chick',
                          child: Text("ফিড ও বাচ্চা (Feed & Chick)", overflow: TextOverflow.ellipsis),
                        ),
                        DropdownMenuItem(
                          value: 'layer',
                          child: Text("লেয়ার (Layer)", overflow: TextOverflow.ellipsis),
                        ),
                        DropdownMenuItem(
                          value: 'equipment',
                          child: Text("খামার যন্ত্রপাতি (Equipment)", overflow: TextOverflow.ellipsis),
                        ),
                        DropdownMenuItem(
                          value: 'vaccine',
                          child: Text("ভ্যাকসিন (Vaccine)", overflow: TextOverflow.ellipsis),
                        ),
                        DropdownMenuItem(
                          value: 'medicine',
                          child: Text("মেডিসিন (Medicine)", overflow: TextOverflow.ellipsis),
                        ),
                        DropdownMenuItem(
                          value: 'raw_material',
                          child: Text("ফিডের কাঁচামাল (Raw Material)", overflow: TextOverflow.ellipsis),
                        ),
                      ],
                      onChanged: (val) => setDialogState(() => category = val!),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: "ফোন নম্বর *", prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: whatsappCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: "WhatsApp নম্বর",
                          hintText: "খালি রাখলে ফোন নম্বর ব্যবহৃত হবে",
                          prefixIcon: Icon(Icons.chat)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: addrCtrl,
                      decoration: const InputDecoration(
                          labelText: "ঠিকানা", prefixIcon: Icon(Icons.location_city)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: distCtrl,
                      decoration: const InputDecoration(
                          labelText: "জেলা", prefixIcon: Icon(Icons.map)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: detCtrl,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: "বিস্তারিত বিবরণ", prefixIcon: Icon(Icons.description)),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isUploading ? null : () => Navigator.pop(ctx),
                  child: const Text("বাতিল"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  onPressed: isUploading
                      ? null
                      : () async {
                          if (nameCtrl.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("দয়া করে প্রতিষ্ঠানের নাম লিখুন।")),
                            );
                            return;
                          }

                          setDialogState(() {
                            isUploading = true;
                          });

                          String finalImgUrl = imgCtrl.text.trim();
                          if (selectedImageFile != null) {
                            final uploadedUrl = await service.uploadSupplierImage(selectedImageFile!);
                            if (uploadedUrl != null && uploadedUrl.isNotEmpty) {
                              finalImgUrl = uploadedUrl;
                            }
                          }

                          final supObj = Supplier(
                            id: existing?.id ?? '',
                            name: nameCtrl.text.trim(),
                            image: finalImgUrl,
                            category: category,
                            phone: phoneCtrl.text.trim(),
                            whatsapp: whatsappCtrl.text.trim().isNotEmpty
                                ? whatsappCtrl.text.trim()
                                : phoneCtrl.text.trim(),
                            address: addrCtrl.text.trim(),
                            district: distCtrl.text.trim(),
                            details: detCtrl.text.trim(),
                          );

                          if (existing == null) {
                            await service.addSupplier(supObj);
                          } else {
                            await service.updateSupplier(existing.id, supObj.toMap());
                          }

                          if (context.mounted) {
                            Navigator.pop(ctx);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(existing == null
                                    ? "নতুন সাপ্লায়ার সফলভাবে যোগ করা হয়েছে!"
                                    : "সাপ্লায়ারের তথ্য আপডেট করা হয়েছে!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                  child: isUploading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text("সংরক্ষণ করুন", style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSupplierAvatarWidget(
    String name,
    String imgPath,
    File? localFile, {
    double radius = 28,
  }) {
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

    if (localFile != null) {
      return ClipOval(
        child: Image.file(
          localFile,
          height: size,
          width: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => nameLetterAvatar,
        ),
      );
    }

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

  void _confirmDeleteSupplier(BuildContext context, PoultryService service, Supplier supplier) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("সাপ্লায়ার ডিলিট করতে চান?"),
        content: Text("${supplier.name} কে কি ডাটাবেজ থেকে মুছে ফেলতে চান?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () async {
              await service.deleteSupplier(supplier.id);
              if (context.mounted) Navigator.pop(ctx);
            },
            child: const Text("ডিলিট করুন", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// --- 0. ADMIN ARTICLES TAB (POST & MANAGE ARTICLES BY CATEGORY) ---
class AdminArticlesTab extends ConsumerStatefulWidget {
  const AdminArticlesTab({super.key});

  @override
  ConsumerState<AdminArticlesTab> createState() => _AdminArticlesTabState();
}

class _AdminArticlesTabState extends ConsumerState<AdminArticlesTab> {
  String _selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    final service = PoultryService();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.post_add_rounded, color: Colors.white),
        label: const Text("নতুন আর্টিকেলে প্রকাশ করুন", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        onPressed: () => _showAddArticleDialog(context, service),
      ),
      body: Column(
        children: [
          // Category Filter Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.teal.shade50.withOpacity(0.5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Text("ক্যাটাগরি ফিল্টার: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal)),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text("সবকটি নিবন্ধ"),
                    selected: _selectedCategory == 'all',
                    onSelected: (val) => setState(() => _selectedCategory = 'all'),
                  ),
                  const SizedBox(width: 6),
                  ChoiceChip(
                    label: const Text("প্যারেন্টস স্টক (Parents Stock)"),
                    selected: _selectedCategory == 'parents_stock',
                    selectedColor: Colors.indigo,
                    labelStyle: TextStyle(color: _selectedCategory == 'parents_stock' ? Colors.white : Colors.black87),
                    onSelected: (val) => setState(() => _selectedCategory = 'parents_stock'),
                  ),
                  const SizedBox(width: 6),
                  ChoiceChip(
                    label: const Text("হ্যাচারি (Hatchery)"),
                    selected: _selectedCategory == 'hatchery',
                    selectedColor: Colors.orange.shade800,
                    labelStyle: TextStyle(color: _selectedCategory == 'hatchery' ? Colors.white : Colors.black87),
                    onSelected: (val) => setState(() => _selectedCategory = 'hatchery'),
                  ),
                  const SizedBox(width: 6),
                  ChoiceChip(
                    label: const Text("সাধারণ নিবন্ধ (General)"),
                    selected: _selectedCategory == 'general',
                    selectedColor: Colors.teal,
                    labelStyle: TextStyle(color: _selectedCategory == 'general' ? Colors.white : Colors.black87),
                    onSelected: (val) => setState(() => _selectedCategory = 'general'),
                  ),
                ],
              ),
            ),
          ),

          // Articles Stream List
          Expanded(
            child: StreamBuilder<List<Article>>(
              stream: service.getArticlesStream(category: _selectedCategory),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final articles = snapshot.data ?? [];
                if (articles.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.article_outlined, size: 64, color: Colors.grey.shade400),
                          const SizedBox(height: 12),
                          Text(
                            "এই ক্যাটাগরিতে কোনো নিবন্ধ পাওয়া যায়নি।\n'নতুন আর্টিকেলে প্রকাশ করুন' বাটনে চাপুন।",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final art = articles[index];
                    final String catLabel = art.category == 'parents_stock'
                        ? 'প্যারেন্টস স্টক'
                        : (art.category == 'hatchery' ? 'হ্যাচারি' : 'সাধারণ');
                    final Color catColor = art.category == 'parents_stock'
                        ? Colors.indigo
                        : (art.category == 'hatchery' ? Colors.orange.shade800 : Colors.teal);

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: art.imageUrl.isNotEmpty
                              ? Image.network(art.imageUrl, width: 70, height: 70, fit: BoxFit.cover)
                              : Container(
                                  width: 70,
                                  height: 70,
                                  color: catColor.withOpacity(0.2),
                                  child: Icon(Icons.article, color: catColor),
                                ),
                        ),
                        title: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: catColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                catLabel,
                                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                art.titleBn.isNotEmpty ? art.titleBn : art.titleEn,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text("Author: ${art.author} • ${art.readTime}", style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                            const SizedBox(height: 2),
                            Text(
                              art.contentBn.isNotEmpty ? art.contentBn : art.contentEn,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
                          tooltip: "আর্টিকেল ডিলিট করুন",
                          onPressed: () => _confirmDeleteArticle(context, service, art.id),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteArticle(BuildContext context, PoultryService service, String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("নিবন্ধ মুছে ফেলার নিশ্চিতকরণ"),
        content: const Text("আপনি কি নিশ্চিত যে এই নিবন্ধটি ফায়ারস্টোর থেকে মুছে ফেলতে চান?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () async {
              await service.deleteArticle(id);
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text("ডিলিট করুন", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showAddArticleDialog(BuildContext context, PoultryService service) {
    final titleBnCtrl = TextEditingController();
    final titleEnCtrl = TextEditingController();
    final authorCtrl = TextEditingController(text: 'MurgiCare Specialists');
    final readTimeCtrl = TextEditingController(text: '5 min read');
    final imageCtrl = TextEditingController();
    final contentBnCtrl = TextEditingController();
    final contentEnCtrl = TextEditingController();
    String category = 'parents_stock';

    File? selectedImageFile;
    bool isUploading = false;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text("নতুন আর্টিকেলে প্রকাশ করুন"),
            content: SizedBox(
              width: 340,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("ক্যাটাগরি বাছুন (Target Category):", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: category,
                      isExpanded: true,
                      decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10)),
                      items: const [
                        DropdownMenuItem(value: 'parents_stock', child: Text("প্যারেন্টস স্টক (Parents Stock)", overflow: TextOverflow.ellipsis)),
                        DropdownMenuItem(value: 'hatchery', child: Text("হ্যাচারি (Hatchery)", overflow: TextOverflow.ellipsis)),
                        DropdownMenuItem(value: 'general', child: Text("সাধারণ নিবন্ধ (General)", overflow: TextOverflow.ellipsis)),
                      ],
                      onChanged: (val) {
                        if (val != null) setDialogState(() => category = val);
                      },
                    ),
                    const SizedBox(height: 14),

                    // --- IMAGE UPLOAD SECTION ---
                    const Text("আর্টিকেলের ছবি (Article Image):", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.teal)),
                    const SizedBox(height: 6),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.teal.shade200, width: 1.5),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          if (selectedImageFile != null) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                selectedImageFile!,
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ] else if (imageCtrl.text.isNotEmpty) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                imageCtrl.text,
                                height: 130,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  icon: const Icon(Icons.photo_library_rounded, size: 18),
                                  label: Text(selectedImageFile != null ? "ছবি পরিবর্তন করুন" : "ছবি আপলোড / সিলেক্ট করুন"),
                                  onPressed: () async {
                                    final picker = ImagePicker();
                                    final XFile? picked = await picker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 85,
                                    );
                                    if (picked != null) {
                                      setDialogState(() {
                                        selectedImageFile = File(picked.path);
                                      });
                                    }
                                  },
                                ),
                              ),
                              if (selectedImageFile != null) ...[
                                const SizedBox(width: 6),
                                IconButton(
                                  icon: const Icon(Icons.cancel, color: Colors.redAccent),
                                  onPressed: () {
                                    setDialogState(() {
                                      selectedImageFile = null;
                                    });
                                  },
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: imageCtrl,
                      onChanged: (_) => setDialogState(() {}),
                      decoration: const InputDecoration(
                        labelText: "বা ছবির URL দিন (Optional URL)",
                        border: OutlineInputBorder(),
                        hintText: "https://...",
                        isDense: true,
                      ),
                    ),

                    const SizedBox(height: 14),
                    TextField(
                      controller: titleBnCtrl,
                      decoration: const InputDecoration(labelText: "বাংলা শিরোনাম (Bangla Title)", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: titleEnCtrl,
                      decoration: const InputDecoration(labelText: "ইংরেজি শিরোনাম (English Title)", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: authorCtrl,
                            decoration: const InputDecoration(labelText: "লেখক (Author)", border: OutlineInputBorder()),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: readTimeCtrl,
                            decoration: const InputDecoration(labelText: "পড়ার সময় (Read time)", border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: contentBnCtrl,
                      maxLines: 4,
                      decoration: const InputDecoration(labelText: "বাংলা বিবরণ / বিষয়বস্তু (Bangla Content)", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: contentEnCtrl,
                      maxLines: 3,
                      decoration: const InputDecoration(labelText: "ইংরেজি বিবরণ / বিষয়বস্তু (English Content)", border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: isUploading
                    ? null
                    : () async {
                        if (titleBnCtrl.text.isNotEmpty || titleEnCtrl.text.isNotEmpty) {
                          setDialogState(() => isUploading = true);

                          String finalImageUrl = imageCtrl.text.trim();
                          if (selectedImageFile != null) {
                            final uploadedUrl = await service.uploadArticleImage(selectedImageFile!);
                            if (uploadedUrl != null && uploadedUrl.isNotEmpty) {
                              finalImageUrl = uploadedUrl;
                            }
                          }

                          if (finalImageUrl.isEmpty) {
                            finalImageUrl = "https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?auto=format&fit=crop&q=80&w=1000";
                          }

                          final ok = await service.addArticle(
                            Article(
                              id: '',
                              category: category,
                              titleBn: titleBnCtrl.text.trim(),
                              titleEn: titleEnCtrl.text.trim().isEmpty ? titleBnCtrl.text.trim() : titleEnCtrl.text.trim(),
                              author: authorCtrl.text.trim(),
                              readTime: readTimeCtrl.text.trim(),
                              imageUrl: finalImageUrl,
                              contentBn: contentBnCtrl.text.trim(),
                              contentEn: contentEnCtrl.text.trim().isEmpty ? contentBnCtrl.text.trim() : contentEnCtrl.text.trim(),
                            ),
                          );

                          if (ctx.mounted) {
                            setDialogState(() => isUploading = false);
                            if (ok) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("আর্টিকেল এবং ছবি সফলভাবে ফায়ারস্টোরে প্রকাশ করা হয়েছে!"), backgroundColor: Colors.green),
                              );
                              Navigator.pop(ctx);
                            }
                          }
                        }
                      },
                child: isUploading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : const Text("পোস্ট করুন", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      ),
    );
  }
}
