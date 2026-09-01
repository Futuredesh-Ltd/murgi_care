import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model/local_databank_models.dart';
import '../model/feed_standard_model.dart';

class LocalDataBankService {
  static final LocalDataBankService _instance = LocalDataBankService._internal();
  factory LocalDataBankService() => _instance;
  LocalDataBankService._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('murgi_care_databank.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    final db = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );

    try {
      await db.execute('ALTER TABLE lab_reports ADD COLUMN imageUrls TEXT');
    } catch (_) {}
    try {
      await db.execute('ALTER TABLE breeder_logs ADD COLUMN femaleWeightGrams REAL');
      await db.execute('ALTER TABLE breeder_logs ADD COLUMN femaleUniformityPercent REAL');
      await db.execute('ALTER TABLE breeder_logs ADD COLUMN maleWeightGrams REAL');
      await db.execute('ALTER TABLE breeder_logs ADD COLUMN maleUniformityPercent REAL');
      await db.execute('ALTER TABLE breeder_logs ADD COLUMN remarks TEXT');
    } catch (_) {}

    return db;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE flocks (
        id TEXT PRIMARY KEY,
        name TEXT,
        birdType TEXT,
        initialBirds INTEGER,
        chickCost REAL,
        startDate TEXT,
        notes TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE daily_records (
        id TEXT PRIMARY KEY,
        flockId TEXT,
        date TEXT,
        feedKg REAL,
        mortality INTEGER,
        eggCount INTEGER,
        bodyWeightGrams REAL,
        expenseAmount REAL,
        salesAmount REAL,
        notes TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE vaccine_schedules (
        id TEXT PRIMARY KEY,
        flockId TEXT,
        vaccineName TEXT,
        diseaseName TEXT,
        targetAgeDays INTEGER,
        scheduledDate TEXT,
        status TEXT,
        notes TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE lab_reports (
        id TEXT PRIMARY KEY,
        flockId TEXT,
        date TEXT,
        testType TEXT,
        sampleName TEXT,
        findings TEXT,
        diagnosis TEXT,
        recommendation TEXT,
        imageUrls TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE disease_logs (
        id TEXT PRIMARY KEY,
        flockId TEXT,
        date TEXT,
        symptoms TEXT,
        diagnosedDisease TEXT,
        severity TEXT,
        treatmentPrescribed TEXT,
        medicationCost REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE breeder_logs (
        id TEXT PRIMARY KEY,
        flockId TEXT,
        weekNumber INTEGER,
        date TEXT,
        avgWeightGrams REAL,
        targetWeightGrams REAL,
        uniformityPercent REAL,
        eggProdPercent REAL,
        hatchabilityPercent REAL,
        feedPerBirdGrams REAL,
        femaleWeightGrams REAL,
        femaleUniformityPercent REAL,
        maleWeightGrams REAL,
        maleUniformityPercent REAL,
        remarks TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE feed_formulations (
        id TEXT PRIMARY KEY,
        formulaName TEXT,
        targetBreed TEXT,
        crudeProteinPercent REAL,
        metabolizableEnergy REAL,
        totalBatchKg REAL,
        costPerKg REAL,
        ingredientsRatio TEXT,
        createdAt TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS feed_custom_ingredients (
        id TEXT PRIMARY KEY,
        name TEXT,
        cp REAL,
        me REAL,
        ca REAL,
        avP REAL,
        lys REAL,
        met REAL,
        fiber REAL,
        fat REAL,
        pricePerKg REAL,
        isCustom INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE molting_records (
        id TEXT PRIMARY KEY,
        flockId TEXT,
        startDate TEXT,
        targetDurationDays INTEGER,
        lightHours REAL,
        feedFastDays INTEGER,
        weightLossPercent REAL,
        eggProdRestartDate TEXT,
        currentPhase TEXT,
        notes TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE investment_projects (
        id TEXT PRIMARY KEY,
        projectName TEXT,
        location TEXT,
        farmType TEXT,
        breedType TEXT,
        birdQuantity INTEGER,
        houseType TEXT,
        floorSystem TEXT,
        district TEXT,
        numberOfSheds INTEGER,
        shedCost REAL,
        chickCostTotal REAL,
        feedBudgetTotal REAL,
        medicineBudget REAL,
        laborCost REAL,
        expectedRevenue REAL,
        actualSpent REAL,
        createdAt TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE biosecurity_audits (
        id TEXT PRIMARY KEY,
        farmName TEXT,
        auditType TEXT,
        managerName TEXT,
        location TEXT,
        inspectionTeam TEXT,
        auditDate TEXT,
        overallScorePercent REAL,
        passedItemsCount INTEGER,
        totalItemsCount INTEGER,
        riskLevel TEXT,
        auditChecklist TEXT,
        answersMap TEXT,
        remarksMap TEXT,
        recommendations TEXT
      )
    ''');
  }

  // Helper method for fallback or shared preferences backup
  Future<void> saveToPreferences(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      await prefs.setString(key, jsonEncode(value));
    }
  }

  // --- 1. FLOCKS ---
  Future<List<LocalFlock>> getFlocks() async {
    try {
      final db = await database;
      final result = await db.query('flocks', orderBy: 'startDate DESC');
      return result.map((json) => LocalFlock.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertFlock(LocalFlock flock) async {
    final db = await database;
    await db.insert('flocks', flock.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteFlock(String id) async {
    final db = await database;
    await db.delete('flocks', where: 'id = ?', whereArgs: [id]);
    await db.delete('daily_records', where: 'flockId = ?', whereArgs: [id]);
  }

  // --- 2. DAILY RECORDS ---
  Future<List<LocalDailyRecord>> getDailyRecords(String flockId) async {
    try {
      final db = await database;
      final result = await db.query('daily_records', where: 'flockId = ?', whereArgs: [flockId], orderBy: 'date DESC');
      return result.map((json) => LocalDailyRecord.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertDailyRecord(LocalDailyRecord record) async {
    final db = await database;
    await db.insert('daily_records', record.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteDailyRecord(String id) async {
    final db = await database;
    await db.delete('daily_records', where: 'id = ?', whereArgs: [id]);
  }

  // --- 3. VACCINE SCHEDULES ---
  Future<List<LocalVaccineSchedule>> getVaccineSchedules(String flockId) async {
    try {
      final db = await database;
      final result = await db.query(
        'vaccine_schedules',
        where: 'flockId = ?',
        whereArgs: [flockId],
        orderBy: 'targetAgeDays ASC',
      );
      return result.map((json) => LocalVaccineSchedule.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertVaccineSchedule(LocalVaccineSchedule schedule) async {
    final db = await database;
    await db.insert('vaccine_schedules', schedule.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateVaccineStatus(String id, String newStatus) async {
    final db = await database;
    await db.update('vaccine_schedules', {'status': newStatus}, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteVaccineSchedule(String id) async {
    final db = await database;
    await db.delete('vaccine_schedules', where: 'id = ?', whereArgs: [id]);
  }

  // --- 4. LAB REPORTS ---
  Future<List<LocalLabReport>> getLabReports(String flockId) async {
    try {
      final db = await database;
      final result = await db.query('lab_reports', where: 'flockId = ?', whereArgs: [flockId], orderBy: 'date DESC');
      return result.map((json) => LocalLabReport.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertLabReport(LocalLabReport report) async {
    final db = await database;
    await db.insert('lab_reports', report.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<String>> syncLabReportToFirestore({
    required LocalLabReport report,
    required List<File> imageFiles,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final List<String> uploadedUrls = [];

    if (user != null && imageFiles.isNotEmpty) {
      for (int i = 0; i < imageFiles.length; i++) {
        try {
          final file = imageFiles[i];
          final ref = FirebaseStorage.instance
              .ref()
              .child('lab_reports/${user.uid}/${report.id}_photo_$i.jpg');
          final uploadTask = await ref.putFile(file);
          final url = await uploadTask.ref.getDownloadURL();
          uploadedUrls.add(url);
        } catch (_) {
          uploadedUrls.add(imageFiles[i].path);
        }
      }
    } else {
      uploadedUrls.addAll(imageFiles.map((f) => f.path));
    }

    final allUrls = [...report.imageUrls, ...uploadedUrls];

    final updatedReport = LocalLabReport(
      id: report.id,
      flockId: report.flockId,
      date: report.date,
      testType: report.testType,
      sampleName: report.sampleName,
      findings: report.findings,
      diagnosis: report.diagnosis,
      recommendation: report.recommendation,
      imageUrls: allUrls,
    );

    // Save locally
    await insertLabReport(updatedReport);

    // Sync to Cloud Firestore document with User ID, User Name, and Disease Details
    if (user != null) {
      try {
        final docData = {
          'id': report.id,
          'userId': user.uid,
          'userName': user.displayName ?? user.email?.split('@').first ?? 'Farmer',
          'userEmail': user.email ?? '',
          'flockId': report.flockId,
          'date': report.date.toIso8601String(),
          'testType': report.testType,
          'sampleName': report.sampleName,
          'findings': report.findings,
          'diagnosis': report.diagnosis,
          'recommendation': report.recommendation,
          'imageUrls': allUrls,
          'createdAt': FieldValue.serverTimestamp(),
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('lab_reports')
            .doc(report.id)
            .set(docData, SetOptions(merge: true));

        await FirebaseFirestore.instance
            .collection('disease_reports')
            .doc(report.id)
            .set(docData, SetOptions(merge: true));
      } catch (_) {}
    }

    return allUrls;
  }

  Future<void> deleteLabReport(String id) async {
    final db = await database;
    await db.delete('lab_reports', where: 'id = ?', whereArgs: [id]);
  }

  // --- 5. DISEASE LOGS ---
  Future<List<LocalDiseaseLog>> getDiseaseLogs(String flockId) async {
    try {
      final db = await database;
      final result = await db.query('disease_logs', where: 'flockId = ?', whereArgs: [flockId], orderBy: 'date DESC');
      return result.map((json) => LocalDiseaseLog.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertDiseaseLog(LocalDiseaseLog log) async {
    final db = await database;
    await db.insert('disease_logs', log.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<String>> syncDiseaseLogToFirestore({
    required LocalDiseaseLog log,
    required List<File> imageFiles,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final List<String> uploadedUrls = [];

    if (user != null && imageFiles.isNotEmpty) {
      for (int i = 0; i < imageFiles.length; i++) {
        try {
          final file = imageFiles[i];
          final ref = FirebaseStorage.instance
              .ref()
              .child('disease_reports/${user.uid}/${log.id}_photo_$i.jpg');
          final uploadTask = await ref.putFile(file);
          final url = await uploadTask.ref.getDownloadURL();
          uploadedUrls.add(url);
        } catch (_) {
          uploadedUrls.add(imageFiles[i].path);
        }
      }
    } else {
      uploadedUrls.addAll(imageFiles.map((f) => f.path));
    }

    final allUrls = [...log.imageUrls, ...uploadedUrls];

    final updatedLog = LocalDiseaseLog(
      id: log.id,
      flockId: log.flockId,
      date: log.date,
      symptoms: log.symptoms,
      diagnosedDisease: log.diagnosedDisease,
      severity: log.severity,
      treatmentPrescribed: log.treatmentPrescribed,
      medicationCost: log.medicationCost,
      birdType: log.birdType,
      ageGroup: log.ageGroup,
      lesions: log.lesions,
      imageUrls: allUrls,
    );

    // Save locally
    await insertDiseaseLog(updatedLog);

    // Sync to Cloud Firestore
    if (user != null) {
      try {
        final docData = {
          'id': log.id,
          'userId': user.uid,
          'userName': user.displayName ?? user.email?.split('@').first ?? 'Farmer',
          'userEmail': user.email ?? '',
          'flockId': log.flockId,
          'date': log.date.toIso8601String(),
          'birdType': log.birdType,
          'ageGroup': log.ageGroup,
          'symptoms': log.symptoms,
          'lesions': log.lesions,
          'diagnosedDisease': log.diagnosedDisease,
          'severity': log.severity,
          'treatmentPrescribed': log.treatmentPrescribed,
          'imageUrls': allUrls,
          'createdAt': FieldValue.serverTimestamp(),
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('disease_reports')
            .doc(log.id)
            .set(docData, SetOptions(merge: true));

        await FirebaseFirestore.instance
            .collection('disease_reports')
            .doc(log.id)
            .set(docData, SetOptions(merge: true));
      } catch (_) {}
    }

    return allUrls;
  }

  Future<void> deleteDiseaseLog(String id) async {
    final db = await database;
    await db.delete('disease_logs', where: 'id = ?', whereArgs: [id]);
  }

  // --- 6. BREEDER LOGS ---
  Future<List<LocalBreederLog>> getBreederLogs(String flockId) async {
    try {
      final db = await database;
      final result = await db.query('breeder_logs', where: 'flockId = ?', whereArgs: [flockId], orderBy: 'weekNumber ASC');
      return result.map((json) => LocalBreederLog.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertBreederLog(LocalBreederLog log) async {
    final db = await database;
    await db.insert('breeder_logs', log.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteBreederLog(String id) async {
    final db = await database;
    await db.delete('breeder_logs', where: 'id = ?', whereArgs: [id]);
  }

  // --- 7. FEED FORMULATIONS ---
  Future<List<LocalFeedFormulation>> getFeedFormulations() async {
    try {
      final db = await database;
      final result = await db.query('feed_formulations', orderBy: 'createdAt DESC');
      return result.map((json) => LocalFeedFormulation.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertFeedFormulation(LocalFeedFormulation formulation) async {
    final db = await database;
    await db.insert('feed_formulations', formulation.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteFeedFormulation(String id) async {
    final db = await database;
    await db.delete('feed_formulations', where: 'id = ?', whereArgs: [id]);
  }

  // --- Custom Ingredients ---
  Future<List<FeedIngredient>> getCustomIngredients() async {
    try {
      final db = await database;
      final result = await db.query('feed_custom_ingredients', orderBy: 'name ASC');
      return result.map((json) => FeedIngredient.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertCustomIngredient(FeedIngredient item) async {
    final db = await database;
    await db.insert('feed_custom_ingredients', item.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteCustomIngredient(String id) async {
    final db = await database;
    await db.delete('feed_custom_ingredients', where: 'id = ? OR name = ?', whereArgs: [id, id]);
  }

  // --- 8. MOLTING RECORDS ---
  Future<List<LocalMoltingRecord>> getMoltingRecords(String flockId) async {
    try {
      final db = await database;
      final result = await db.query('molting_records', where: 'flockId = ?', whereArgs: [flockId], orderBy: 'startDate DESC');
      return result.map((json) => LocalMoltingRecord.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertMoltingRecord(LocalMoltingRecord record) async {
    final db = await database;
    await db.insert('molting_records', record.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteMoltingRecord(String id) async {
    final db = await database;
    await db.delete('molting_records', where: 'id = ?', whereArgs: [id]);
  }

  // --- 9. INVESTMENT PROJECTS ---
  Future<List<LocalInvestmentProject>> getInvestmentProjects() async {
    try {
      final db = await database;
      final result = await db.query('investment_projects', orderBy: 'createdAt DESC');
      return result.map((json) => LocalInvestmentProject.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertInvestmentProject(LocalInvestmentProject project) async {
    final db = await database;
    await db.insert('investment_projects', project.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteInvestmentProject(String id) async {
    final db = await database;
    await db.delete('investment_projects', where: 'id = ?', whereArgs: [id]);
  }

  // --- 10. BIOSECURITY AUDITS ---
  Future<List<LocalBiosecurityAudit>> getBiosecurityAudits() async {
    try {
      final db = await database;
      final result = await db.query('biosecurity_audits', orderBy: 'auditDate DESC');
      return result.map((json) => LocalBiosecurityAudit.fromMap(json)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> insertBiosecurityAudit(LocalBiosecurityAudit audit) async {
    final db = await database;
    await db.insert('biosecurity_audits', audit.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteBiosecurityAudit(String id) async {
    final db = await database;
    await db.delete('biosecurity_audits', where: 'id = ?', whereArgs: [id]);
  }
}
