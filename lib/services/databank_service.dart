import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/databank_model.dart';

class DataBankService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get currentUserId => _auth.currentUser?.uid;

  // --- FARMS ---
  Stream<List<Farm>> getFarmsStream() {
    final uid = currentUserId;
    if (uid == null) return Stream.value([]);

    return _db
        .collection('users')
        .doc(uid)
        .collection('farms')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Farm.fromFirestore(doc)).toList());
  }

  Future<void> addFarm(Farm farm) async {
    final uid = currentUserId;
    if (uid == null) throw Exception("User not logged in");
    await _db.collection('users').doc(uid).collection('farms').add(farm.toMap());
  }

  // --- BATCHES ---
  Stream<List<Batch>> getBatchesStream(String farmId) {
    final uid = currentUserId;
    if (uid == null) return Stream.value([]);

    return _db
        .collection('users')
        .doc(uid)
        .collection('farms')
        .doc(farmId)
        .collection('batches')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Batch.fromFirestore(doc)).toList());
  }

  Future<void> addBatch(String farmId, Batch batch) async {
    final uid = currentUserId;
    if (uid == null) throw Exception("User not logged in");
    await _db
        .collection('users')
        .doc(uid)
        .collection('farms')
        .doc(farmId)
        .collection('batches')
        .add(batch.toMap());
  }

  // --- DAILY RECORDS ---
  Stream<List<DailyRecord>> getDailyRecordsStream(String farmId, String batchId) {
    final uid = currentUserId;
    if (uid == null) return Stream.value([]);

    return _db
        .collection('users')
        .doc(uid)
        .collection('farms')
        .doc(farmId)
        .collection('batches')
        .doc(batchId)
        .collection('daily_records')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => DailyRecord.fromFirestore(doc)).toList());
  }

  Future<void> addDailyRecord(String farmId, String batchId, DailyRecord record) async {
    final uid = currentUserId;
    if (uid == null) throw Exception("User not logged in");
    await _db
        .collection('users')
        .doc(uid)
        .collection('farms')
        .doc(farmId)
        .collection('batches')
        .doc(batchId)
        .collection('daily_records')
        .add(record.toMap());
  }
}
