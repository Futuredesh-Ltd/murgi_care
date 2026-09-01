import 'dart:convert';

// 1. Flock Model
class LocalFlock {
  final String id;
  final String name;
  final String birdType; // Broiler, Layer, Sonali, Breeder, etc.
  final int initialBirds;
  final double chickCost;
  final DateTime startDate;
  final String notes;

  LocalFlock({
    required this.id,
    required this.name,
    required this.birdType,
    required this.initialBirds,
    required this.chickCost,
    required this.startDate,
    this.notes = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birdType': birdType,
      'initialBirds': initialBirds,
      'chickCost': chickCost,
      'startDate': startDate.toIso8601String(),
      'notes': notes,
    };
  }

  factory LocalFlock.fromMap(Map<String, dynamic> map) {
    return LocalFlock(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      birdType: map['birdType'] ?? 'Broiler',
      initialBirds: (map['initialBirds'] as num?)?.toInt() ?? 0,
      chickCost: (map['chickCost'] as num?)?.toDouble() ?? 0.0,
      startDate: DateTime.tryParse(map['startDate'] ?? '') ?? DateTime.now(),
      notes: map['notes'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalFlock && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

// 2. Daily Record Model
class LocalDailyRecord {
  final String id;
  final String flockId;
  final DateTime date;
  final double feedKg;
  final int mortality;
  final int eggCount;
  final double bodyWeightGrams;
  final double expenseAmount;
  final double salesAmount;
  final String notes;

  LocalDailyRecord({
    required this.id,
    required this.flockId,
    required this.date,
    this.feedKg = 0.0,
    this.mortality = 0,
    this.eggCount = 0,
    this.bodyWeightGrams = 0.0,
    this.expenseAmount = 0.0,
    this.salesAmount = 0.0,
    this.notes = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'flockId': flockId,
      'date': date.toIso8601String(),
      'feedKg': feedKg,
      'mortality': mortality,
      'eggCount': eggCount,
      'bodyWeightGrams': bodyWeightGrams,
      'expenseAmount': expenseAmount,
      'salesAmount': salesAmount,
      'notes': notes,
    };
  }

  factory LocalDailyRecord.fromMap(Map<String, dynamic> map) {
    return LocalDailyRecord(
      id: map['id'] ?? '',
      flockId: map['flockId'] ?? '',
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      feedKg: (map['feedKg'] as num?)?.toDouble() ?? 0.0,
      mortality: (map['mortality'] as num?)?.toInt() ?? 0,
      eggCount: (map['eggCount'] as num?)?.toInt() ?? 0,
      bodyWeightGrams: (map['bodyWeightGrams'] as num?)?.toDouble() ?? 0.0,
      expenseAmount: (map['expenseAmount'] as num?)?.toDouble() ?? 0.0,
      salesAmount: (map['salesAmount'] as num?)?.toDouble() ?? 0.0,
      notes: map['notes'] ?? '',
    );
  }
}

// 3. Vaccine Schedule Model
class LocalVaccineSchedule {
  final String id;
  final String flockId;
  final String vaccineName;
  final String diseaseName;
  final int targetAgeDays;
  final DateTime scheduledDate;
  final String status; // 'pending' or 'completed'
  final String notes;

  LocalVaccineSchedule({
    required this.id,
    required this.flockId,
    required this.vaccineName,
    required this.diseaseName,
    required this.targetAgeDays,
    required this.scheduledDate,
    this.status = 'pending',
    this.notes = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'flockId': flockId,
      'vaccineName': vaccineName,
      'diseaseName': diseaseName,
      'targetAgeDays': targetAgeDays,
      'scheduledDate': scheduledDate.toIso8601String(),
      'status': status,
      'notes': notes,
    };
  }

  factory LocalVaccineSchedule.fromMap(Map<String, dynamic> map) {
    return LocalVaccineSchedule(
      id: map['id'] ?? '',
      flockId: map['flockId'] ?? '',
      vaccineName: map['vaccineName'] ?? '',
      diseaseName: map['diseaseName'] ?? '',
      targetAgeDays: (map['targetAgeDays'] as num?)?.toInt() ?? 1,
      scheduledDate: DateTime.tryParse(map['scheduledDate'] ?? '') ?? DateTime.now(),
      status: map['status'] ?? 'pending',
      notes: map['notes'] ?? '',
    );
  }
}

// 4. Lab Report Model
class LocalLabReport {
  final String id;
  final String flockId;
  final DateTime date;
  final String testType; // Serology, PCR, Autopsy, Swab, Water
  final String sampleName;
  final String findings;
  final String diagnosis;
  final String recommendation;
  final List<String> imageUrls;

  LocalLabReport({
    required this.id,
    required this.flockId,
    required this.date,
    required this.testType,
    required this.sampleName,
    required this.findings,
    required this.diagnosis,
    this.recommendation = '',
    this.imageUrls = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'flockId': flockId,
      'date': date.toIso8601String(),
      'testType': testType,
      'sampleName': sampleName,
      'findings': findings,
      'diagnosis': diagnosis,
      'recommendation': recommendation,
      'imageUrls': jsonEncode(imageUrls),
    };
  }

  factory LocalLabReport.fromMap(Map<String, dynamic> map) {
    List<String> parsedUrls = [];
    if (map['imageUrls'] != null) {
      try {
        if (map['imageUrls'] is List) {
          parsedUrls = List<String>.from(map['imageUrls']);
        } else {
          parsedUrls = List<String>.from(jsonDecode(map['imageUrls']));
        }
      } catch (_) {}
    }

    return LocalLabReport(
      id: map['id'] ?? '',
      flockId: map['flockId'] ?? '',
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      testType: map['testType'] ?? 'General',
      sampleName: map['sampleName'] ?? '',
      findings: map['findings'] ?? '',
      diagnosis: map['diagnosis'] ?? '',
      recommendation: map['recommendation'] ?? '',
      imageUrls: parsedUrls,
    );
  }
}

// 5. Disease Identification Model
class LocalDiseaseLog {
  final String id;
  final String flockId;
  final DateTime date;
  final List<String> symptoms;
  final String diagnosedDisease;
  final String severity; // Mild, Moderate, Severe
  final String treatmentPrescribed;
  final double medicationCost;
  final String birdType;
  final String ageGroup;
  final List<String> lesions;
  final List<String> imageUrls;

  LocalDiseaseLog({
    required this.id,
    required this.flockId,
    required this.date,
    required this.symptoms,
    required this.diagnosedDisease,
    this.severity = 'Moderate',
    required this.treatmentPrescribed,
    this.medicationCost = 0.0,
    this.birdType = '',
    this.ageGroup = '',
    this.lesions = const [],
    this.imageUrls = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'flockId': flockId,
      'date': date.toIso8601String(),
      'symptoms': jsonEncode(symptoms),
      'diagnosedDisease': diagnosedDisease,
      'severity': severity,
      'treatmentPrescribed': treatmentPrescribed,
      'medicationCost': medicationCost,
      'birdType': birdType,
      'ageGroup': ageGroup,
      'lesions': jsonEncode(lesions),
      'imageUrls': jsonEncode(imageUrls),
    };
  }

  factory LocalDiseaseLog.fromMap(Map<String, dynamic> map) {
    List<String> parsedSymptoms = [];
    if (map['symptoms'] != null) {
      try {
        if (map['symptoms'] is List) {
          parsedSymptoms = List<String>.from(map['symptoms']);
        } else {
          parsedSymptoms = List<String>.from(jsonDecode(map['symptoms']));
        }
      } catch (_) {
        parsedSymptoms = [map['symptoms'].toString()];
      }
    }

    List<String> parsedLesions = [];
    if (map['lesions'] != null) {
      try {
        if (map['lesions'] is List) {
          parsedLesions = List<String>.from(map['lesions']);
        } else {
          parsedLesions = List<String>.from(jsonDecode(map['lesions']));
        }
      } catch (_) {}
    }

    List<String> parsedUrls = [];
    if (map['imageUrls'] != null) {
      try {
        if (map['imageUrls'] is List) {
          parsedUrls = List<String>.from(map['imageUrls']);
        } else {
          parsedUrls = List<String>.from(jsonDecode(map['imageUrls']));
        }
      } catch (_) {}
    }

    return LocalDiseaseLog(
      id: map['id'] ?? '',
      flockId: map['flockId'] ?? '',
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      symptoms: parsedSymptoms,
      diagnosedDisease: map['diagnosedDisease'] ?? '',
      severity: map['severity'] ?? 'Moderate',
      treatmentPrescribed: map['treatmentPrescribed'] ?? '',
      medicationCost: (map['medicationCost'] as num?)?.toDouble() ?? 0.0,
      birdType: map['birdType'] ?? '',
      ageGroup: map['ageGroup'] ?? '',
      lesions: parsedLesions,
      imageUrls: parsedUrls,
    );
  }
}

// 6. Breeder Development Log Model
class LocalBreederLog {
  final String id;
  final String flockId;
  final int weekNumber;
  final DateTime date;
  final double avgWeightGrams;
  final double targetWeightGrams;
  final double uniformityPercent;
  final double eggProdPercent;
  final double hatchabilityPercent;
  final double feedPerBirdGrams;
  final double femaleWeightGrams;
  final double femaleUniformityPercent;
  final double maleWeightGrams;
  final double maleUniformityPercent;
  final String remarks;

  LocalBreederLog({
    required this.id,
    required this.flockId,
    required this.weekNumber,
    required this.date,
    this.avgWeightGrams = 0.0,
    this.targetWeightGrams = 0.0,
    this.uniformityPercent = 0.0,
    this.eggProdPercent = 0.0,
    this.hatchabilityPercent = 0.0,
    this.feedPerBirdGrams = 0.0,
    double? femaleWeightGrams,
    double? femaleUniformityPercent,
    this.maleWeightGrams = 0.0,
    this.maleUniformityPercent = 0.0,
    this.remarks = '',
  })  : femaleWeightGrams = femaleWeightGrams ?? avgWeightGrams,
        femaleUniformityPercent = femaleUniformityPercent ?? uniformityPercent;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'flockId': flockId,
      'weekNumber': weekNumber,
      'date': date.toIso8601String(),
      'avgWeightGrams': avgWeightGrams,
      'targetWeightGrams': targetWeightGrams,
      'uniformityPercent': uniformityPercent,
      'eggProdPercent': eggProdPercent,
      'hatchabilityPercent': hatchabilityPercent,
      'feedPerBirdGrams': feedPerBirdGrams,
      'femaleWeightGrams': femaleWeightGrams,
      'femaleUniformityPercent': femaleUniformityPercent,
      'maleWeightGrams': maleWeightGrams,
      'maleUniformityPercent': maleUniformityPercent,
      'remarks': remarks,
    };
  }

  factory LocalBreederLog.fromMap(Map<String, dynamic> map) {
    final avgW = (map['avgWeightGrams'] as num?)?.toDouble() ?? 0.0;
    final uniP = (map['uniformityPercent'] as num?)?.toDouble() ?? 0.0;
    final femW = (map['femaleWeightGrams'] as num?)?.toDouble() ?? avgW;
    final femUni = (map['femaleUniformityPercent'] as num?)?.toDouble() ?? uniP;

    return LocalBreederLog(
      id: map['id'] ?? '',
      flockId: map['flockId'] ?? '',
      weekNumber: (map['weekNumber'] as num?)?.toInt() ?? 1,
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      avgWeightGrams: avgW,
      targetWeightGrams: (map['targetWeightGrams'] as num?)?.toDouble() ?? 0.0,
      uniformityPercent: uniP,
      eggProdPercent: (map['eggProdPercent'] as num?)?.toDouble() ?? 0.0,
      hatchabilityPercent: (map['hatchabilityPercent'] as num?)?.toDouble() ?? 0.0,
      feedPerBirdGrams: (map['feedPerBirdGrams'] as num?)?.toDouble() ?? 0.0,
      femaleWeightGrams: femW,
      femaleUniformityPercent: femUni,
      maleWeightGrams: (map['maleWeightGrams'] as num?)?.toDouble() ?? 0.0,
      maleUniformityPercent: (map['maleUniformityPercent'] as num?)?.toDouble() ?? 0.0,
      remarks: map['remarks'] ?? '',
    );
  }
}

// 7. Feed Formulation Model
class LocalFeedFormulation {
  final String id;
  final String formulaName;
  final String targetBreed; // Broiler Starter, Finisher, Layer Phase 1, etc.
  final double crudeProteinPercent;
  final double metabolizableEnergy;
  final double totalBatchKg;
  final double costPerKg;
  final Map<String, double> ingredientsRatio;
  final DateTime createdAt;

  LocalFeedFormulation({
    required this.id,
    required this.formulaName,
    required this.targetBreed,
    required this.crudeProteinPercent,
    required this.metabolizableEnergy,
    required this.totalBatchKg,
    required this.costPerKg,
    required this.ingredientsRatio,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'formulaName': formulaName,
      'targetBreed': targetBreed,
      'crudeProteinPercent': crudeProteinPercent,
      'metabolizableEnergy': metabolizableEnergy,
      'totalBatchKg': totalBatchKg,
      'costPerKg': costPerKg,
      'ingredientsRatio': jsonEncode(ingredientsRatio),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory LocalFeedFormulation.fromMap(Map<String, dynamic> map) {
    Map<String, double> ratio = {};
    if (map['ingredientsRatio'] != null) {
      try {
        final decoded = jsonDecode(map['ingredientsRatio']);
        if (decoded is Map) {
          decoded.forEach((k, v) {
            ratio[k.toString()] = (v as num).toDouble();
          });
        }
      } catch (_) {}
    }

    return LocalFeedFormulation(
      id: map['id'] ?? '',
      formulaName: map['formulaName'] ?? '',
      targetBreed: map['targetBreed'] ?? '',
      crudeProteinPercent: (map['crudeProteinPercent'] as num?)?.toDouble() ?? 0.0,
      metabolizableEnergy: (map['metabolizableEnergy'] as num?)?.toDouble() ?? 0.0,
      totalBatchKg: (map['totalBatchKg'] as num?)?.toDouble() ?? 0.0,
      costPerKg: (map['costPerKg'] as num?)?.toDouble() ?? 0.0,
      ingredientsRatio: ratio,
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}

// 8. Molting Monitoring Model
class LocalMoltingRecord {
  final String id;
  final String flockId;
  final DateTime startDate;
  final int targetDurationDays;
  final double lightHours;
  final int feedFastDays;
  final double weightLossPercent;
  final DateTime? eggProdRestartDate;
  final String currentPhase; // Fasting, Rest, Light Increase, Laying Resume
  final String notes;

  LocalMoltingRecord({
    required this.id,
    required this.flockId,
    required this.startDate,
    required this.targetDurationDays,
    this.lightHours = 8.0,
    this.feedFastDays = 10,
    this.weightLossPercent = 0.0,
    this.eggProdRestartDate,
    this.currentPhase = 'Fasting Phase',
    this.notes = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'flockId': flockId,
      'startDate': startDate.toIso8601String(),
      'targetDurationDays': targetDurationDays,
      'lightHours': lightHours,
      'feedFastDays': feedFastDays,
      'weightLossPercent': weightLossPercent,
      'eggProdRestartDate': eggProdRestartDate?.toIso8601String() ?? '',
      'currentPhase': currentPhase,
      'notes': notes,
    };
  }

  factory LocalMoltingRecord.fromMap(Map<String, dynamic> map) {
    final restartStr = map['eggProdRestartDate'] ?? '';
    return LocalMoltingRecord(
      id: map['id'] ?? '',
      flockId: map['flockId'] ?? '',
      startDate: DateTime.tryParse(map['startDate'] ?? '') ?? DateTime.now(),
      targetDurationDays: (map['targetDurationDays'] as num?)?.toInt() ?? 30,
      lightHours: (map['lightHours'] as num?)?.toDouble() ?? 8.0,
      feedFastDays: (map['feedFastDays'] as num?)?.toInt() ?? 10,
      weightLossPercent: (map['weightLossPercent'] as num?)?.toDouble() ?? 0.0,
      eggProdRestartDate: restartStr.isNotEmpty ? DateTime.tryParse(restartStr) : null,
      currentPhase: map['currentPhase'] ?? 'Fasting Phase',
      notes: map['notes'] ?? '',
    );
  }
}

// 9. Investment Project Model
class LocalInvestmentProject {
  final String id;
  final String projectName;
  final String location;
  final String farmType;
  final String breedType;
  final int birdQuantity;
  final String houseType;
  final String floorSystem;
  final String district;
  final int numberOfSheds;
  final double shedCost;
  final double chickCostTotal;
  final double feedBudgetTotal;
  final double medicineBudget;
  final double laborCost;
  final double expectedRevenue;
  final double actualSpent;
  final DateTime createdAt;

  LocalInvestmentProject({
    required this.id,
    required this.projectName,
    required this.location,
    this.farmType = '',
    this.breedType = '',
    this.birdQuantity = 0,
    this.houseType = '',
    this.floorSystem = '',
    this.district = '',
    this.numberOfSheds = 1,
    this.shedCost = 0.0,
    this.chickCostTotal = 0.0,
    this.feedBudgetTotal = 0.0,
    this.medicineBudget = 0.0,
    this.laborCost = 0.0,
    this.expectedRevenue = 0.0,
    this.actualSpent = 0.0,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectName': projectName,
      'location': location,
      'farmType': farmType,
      'breedType': breedType,
      'birdQuantity': birdQuantity,
      'houseType': houseType,
      'floorSystem': floorSystem,
      'district': district,
      'numberOfSheds': numberOfSheds,
      'shedCost': shedCost,
      'chickCostTotal': chickCostTotal,
      'feedBudgetTotal': feedBudgetTotal,
      'medicineBudget': medicineBudget,
      'laborCost': laborCost,
      'expectedRevenue': expectedRevenue,
      'actualSpent': actualSpent,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory LocalInvestmentProject.fromMap(Map<String, dynamic> map) {
    return LocalInvestmentProject(
      id: map['id'] ?? '',
      projectName: map['projectName'] ?? '',
      location: map['location'] ?? '',
      farmType: map['farmType'] ?? '',
      breedType: map['breedType'] ?? '',
      birdQuantity: (map['birdQuantity'] as num?)?.toInt() ?? 0,
      houseType: map['houseType'] ?? '',
      floorSystem: map['floorSystem'] ?? '',
      district: map['district'] ?? '',
      numberOfSheds: (map['numberOfSheds'] as num?)?.toInt() ?? 1,
      shedCost: (map['shedCost'] as num?)?.toDouble() ?? 0.0,
      chickCostTotal: (map['chickCostTotal'] as num?)?.toDouble() ?? 0.0,
      feedBudgetTotal: (map['feedBudgetTotal'] as num?)?.toDouble() ?? 0.0,
      medicineBudget: (map['medicineBudget'] as num?)?.toDouble() ?? 0.0,
      laborCost: (map['laborCost'] as num?)?.toDouble() ?? 0.0,
      expectedRevenue: (map['expectedRevenue'] as num?)?.toDouble() ?? 0.0,
      actualSpent: (map['actualSpent'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}

// 10. Biosecurity Audit Model
class LocalBiosecurityAudit {
  final String id;
  final String farmName;
  final String auditType; // 'farm' or 'hatchery'
  final String managerName;
  final String location;
  final String inspectionTeam;
  final DateTime auditDate;
  final double overallScorePercent;
  final int passedItemsCount;
  final int totalItemsCount;
  final String riskLevel; // 'High Risk', 'Medium Risk', 'Low Risk'
  final Map<String, bool> auditChecklist;
  final Map<String, String> answersMap;
  final Map<String, String> remarksMap;
  final List<String> recommendations;

  LocalBiosecurityAudit({
    required this.id,
    required this.farmName,
    this.auditType = 'farm',
    this.managerName = '',
    this.location = '',
    this.inspectionTeam = '',
    required this.auditDate,
    required this.overallScorePercent,
    required this.passedItemsCount,
    required this.totalItemsCount,
    this.riskLevel = 'Low Risk',
    this.auditChecklist = const {},
    this.answersMap = const {},
    this.remarksMap = const {},
    this.recommendations = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'farmName': farmName,
      'auditType': auditType,
      'managerName': managerName,
      'location': location,
      'inspectionTeam': inspectionTeam,
      'auditDate': auditDate.toIso8601String(),
      'overallScorePercent': overallScorePercent,
      'passedItemsCount': passedItemsCount,
      'totalItemsCount': totalItemsCount,
      'riskLevel': riskLevel,
      'auditChecklist': jsonEncode(auditChecklist),
      'answersMap': jsonEncode(answersMap),
      'remarksMap': jsonEncode(remarksMap),
      'recommendations': jsonEncode(recommendations),
    };
  }

  factory LocalBiosecurityAudit.fromMap(Map<String, dynamic> map) {
    Map<String, bool> checklist = {};
    if (map['auditChecklist'] != null) {
      try {
        final decoded = jsonDecode(map['auditChecklist']);
        if (decoded is Map) {
          decoded.forEach((k, v) {
            checklist[k.toString()] = v == true;
          });
        }
      } catch (_) {}
    }

    Map<String, String> ansMap = {};
    if (map['answersMap'] != null) {
      try {
        final decoded = jsonDecode(map['answersMap']);
        if (decoded is Map) {
          decoded.forEach((k, v) {
            ansMap[k.toString()] = v.toString();
          });
        }
      } catch (_) {}
    }

    Map<String, String> remMap = {};
    if (map['remarksMap'] != null) {
      try {
        final decoded = jsonDecode(map['remarksMap']);
        if (decoded is Map) {
          decoded.forEach((k, v) {
            remMap[k.toString()] = v.toString();
          });
        }
      } catch (_) {}
    }

    List<String> recs = [];
    if (map['recommendations'] != null) {
      try {
        recs = List<String>.from(jsonDecode(map['recommendations']));
      } catch (_) {}
    }

    return LocalBiosecurityAudit(
      id: map['id'] ?? '',
      farmName: map['farmName'] ?? '',
      auditType: map['auditType'] ?? 'farm',
      managerName: map['managerName'] ?? '',
      location: map['location'] ?? '',
      inspectionTeam: map['inspectionTeam'] ?? '',
      auditDate: DateTime.tryParse(map['auditDate'] ?? '') ?? DateTime.now(),
      overallScorePercent: (map['overallScorePercent'] as num?)?.toDouble() ?? 0.0,
      passedItemsCount: (map['passedItemsCount'] as num?)?.toInt() ?? 0,
      totalItemsCount: (map['totalItemsCount'] as num?)?.toInt() ?? 0,
      riskLevel: map['riskLevel'] ?? 'Low Risk',
      auditChecklist: checklist,
      answersMap: ansMap,
      remarksMap: remMap,
      recommendations: recs,
    );
  }
}
