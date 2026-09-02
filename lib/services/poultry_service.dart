import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/banner_model.dart';
import '../model/announcement_model.dart';
import '../model/market_price_model.dart';
import '../model/doctor_model.dart';
import '../model/doctor_request_model.dart';
import '../model/supplier_model.dart';
import '../model/daily_card_model.dart';
import '../model/article.dart';

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
      // Seed Articles
      for (var art in Article.mockArticles) {
        await _db.collection('articles').add(art.toMap());
      }
      for (var art in Article.parentsStockArticles) {
        await _db.collection('articles').add(art.copyWithCategory('parents_stock').toMap());
      }
      for (var art in Article.hatcheryArticles) {
        await _db.collection('articles').add(art.copyWithCategory('hatchery').toMap());
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
        imageUrl: 'https://images.unsplash.com/photo-1569058242252-623df46b5025?q=80&w=800&auto=format&fit=crop',
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

  static final List<DoctorContactRequest> _localDoctorRequests = [];
  static final StreamController<List<DoctorContactRequest>> _localRequestsStreamCtrl =
      StreamController<List<DoctorContactRequest>>.broadcast();

  // --- DOCTOR CONTACT REQUESTS ---
  Future<bool> requestDoctorContact(DoctorContactRequest request) async {
    final String reqId = request.id.isNotEmpty
        ? request.id
        : "req_${DateTime.now().millisecondsSinceEpoch}";
    final localReq = DoctorContactRequest(
      id: reqId,
      userId: request.userId,
      userName: request.userName,
      userPhone: request.userPhone,
      userEmail: request.userEmail,
      doctorId: request.doctorId,
      doctorName: request.doctorName,
      doctorSpecialization: request.doctorSpecialization,
      status: request.status,
      permission: request.permission,
      requestedAt: request.requestedAt ?? DateTime.now(),
    );

    // Save locally
    _localDoctorRequests.removeWhere(
        (r) => r.id == reqId || (r.userId == localReq.userId && r.doctorId == localReq.doctorId));
    _localDoctorRequests.insert(0, localReq);
    _localRequestsStreamCtrl.add(_localDoctorRequests);

    try {
      final map = localReq.toMap();
      await _db.collection('requests').doc(reqId).set(map);
      try {
        await _db.collection('doctor_requests').doc(reqId).set(map);
      } catch (_) {}
      return true;
    } catch (e) {
      debugPrint("requestDoctorContact firestore error (local state active): $e");
      return true; // Local update succeeds
    }
  }

  Stream<List<DoctorContactRequest>> getDoctorContactRequestsStream() async* {
    final localList = List<DoctorContactRequest>.from(_localDoctorRequests);
    localList.sort((a, b) {
      final dtA = a.requestedAt ?? DateTime.now();
      final dtB = b.requestedAt ?? DateTime.now();
      return dtB.compareTo(dtA);
    });
    yield localList;

    try {
      await for (final snapshot in _db.collection('requests').snapshots()) {
        final firestoreList = snapshot.docs
            .map((doc) => DoctorContactRequest.fromFirestore(doc))
            .toList();
        final Map<String, DoctorContactRequest> map = {};
        for (final r in _localDoctorRequests) {
          map[r.id] = r;
        }
        for (final r in firestoreList) {
          map[r.id] = r;
        }
        final list = map.values.toList();
        list.sort((a, b) {
          final dtA = a.requestedAt ?? DateTime.now();
          final dtB = b.requestedAt ?? DateTime.now();
          return dtB.compareTo(dtA);
        });
        yield list;
      }
    } catch (e) {
      debugPrint("getDoctorContactRequestsStream firestore error (local state active): $e");
      yield localList;
    }
  }

  Stream<List<DoctorContactRequest>> getUserDoctorRequestsStream(String userId) async* {
    final List<DoctorContactRequest> userLocal = _localDoctorRequests
        .where((r) => userId.isEmpty || r.userId == userId)
        .toList();

    yield userLocal;

    if (userId.isEmpty) return;

    try {
      await for (final snapshot in _db
          .collection('requests')
          .where('userId', isEqualTo: userId)
          .snapshots()) {
        final firestoreList = snapshot.docs
            .map((doc) => DoctorContactRequest.fromFirestore(doc))
            .toList();
        final Map<String, DoctorContactRequest> map = {};
        for (final r in userLocal) {
          map[r.doctorId] = r;
        }
        for (final r in firestoreList) {
          map[r.doctorId] = r;
        }
        yield map.values.toList();
      }
    } catch (e) {
      debugPrint("getUserDoctorRequestsStream firestore error (local state active): $e");
      yield userLocal;
    }
  }

  Future<bool> updateDoctorRequestStatus(String requestId, String status, {String? permission}) async {
    final perm = permission ?? (status == 'accepted' ? 'yes' : 'no');

    final idx = _localDoctorRequests.indexWhere((r) => r.id == requestId);
    if (idx != -1) {
      final old = _localDoctorRequests[idx];
      _localDoctorRequests[idx] = DoctorContactRequest(
        id: old.id,
        userId: old.userId,
        userName: old.userName,
        userPhone: old.userPhone,
        userEmail: old.userEmail,
        doctorId: old.doctorId,
        doctorName: old.doctorName,
        doctorSpecialization: old.doctorSpecialization,
        status: status,
        permission: perm,
        requestedAt: old.requestedAt,
        updatedAt: DateTime.now(),
      );
      _localRequestsStreamCtrl.add(_localDoctorRequests);
    }

    final data = {
      'status': status,
      'permission': perm,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    try {
      await _db.collection('requests').doc(requestId).update(data);
      try {
        await _db.collection('doctor_requests').doc(requestId).update(data);
      } catch (_) {}
      return true;
    } catch (e) {
      debugPrint("updateDoctorRequestStatus firestore error: $e");
      return true; // Local update succeeds
    }
  }

  Future<bool> deleteDoctorRequest(String requestId) async {
    _localDoctorRequests.removeWhere((r) => r.id == requestId);
    _localRequestsStreamCtrl.add(_localDoctorRequests);
    try {
      await _db.collection('requests').doc(requestId).delete();
      try {
        await _db.collection('doctor_requests').doc(requestId).delete();
      } catch (_) {}
      return true;
    } catch (e) {
      debugPrint("deleteDoctorRequest firestore error: $e");
      return true;
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

  // --- SUPPLIER IMAGE UPLOAD ---
  Future<String?> uploadSupplierImage(File imageFile) async {
    try {
      final fileName = 'supplier_${DateTime.now().millisecondsSinceEpoch}_${imageFile.hashCode}.jpg';
      final ref = _storage.ref().child('suppliers').child(fileName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      final uploadTask = ref.putFile(imageFile, metadata);
      final snapshot = await uploadTask.timeout(const Duration(seconds: 6));

      if (snapshot.state == TaskState.success) {
        return await snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      debugPrint("uploadSupplierImage storage error: $e");
    }

    try {
      final bytes = await imageFile.readAsBytes();
      final base64Str = base64Encode(bytes);
      return 'data:image/jpeg;base64,$base64Str';
    } catch (e) {
      debugPrint("uploadSupplierImage base64 fallback error: $e");
      return null;
    }
  }

  // --- DOCTOR IMAGE UPLOAD ---
  Future<String?> uploadDoctorImage(File imageFile) async {
    try {
      final fileName = 'doctor_${DateTime.now().millisecondsSinceEpoch}_${imageFile.hashCode}.jpg';
      final ref = _storage.ref().child('doctors').child(fileName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      final uploadTask = ref.putFile(imageFile, metadata);
      final snapshot = await uploadTask.timeout(const Duration(seconds: 6));

      if (snapshot.state == TaskState.success) {
        return await snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      debugPrint("uploadDoctorImage storage error (using base64 fallback): $e");
    }

    try {
      final bytes = await imageFile.readAsBytes();
      final base64Str = base64Encode(bytes);
      return 'data:image/jpeg;base64,$base64Str';
    } catch (e) {
      debugPrint("uploadDoctorImage base64 fallback error: $e");
      return null;
    }
  }

  // --- ARTICLES ---
  Future<String?> uploadArticleImage(File imageFile) async {
    try {
      final fileName = 'article_${DateTime.now().millisecondsSinceEpoch}_${imageFile.hashCode}.jpg';
      final ref = _storage.ref().child('articles').child(fileName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      final uploadTask = ref.putFile(imageFile, metadata);
      final snapshot = await uploadTask.whenComplete(() {});

      if (snapshot.state == TaskState.success) {
        return await snapshot.ref.getDownloadURL();
      }
    } catch (_) {}

    try {
      final bytes = await imageFile.readAsBytes();
      final base64Str = base64Encode(bytes);
      return 'data:image/jpeg;base64,$base64Str';
    } catch (_) {
      return null;
    }
  }

  Stream<List<Article>> getArticlesStream({String? category}) {
    Query query = _db.collection('articles');
    if (category != null && category.isNotEmpty && category != 'all') {
      query = query.where('category', isEqualTo: category);
    }
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Article.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<bool> addArticle(Article article) async {
    try {
      await _db.collection('articles').add(article.toMap());
      return true;
    } catch (e) {
      debugPrint("addArticle error: $e");
      return false;
    }
  }

  Future<bool> updateArticle(String id, Map<String, dynamic> data) async {
    try {
      await _db.collection('articles').doc(id).update(data);
      return true;
    } catch (e) {
      debugPrint("updateArticle error: $e");
      return false;
    }
  }

  Future<bool> deleteArticle(String id) async {
    try {
      await _db.collection('articles').doc(id).delete();
      return true;
    } catch (e) {
      debugPrint("deleteArticle error: $e");
      return false;
    }
  }
}
