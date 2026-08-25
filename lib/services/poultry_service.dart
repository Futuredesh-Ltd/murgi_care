import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/banner_model.dart';
import '../model/announcement_model.dart';
import '../model/market_price_model.dart';
import '../model/doctor_model.dart';
import '../model/supplier_model.dart';
import '../model/daily_card_model.dart';

class PoultryService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // --- SEED FIRESTORE COLLECTIONS ---
  Future<void> seedFirestore() async {
    try {
      // Seed Banners
      for (var b in _defaultBanners()) {
        await _db.collection('banner').add(b.toMap());
      }
      // Seed Announcements
      for (var a in _defaultAnnouncements()) {
        await _db.collection('announcements').add(a.toMap());
      }
      // Seed Market Prices
      for (var m in _defaultMarketPrices()) {
        await _db.collection('market_prices').doc(m.id).set(m.toMap());
      }
      // Seed Doctors
      for (var d in _defaultDoctors()) {
        await _db.collection('doctors').add(d.toMap());
      }
      // Seed Suppliers
      for (var s in _defaultSuppliers(null)) {
        await _db.collection('suppliers').add(s.toMap());
      }
      // Seed Daily Card
      await updateDailyCard(DailyCardInfo(
        id: 'today',
        country: 'বাংলাদেশ',
        dailyTip: 'আজকের টিপস: খামারের লিটার পরিষ্কার ও শুকনো রাখুন।',
        weather: 'তাপমাত্রা ৩২° সে: | আর্দ্রতা ৬৫%',
      ));
    } catch (e) {
      debugPrint("seedFirestore error: $e");
    }
  }

  // --- IMAGE UPLOAD FOR BANNERS ---
  Future<String?> uploadBannerImage(File imageFile) async {
    try {
      final fileName = 'banner_${DateTime.now().millisecondsSinceEpoch}_${imageFile.hashCode}.jpg';
      final ref = _storage.ref().child('banners').child(fileName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      final uploadTask = ref.putFile(imageFile, metadata);
      final snapshot = await uploadTask.whenComplete(() {});

      if (snapshot.state == TaskState.success) {
        return await snapshot.ref.getDownloadURL();
      }
    } catch (_) {
      // Storage fallback to Base64 data URI
    }

    try {
      final bytes = await imageFile.readAsBytes();
      final base64Str = base64Encode(bytes);
      return 'data:image/jpeg;base64,$base64Str';
    } catch (_) {
      return null;
    }
  }

  Future<int> addMultipleBanners(List<File> files, {String title = '', String description = ''}) async {
    int successCount = 0;
    int priorityIndex = 1;
    for (var file in files) {
      final url = await uploadBannerImage(file);
      if (url != null && url.isNotEmpty) {
        final ok = await addBanner(
          BannerItem(
            id: '',
            imageUrl: url,
            title: title,
            description: description,
            priority: priorityIndex++,
            isActive: true,
          ),
        );
        if (ok) successCount++;
      }
    }
    return successCount;
  }

  // --- DAILY CARD ---
  Stream<DailyCardInfo> getDailyCardStream() {
    return _db.collection('daily_card').doc('today').snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return DailyCardInfo(
          id: 'today',
          country: 'বাংলাদেশ',
          dailyTip: 'আজকের টিপস: শেডের তাপমাত্রা নিয়ন্ত্রণে পর্যাপ্ত আলো-বাতাসের ব্যবস্থা রাখুন।',
          weather: '৩০° সে: - আর্দ্রতা ৬২%',
        );
      }
      return DailyCardInfo.fromFirestore(snapshot);
    }).handleError((error) {
      return DailyCardInfo(
        id: 'today',
        country: 'বাংলাদেশ',
        dailyTip: 'আজকের টিপস: শেডের তাপমাত্রা নিয়ন্ত্রণে পর্যাপ্ত আলো-বাতাসের ব্যবস্থা রাখুন।',
        weather: '৩০° সে: - আর্দ্রতা ৬২%',
      );
    });
  }

  Future<bool> updateDailyCard(DailyCardInfo info) async {
    try {
      await _db.collection('daily_card').doc('today').set(info.toMap(), SetOptions(merge: true));
      return true;
    } catch (e) {
      debugPrint("updateDailyCard error: $e");
      return false;
    }
  }

  // --- BANNERS ---
  Stream<List<BannerItem>> getBannersStream() {
    return _db
        .collection('banner')
        .snapshots()
        .map((snapshot) {
          final list = snapshot.docs
              .map((doc) => BannerItem.fromFirestore(doc))
              .where((b) => b.isActive)
              .toList();
          list.sort((a, b) => a.priority.compareTo(b.priority));
          if (list.isEmpty) return _defaultBanners();
          return list;
        })
        .handleError((error) {
          return _defaultBanners();
        });
  }

  // Admin Stream for Banners (shows both active and inactive so Admin can manage all)
  Stream<List<BannerItem>> getAllBannersForAdminStream() {
    return _db.collection('banner').snapshots().map((snapshot) {
      final list = snapshot.docs.map((doc) => BannerItem.fromFirestore(doc)).toList();
      list.sort((a, b) => a.priority.compareTo(b.priority));
      if (list.isEmpty) return _defaultBanners();
      return list;
    }).handleError((error) {
      return _defaultBanners();
    });
  }

  List<BannerItem> _defaultBanners() {
    return [
      BannerItem(
        id: 'def1',
        imageUrl: 'https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?q=80&w=800&auto=format&fit=crop',
        title: 'আধুনিক পোল্ট্রি খামার ব্যবস্থাপনা',
        description: 'বিজ্ঞানী সম্মত উপায়ে খামার পরিচালনা করুন ও লাভবান হোন',
        priority: 1,
      ),
      BannerItem(
        id: 'def2',
        imageUrl: 'https://images.unsplash.com/photo-1516467508483-a7212febe31a?q=80&w=800&auto=format&fit=crop',
        title: 'রোগ বালাই থেকে খামার রক্ষা করুন',
        description: 'এআই অ্যাপ দিয়ে দ্রুত সঠিক চিকিৎসা নিশ্চিত করুন',
        priority: 2,
      ),
    ];
  }

  Future<bool> addBanner(BannerItem banner) async {
    try {
      await _db.collection('banner').add(banner.toMap());
      return true;
    } catch (e) {
      debugPrint("addBanner error: $e");
      return false;
    }
  }

  Future<bool> updateBanner(String id, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _db.collection('banner').doc(id).update(data);
      return true;
    } catch (e) {
      debugPrint("updateBanner error: $e");
      return false;
    }
  }

  Future<bool> deleteBanner(String id) async {
    try {
      await _db.collection('banner').doc(id).delete();
      return true;
    } catch (e) {
      debugPrint("deleteBanner error: $e");
      return false;
    }
  }

  // --- ANNOUNCEMENTS ---
  Stream<List<AnnouncementItem>> getAnnouncementsStream() {
    return _db
        .collection('announcements')
        .snapshots()
        .map((snapshot) {
          final list = snapshot.docs
              .map((doc) => AnnouncementItem.fromFirestore(doc))
              .where((a) => a.isActive)
              .toList();
          list.sort((a, b) => a.priority.compareTo(b.priority));
          if (list.isEmpty) return _defaultAnnouncements();
          return list;
        })
        .handleError((error) {
          return _defaultAnnouncements();
        });
  }

  List<AnnouncementItem> _defaultAnnouncements() {
    return [
      AnnouncementItem(
        id: 'def_ann1',
        title: 'জরুরী সতর্কতা',
        message: '📢 আজকের গুরুত্বপূর্ণ ঘোষণা: খামারের লিটার পরিষ্কার ও শুকনো রাখুন। আর্দ্রতা বাড়লে রোগের প্রাদুর্ভাব ঘটতে পারে।',
        priority: 1,
      ),
      AnnouncementItem(
        id: 'def_ann2',
        title: 'ভ্যাকসিন রিমাইন্ডার',
        message: '💉 ব্রয়লার বাচ্চার ক্ষেত্রে ৭-১০ দিনের মধ্যে গামবোরো ভ্যাকসিন সম্পন্ন করুন।',
        priority: 2,
      ),
    ];
  }

  Future<bool> addAnnouncement(AnnouncementItem item) async {
    try {
      await _db.collection('announcements').add(item.toMap());
      return true;
    } catch (e) {
      debugPrint("addAnnouncement error: $e");
      return false;
    }
  }

  Future<bool> updateAnnouncement(String id, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _db.collection('announcements').doc(id).update(data);
      return true;
    } catch (e) {
      debugPrint("updateAnnouncement error: $e");
      return false;
    }
  }

  Future<bool> deleteAnnouncement(String id) async {
    try {
      await _db.collection('announcements').doc(id).delete();
      return true;
    } catch (e) {
      debugPrint("deleteAnnouncement error: $e");
      return false;
    }
  }

  // --- MARKET PRICES ---
  Stream<List<MarketCategoryPrice>> getMarketPricesStream() {
    return _db.collection('market_prices').snapshots().map((snapshot) {
      if (snapshot.docs.isEmpty) return _defaultMarketPrices();
      return snapshot.docs.map((doc) => MarketCategoryPrice.fromFirestore(doc)).toList();
    }).handleError((error) {
      return _defaultMarketPrices();
    });
  }

  List<MarketCategoryPrice> _defaultMarketPrices() {
    return [
      MarketCategoryPrice(
        id: 'chick',
        titleBn: 'মুরগির বাচ্চার দাম',
        titleEn: 'Chick Prices',
        items: [
          PriceEntry(name: 'ব্রয়লার বাচ্চা', price: '৬৫', unit: 'পিস'),
          PriceEntry(name: 'সোনালী বাচ্চা', price: '৮৫', unit: 'পিস'),
          PriceEntry(name: 'লেয়ার বাচ্চা', price: '৭৫', unit: 'পিস'),
        ],
      ),
      MarketCategoryPrice(
        id: 'egg',
        titleBn: 'ডিমের দাম',
        titleEn: 'Egg Prices',
        items: [
          PriceEntry(name: 'লাল ডিম', price: '১২.০০', unit: 'পিস'),
          PriceEntry(name: 'সাদা ডিম', price: '১১.৫০', unit: 'পিস'),
          PriceEntry(name: 'হাঁসের ডিম', price: '১৫.০০', unit: 'পিস'),
        ],
      ),
      MarketCategoryPrice(
        id: 'chicken',
        titleBn: 'মুরগির দাম',
        titleEn: 'Chicken Prices',
        items: [
          PriceEntry(name: 'ব্রয়লার', price: '১৮৫', unit: 'কেজি'),
          PriceEntry(name: 'সোনালী', price: '২৮০', unit: 'কেজি'),
          PriceEntry(name: 'দেশি', price: '৫2০', unit: 'কেজি'),
          PriceEntry(name: 'লেয়ার (লাল)', price: '৩১০', unit: 'কেজি'),
        ],
      ),
      MarketCategoryPrice(
        id: 'raw_material',
        titleBn: 'কাঁচামাল',
        titleEn: 'Raw Materials',
        items: [
          PriceEntry(name: 'ভুট্টা', price: '৩৮', unit: 'কেজি'),
          PriceEntry(name: 'সয়াবিন খৈল', price: '৬৮', unit: 'কেজি'),
          PriceEntry(name: 'গম', price: '৪২', unit: 'কেজি'),
          PriceEntry(name: 'রাইস পলিশ', price: '২৯', unit: 'কেজি'),
        ],
      ),
    ];
  }

  Future<bool> updateMarketPriceCategory(String categoryId, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _db.collection('market_prices').doc(categoryId).set(data, SetOptions(merge: true));
      return true;
    } catch (e) {
      debugPrint("updateMarketPriceCategory error: $e");
      return false;
    }
  }

  // --- DOCTORS ---
  Stream<List<Doctor>> getDoctorsStream() {
    return _db.collection('doctors').snapshots().map((snapshot) {
      final list = snapshot.docs
          .map((doc) => Doctor.fromFirestore(doc))
          .where((d) => d.isActive)
          .toList();
      if (list.isEmpty) return _defaultDoctors();
      return list;
    }).handleError((error) {
      return _defaultDoctors();
    });
  }

  List<Doctor> _defaultDoctors() {
    return [
      Doctor(
        id: 'doc1',
        name: 'ড. মো: রফিকুল ইসলাম',
        specialization: 'পোল্ট্রি রোগ বিশেষজ্ঞ ও সার্জন',
        qualification: 'DVM (BAU), MS (Poultry Science)',
        experience: '১২ বছরের অভিজ্ঞতা',
        phone: '+8801711223344',
        email: 'rafiq.vet@gmail.com',
        address: 'পোল্ট্রি হাসপাতাল, ফার্মগেট',
        district: 'ঢাকা',
        upazila: 'তেজগাঁও',
        availableTime: 'সকাল ১০টা - বিকেল ৫টা (শনিবার বন্ধ)',
      ),
      Doctor(
        id: 'doc2',
        name: 'ড. নাসরিন আক্তার',
        specialization: 'পোল্ট্রি নিউট্রিশন ও মেডিসিন কনসালট্যান্ট',
        qualification: 'DVM (CVASU), PhD (Malaysia)',
        experience: '৮ বছরের অভিজ্ঞতা',
        phone: '+8801811998877',
        email: 'nasrin.vet@yahoo.com',
        address: 'কৃষি ভবন, জিইসি মোড়',
        district: 'চট্টগ্রাম',
        upazila: 'কোতোয়ালী',
        availableTime: 'বিকেল ৪টা - রাত ৮টা',
      ),
    ];
  }

  Future<bool> addDoctor(Doctor doctor) async {
    try {
      await _db.collection('doctors').add(doctor.toMap());
      return true;
    } catch (e) {
      debugPrint("addDoctor error: $e");
      return false;
    }
  }

  Future<bool> updateDoctor(String id, Map<String, dynamic> data) async {
    try {
      await _db.collection('doctors').doc(id).update(data);
      return true;
    } catch (e) {
      debugPrint("updateDoctor error: $e");
      return false;
    }
  }

  Future<bool> deleteDoctor(String id) async {
    try {
      await _db.collection('doctors').doc(id).delete();
      return true;
    } catch (e) {
      debugPrint("deleteDoctor error: $e");
      return false;
    }
  }

  // --- SUPPLIERS / DIRECTORY ---
  Stream<List<Supplier>> getSuppliersStream({String? category}) {
    return _db.collection('suppliers').snapshots().map((snapshot) {
      var list = snapshot.docs
          .map((doc) => Supplier.fromFirestore(doc))
          .where((s) => s.isActive)
          .toList();
      if (category != null && category.isNotEmpty) {
        list = list.where((s) => s.category == category).toList();
      }
      if (list.isEmpty) return _defaultSuppliers(category);
      return list;
    }).handleError((error) {
      return _defaultSuppliers(category);
    });
  }

  List<Supplier> _defaultSuppliers(String? categoryFilter) {
    final all = [
      Supplier(
        id: 'sup1',
        name: 'বিসমিল্লাহ পোল্ট্রি অ্যান্ড ফিড',
        category: 'feed_chick',
        phone: '01712345678',
        address: 'বাসস্ট্যান্ড সংলগ্ন, গাজীপুর',
        district: 'গাজীপুর',
        details: 'উন্নতমানের সোনালী ও ব্রয়লার বাচ্চা এবং প্রিমিয়াম ফিড পাইকারী বিক্রি।',
      ),
      Supplier(
        id: 'sup2',
        name: 'গ্রীন পোল্ট্রি হ্যাচারি',
        category: 'layer',
        phone: '01898765432',
        address: 'ময়মনসিংহ রোড, টাঙ্গাইল',
        district: 'টাঙ্গাইল',
        details: '১ দিনের লেয়ার বাচ্চা ও রেডি লেয়ার সপ্লাই।',
      ),
      Supplier(
        id: 'sup3',
        name: 'রানার ফার্ম ইকুইপমেন্টস',
        category: 'equipment',
        phone: '01911223344',
        address: 'নবাবপুর রোড, ঢাকা',
        district: 'ঢাকা',
        details: 'অটোমেটিক ফিডার, নিপল ড্রিংকার ও এগ গ্রেডার সামগ্রী।',
      ),
      Supplier(
        id: 'sup4',
        name: 'মেসার্স ডেল্টা ফার্মাকোটিক্যালস (ভ্যাকসিন ও মেডিসিন)',
        category: 'vaccine',
        phone: '01555667788',
        address: 'ষ্টেশন রোড, বগুড়া',
        district: 'বগুড়া',
        details: 'আমদানিকৃত কোল্ড চেইন সংরক্ষিত অরিজিনাল পোল্ট্রি ভ্যাকসিন।',
      ),
      Supplier(
        id: 'sup5',
        name: 'অগ্রণী এগ্রো ফিড র মেটেরিয়ালস',
        category: 'raw_material',
        phone: '01677889900',
        address: 'খাতুনগঞ্জ, চট্টগ্রাম',
        district: 'চট্টগ্রাম',
        details: 'আমদানিকৃত সয়াবিন খৈল, ভুট্টা ও প্রিমিক্স পাইকারী আমদানিকারক।',
      ),
    ];

    if (categoryFilter != null && categoryFilter.isNotEmpty) {
      return all.where((s) => s.category == categoryFilter).toList();
    }
    return all;
  }

  Future<bool> addSupplier(Supplier supplier) async {
    try {
      await _db.collection('suppliers').add(supplier.toMap());
      return true;
    } catch (e) {
      debugPrint("addSupplier error: $e");
      return false;
    }
  }

  Future<bool> updateSupplier(String id, Map<String, dynamic> data) async {
    try {
      await _db.collection('suppliers').doc(id).update(data);
      return true;
    } catch (e) {
      debugPrint("updateSupplier error: $e");
      return false;
    }
  }

  Future<bool> deleteSupplier(String id) async {
    try {
      await _db.collection('suppliers').doc(id).delete();
      return true;
    } catch (e) {
      debugPrint("deleteSupplier error: $e");
      return false;
    }
  }
}
