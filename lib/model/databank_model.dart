import 'package:cloud_firestore/cloud_firestore.dart';

class Farm {
  final String id;
  final String name;
  final String location;
  final String farmType; // Sonali, Broiler, Layer, Deshi
  final DateTime? createdAt;

  Farm({
    required this.id,
    required this.name,
    required this.location,
    required this.farmType,
    this.createdAt,
  });

  factory Farm.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Farm(
      id: doc.id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      farmType: data['farmType'] ?? 'Broiler',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'farmType': farmType,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Farm && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Batch {
  final String id;
  final String batchName;
  final String birdType;
  final int initialBirds;
  final double chickCost;
  final DateTime startDate;
  final bool isActive;

  Batch({
    required this.id,
    required this.batchName,
    required this.birdType,
    required this.initialBirds,
    required this.chickCost,
    required this.startDate,
    this.isActive = true,
  });

  factory Batch.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Batch(
      id: doc.id,
      batchName: data['batchName'] ?? '',
      birdType: data['birdType'] ?? 'Broiler',
      initialBirds: (data['initialBirds'] as num?)?.toInt() ?? 0,
      chickCost: (data['chickCost'] as num?)?.toDouble() ?? 0.0,
      startDate: (data['startDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isActive: data['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'batchName': batchName,
      'birdType': birdType,
      'initialBirds': initialBirds,
      'chickCost': chickCost,
      'startDate': Timestamp.fromDate(startDate),
      'isActive': isActive,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Batch && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class DailyRecord {
  final String id;
  final DateTime date;
  final double feedKg;
  final int mortality;
  final int eggCount;
  final double expenseAmount;
  final String expenseNotes;
  final double salesAmount;
  final String salesNotes;

  DailyRecord({
    required this.id,
    required this.date,
    this.feedKg = 0.0,
    this.mortality = 0,
    this.eggCount = 0,
    this.expenseAmount = 0.0,
    this.expenseNotes = '',
    this.salesAmount = 0.0,
    this.salesNotes = '',
  });

  factory DailyRecord.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return DailyRecord(
      id: doc.id,
      date: (data['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      feedKg: (data['feedKg'] as num?)?.toDouble() ?? 0.0,
      mortality: (data['mortality'] as num?)?.toInt() ?? 0,
      eggCount: (data['eggCount'] as num?)?.toInt() ?? 0,
      expenseAmount: (data['expenseAmount'] as num?)?.toDouble() ?? 0.0,
      expenseNotes: data['expenseNotes'] ?? '',
      salesAmount: (data['salesAmount'] as num?)?.toDouble() ?? 0.0,
      salesNotes: data['salesNotes'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': Timestamp.fromDate(date),
      'feedKg': feedKg,
      'mortality': mortality,
      'eggCount': eggCount,
      'expenseAmount': expenseAmount,
      'expenseNotes': expenseNotes,
      'salesAmount': salesAmount,
      'salesNotes': salesNotes,
    };
  }
}
