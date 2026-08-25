import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/poultry_service.dart';
import '../../model/banner_model.dart';
import '../../model/announcement_model.dart';
import '../../model/doctor_model.dart';
import '../../model/supplier_model.dart';
import '../../model/market_price_model.dart';
import '../../model/daily_card_model.dart';

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
          length: 6,
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
class AdminDailyCardTab extends StatefulWidget {
  const AdminDailyCardTab({super.key});

  @override
  State<AdminDailyCardTab> createState() => _AdminDailyCardTabState();
}

class _AdminDailyCardTabState extends State<AdminDailyCardTab> {
  final _service = PoultryService();
  final _countryCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();
  final _timeCtrl = TextEditingController();
  final _tipCtrl = TextEditingController();
  final _weatherCtrl = TextEditingController();

  bool _isLoaded = false;
  bool _isSaving = false;

  void _loadData(DailyCardInfo info) {
    if (!_isLoaded) {
      _countryCtrl.text = info.country;
      _dateCtrl.text = info.dateText;
      _timeCtrl.text = info.timeText;
      _tipCtrl.text = info.dailyTip;
      _weatherCtrl.text = info.weather;
      _isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _dateCtrl,
                  decoration: const InputDecoration(labelText: "তারিখ টেক্সট (যেমন: ২৫ আগস্ট ২০২৬)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.calendar_month)),
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _timeCtrl,
                  decoration: const InputDecoration(labelText: "সময় টেক্সট (যেমন: দুপুর ২:৩০)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.timer)),
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _tipCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: "আজকের খামার টিপস / পরামর্শ (Daily Advice)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.tips_and_updates)),
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _weatherCtrl,
                  decoration: const InputDecoration(labelText: "আবহাওয়া বিবরণ (Weather)", border: OutlineInputBorder(), prefixIcon: Icon(Icons.cloud)),
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                    icon: _isSaving ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Icon(Icons.save, color: Colors.white),
                    label: Text(_isSaving ? "সংরক্ষণ করা হচ্ছে..." : "ফায়ারস্টোরে সেভ করুন", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: _isSaving
                        ? null
                        : () async {
                            setState(() => _isSaving = true);
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
                            setState(() => _isSaving = false);
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
class AdminDoctorsTab extends StatelessWidget {
  const AdminDoctorsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final service = PoultryService();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        onPressed: () => _showAddDoctorDialog(context, service),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("নতুন ডাক্তার যোগ করুন", style: TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder<List<Doctor>>(
        stream: service.getDoctorsStream(),
        builder: (context, snapshot) {
          final docs = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final d = docs[index];
              return Card(
                child: ListTile(
                  title: Text(d.name),
                  subtitle: Text("${d.qualification} - ${d.district}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => service.deleteDoctor(d.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddDoctorDialog(BuildContext context, PoultryService service) {
    final nameCtrl = TextEditingController();
    final qualCtrl = TextEditingController();
    final specCtrl = TextEditingController();
    final expCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final distCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("ডাক্তার যোগ করুন"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "ডাক্তারের নাম")),
              TextField(controller: qualCtrl, decoration: const InputDecoration(labelText: "যোগ্যতা (DVM, MS...)")),
              TextField(controller: specCtrl, decoration: const InputDecoration(labelText: "বিশেষজ্ঞতা")),
              TextField(controller: expCtrl, decoration: const InputDecoration(labelText: "অভিজ্ঞতা")),
              TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: "ফোন নম্বর")),
              TextField(controller: distCtrl, decoration: const InputDecoration(labelText: "জেলা")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.isNotEmpty) {
                await service.addDoctor(
                  Doctor(
                    id: '',
                    name: nameCtrl.text,
                    qualification: qualCtrl.text,
                    specialization: specCtrl.text,
                    experience: expCtrl.text,
                    phone: phoneCtrl.text,
                    address: distCtrl.text,
                    district: distCtrl.text,
                  ),
                );
                if (context.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text("সংরক্ষণ করুন"),
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
        onPressed: () => _showAddSupplierDialog(context, service),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("নতুন সাপ্লায়ার যোগ করুন", style: TextStyle(color: Colors.white)),
      ),
      body: StreamBuilder<List<Supplier>>(
        stream: service.getSuppliersStream(),
        builder: (context, snapshot) {
          final sups = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sups.length,
            itemBuilder: (context, index) {
              final s = sups[index];
              return Card(
                child: ListTile(
                  title: Text(s.name),
                  subtitle: Text("${s.category} - ${s.district}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => service.deleteSupplier(s.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddSupplierDialog(BuildContext context, PoultryService service) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final addrCtrl = TextEditingController();
    final distCtrl = TextEditingController();
    final detCtrl = TextEditingController();
    String category = 'feed_chick';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("সাপ্লায়ার যোগ করুন"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "প্রতিষ্ঠানের নাম")),
              DropdownButtonFormField<String>(
                value: category,
                items: const [
                  DropdownMenuItem(value: 'feed_chick', child: Text("ফিড ও বাচ্চা")),
                  DropdownMenuItem(value: 'layer', child: Text("লেয়ার")),
                  DropdownMenuItem(value: 'equipment', child: Text("খামার যন্ত্রপাতি")),
                  DropdownMenuItem(value: 'vaccine', child: Text("ভ্যাকসিন")),
                  DropdownMenuItem(value: 'medicine', child: Text("মেডিসিন")),
                  DropdownMenuItem(value: 'raw_material', child: Text("ফিডের কাঁচামাল")),
                ],
                onChanged: (val) => category = val!,
              ),
              TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: "ফোন নম্বর")),
              TextField(controller: addrCtrl, decoration: const InputDecoration(labelText: "ঠিকানা")),
              TextField(controller: distCtrl, decoration: const InputDecoration(labelText: "জেলা")),
              TextField(controller: detCtrl, decoration: const InputDecoration(labelText: "বিবরণ")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("বাতিল")),
          ElevatedButton(
            onPressed: () async {
              if (nameCtrl.text.isNotEmpty) {
                await service.addSupplier(
                  Supplier(
                    id: '',
                    name: nameCtrl.text,
                    category: category,
                    phone: phoneCtrl.text,
                    address: addrCtrl.text,
                    district: distCtrl.text,
                    details: detCtrl.text,
                  ),
                );
                if (context.mounted) Navigator.pop(ctx);
              }
            },
            child: const Text("সংরক্ষণ করুন"),
          ),
        ],
      ),
    );
  }
}
