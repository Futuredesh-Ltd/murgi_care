import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/local_databank_models.dart';
import '../model/feed_standard_model.dart';
import '../services/local_databank_service.dart';

final localDataBankServiceProvider = Provider<LocalDataBankService>((ref) {
  return LocalDataBankService();
});

// ============================================================================
// 1. DATABANK HUB STATS PROVIDER
// ============================================================================
class DataBankHubState {
  final int flockCount;
  final int formulaCount;
  final int projectCount;
  final double lastAuditScore;
  final bool isLoading;
  final String searchQuery;

  DataBankHubState({
    this.flockCount = 0,
    this.formulaCount = 0,
    this.projectCount = 0,
    this.lastAuditScore = 0.0,
    this.isLoading = true,
    this.searchQuery = '',
  });

  DataBankHubState copyWith({
    int? flockCount,
    int? formulaCount,
    int? projectCount,
    double? lastAuditScore,
    bool? isLoading,
    String? searchQuery,
  }) {
    return DataBankHubState(
      flockCount: flockCount ?? this.flockCount,
      formulaCount: formulaCount ?? this.formulaCount,
      projectCount: projectCount ?? this.projectCount,
      lastAuditScore: lastAuditScore ?? this.lastAuditScore,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class DataBankHubNotifier extends StateNotifier<DataBankHubState> {
  final LocalDataBankService _service;

  DataBankHubNotifier(this._service) : super(DataBankHubState()) {
    loadHubStats();
  }

  Future<void> loadHubStats() async {
    state = state.copyWith(isLoading: true);
    final flocks = await _service.getFlocks();
    final formulas = await _service.getFeedFormulations();
    final projects = await _service.getInvestmentProjects();
    final audits = await _service.getBiosecurityAudits();

    state = state.copyWith(
      flockCount: flocks.length,
      formulaCount: formulas.length,
      projectCount: projects.length,
      lastAuditScore: audits.isNotEmpty ? audits.first.overallScorePercent : 0.0,
      isLoading: false,
    );
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }
}

final dataBankHubProvider = StateNotifierProvider<DataBankHubNotifier, DataBankHubState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return DataBankHubNotifier(service);
});

// ============================================================================
// 2. FLOCK DATA MANAGEMENT PROVIDER
// ============================================================================
class FlockManagementState {
  final List<LocalFlock> flocks;
  final LocalFlock? selectedFlock;
  final List<LocalDailyRecord> records;
  final bool isLoading;

  FlockManagementState({
    this.flocks = const [],
    this.selectedFlock,
    this.records = const [],
    this.isLoading = true,
  });

  FlockManagementState copyWith({
    List<LocalFlock>? flocks,
    LocalFlock? selectedFlock,
    List<LocalDailyRecord>? records,
    bool? isLoading,
    bool clearSelectedFlock = false,
  }) {
    return FlockManagementState(
      flocks: flocks ?? this.flocks,
      selectedFlock: clearSelectedFlock ? null : (selectedFlock ?? this.selectedFlock),
      records: records ?? this.records,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class FlockManagementNotifier extends StateNotifier<FlockManagementState> {
  final LocalDataBankService _service;

  FlockManagementNotifier(this._service) : super(FlockManagementState()) {
    loadFlocks();
  }

  Future<void> loadFlocks() async {
    state = state.copyWith(isLoading: true);
    final flocks = await _service.getFlocks();
    LocalFlock? sel = state.selectedFlock;
    if (flocks.isNotEmpty) {
      if (sel == null || !flocks.any((f) => f.id == sel?.id)) {
        sel = flocks.first;
      } else {
        sel = flocks.firstWhere((f) => f.id == sel?.id);
      }
    } else {
      sel = null;
    }

    state = state.copyWith(flocks: flocks, selectedFlock: sel, isLoading: false);
    if (sel != null) {
      loadRecords(sel.id);
    }
  }

  void selectFlock(LocalFlock flock) {
    state = state.copyWith(selectedFlock: flock);
    loadRecords(flock.id);
  }

  Future<void> loadRecords(String flockId) async {
    final recs = await _service.getDailyRecords(flockId);
    state = state.copyWith(records: recs);
  }

  Future<void> addFlock(LocalFlock flock) async {
    await _service.insertFlock(flock);
    await loadFlocks();
  }

  Future<void> addRecord(LocalDailyRecord record) async {
    await _service.insertDailyRecord(record);
    if (state.selectedFlock != null) {
      await loadRecords(state.selectedFlock!.id);
    }
  }

  Future<void> deleteRecord(String recordId) async {
    await _service.deleteDailyRecord(recordId);
    if (state.selectedFlock != null) {
      await loadRecords(state.selectedFlock!.id);
    }
  }
}

final flockManagementProvider = StateNotifierProvider<FlockManagementNotifier, FlockManagementState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return FlockManagementNotifier(service);
});

// ============================================================================
// 3. VACCINATION SCHEDULE PROVIDER
// ============================================================================
class VaccineScheduleState {
  final List<LocalFlock> flocks;
  final LocalFlock? selectedFlock;
  final List<LocalVaccineSchedule> schedules;
  final bool isLoading;
  final DateTime selectedDate;
  final DateTime calendarFocusedMonth;

  VaccineScheduleState({
    this.flocks = const [],
    this.selectedFlock,
    this.schedules = const [],
    this.isLoading = true,
    DateTime? selectedDate,
    DateTime? calendarFocusedMonth,
  })  : selectedDate = selectedDate ?? DateTime.now(),
        calendarFocusedMonth = calendarFocusedMonth ?? DateTime.now();

  VaccineScheduleState copyWith({
    List<LocalFlock>? flocks,
    LocalFlock? selectedFlock,
    List<LocalVaccineSchedule>? schedules,
    bool? isLoading,
    DateTime? selectedDate,
    DateTime? calendarFocusedMonth,
  }) {
    return VaccineScheduleState(
      flocks: flocks ?? this.flocks,
      selectedFlock: selectedFlock ?? this.selectedFlock,
      schedules: schedules ?? this.schedules,
      isLoading: isLoading ?? this.isLoading,
      selectedDate: selectedDate ?? this.selectedDate,
      calendarFocusedMonth: calendarFocusedMonth ?? this.calendarFocusedMonth,
    );
  }
}

class VaccineScheduleNotifier extends StateNotifier<VaccineScheduleState> {
  final LocalDataBankService _service;

  VaccineScheduleNotifier(this._service) : super(VaccineScheduleState()) {
    loadFlocks();
  }

  Future<void> loadFlocks() async {
    state = state.copyWith(isLoading: true);
    final flocks = await _service.getFlocks();
    LocalFlock? sel = state.selectedFlock ?? (flocks.isNotEmpty ? flocks.first : null);
    state = state.copyWith(flocks: flocks, selectedFlock: sel, isLoading: false);
    if (sel != null) {
      loadSchedules(sel.id);
    }
  }

  void selectFlock(LocalFlock flock) {
    state = state.copyWith(
      selectedFlock: flock,
      calendarFocusedMonth: flock.startDate,
      selectedDate: flock.startDate,
    );
    loadSchedules(flock.id);
  }

  void setSelectedDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void setCalendarFocusedMonth(DateTime month) {
    state = state.copyWith(calendarFocusedMonth: month);
  }

  Future<void> loadSchedules(String flockId) async {
    final scheds = await _service.getVaccineSchedules(flockId);
    state = state.copyWith(schedules: scheds);
  }

  Future<void> addSchedule(LocalVaccineSchedule sched) async {
    await _service.insertVaccineSchedule(sched);
    if (state.selectedFlock != null) {
      await loadSchedules(state.selectedFlock!.id);
    }
  }

  Future<void> updateStatus(String id, String status) async {
    await _service.updateVaccineStatus(id, status);
    if (state.selectedFlock != null) {
      await loadSchedules(state.selectedFlock!.id);
    }
  }

  Future<void> deleteSchedule(String id) async {
    await _service.deleteVaccineSchedule(id);
    if (state.selectedFlock != null) {
      await loadSchedules(state.selectedFlock!.id);
    }
  }

  Future<void> loadDemoSchedules(bool isEng) async {
    if (state.selectedFlock == null) return;
    final flock = state.selectedFlock!;

    final demoItems = [
      LocalVaccineSchedule(
        id: "${DateTime.now().millisecondsSinceEpoch}_1",
        flockId: flock.id,
        vaccineName: "Marek's Vaccine (HVT)",
        diseaseName: isEng ? "Marek's Disease" : "মারেক্স রোগ",
        targetAgeDays: 1,
        scheduledDate: flock.startDate.add(const Duration(days: 1)),
        status: 'completed',
        notes: isEng ? "Subcutaneous at hatchery" : "হ্যাচারিতে চামড়ার নিচে ইনজেকশন",
      ),
      LocalVaccineSchedule(
        id: "${DateTime.now().millisecondsSinceEpoch}_2",
        flockId: flock.id,
        vaccineName: "ND + IB (Ranikhet & Bronchitis)",
        diseaseName: isEng ? "Ranikhet & Infectious Bronchitis" : "রাণীকেত ও শ্বাসনালীর প্রদাহ",
        targetAgeDays: 5,
        scheduledDate: flock.startDate.add(const Duration(days: 5)),
        status: 'completed',
        notes: isEng ? "Eye drop method" : "চোখে ড্রপ দিন",
      ),
      LocalVaccineSchedule(
        id: "${DateTime.now().millisecondsSinceEpoch}_3",
        flockId: flock.id,
        vaccineName: "Gumboro (IBD Intermediate)",
        diseaseName: isEng ? "Gumboro Disease" : "গামবোরো রোগ",
        targetAgeDays: 12,
        scheduledDate: flock.startDate.add(const Duration(days: 12)),
        status: 'pending',
        notes: isEng ? "Drinking water method" : "খাবার পানিতে দিন",
      ),
      LocalVaccineSchedule(
        id: "${DateTime.now().millisecondsSinceEpoch}_4",
        flockId: flock.id,
        vaccineName: "Gumboro Booster",
        diseaseName: isEng ? "Gumboro Booster" : "গামবোরো বুস্টার",
        targetAgeDays: 19,
        scheduledDate: flock.startDate.add(const Duration(days: 19)),
        status: 'pending',
        notes: isEng ? "Drinking water with skimmed milk" : "ননীহীন দুধ মেশানো পানিতে",
      ),
      LocalVaccineSchedule(
        id: "${DateTime.now().millisecondsSinceEpoch}_5",
        flockId: flock.id,
        vaccineName: "ND Lasota Booster",
        diseaseName: isEng ? "Ranikhet Booster" : "রাণীকেত বুস্টার",
        targetAgeDays: 24,
        scheduledDate: flock.startDate.add(const Duration(days: 24)),
        status: 'pending',
        notes: isEng ? "Drinking water method" : "খাবার পানিতে দিন",
      ),
    ];

    for (var item in demoItems) {
      await _service.insertVaccineSchedule(item);
    }
    await loadSchedules(flock.id);
  }
}

final vaccineScheduleProvider = StateNotifierProvider<VaccineScheduleNotifier, VaccineScheduleState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return VaccineScheduleNotifier(service);
});

// ============================================================================
// 4. LAB REPORT PROVIDER
// ============================================================================
class LabReportState {
  final List<LocalFlock> flocks;
  final LocalFlock? selectedFlock;
  final List<LocalLabReport> reports;
  final bool isLoading;

  LabReportState({
    this.flocks = const [],
    this.selectedFlock,
    this.reports = const [],
    this.isLoading = true,
  });

  LabReportState copyWith({
    List<LocalFlock>? flocks,
    LocalFlock? selectedFlock,
    List<LocalLabReport>? reports,
    bool? isLoading,
  }) {
    return LabReportState(
      flocks: flocks ?? this.flocks,
      selectedFlock: selectedFlock ?? this.selectedFlock,
      reports: reports ?? this.reports,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LabReportNotifier extends StateNotifier<LabReportState> {
  final LocalDataBankService _service;

  LabReportNotifier(this._service) : super(LabReportState()) {
    loadFlocks();
  }

  Future<void> loadFlocks() async {
    state = state.copyWith(isLoading: true);
    final flocks = await _service.getFlocks();
    LocalFlock? sel = state.selectedFlock ?? (flocks.isNotEmpty ? flocks.first : null);
    state = state.copyWith(flocks: flocks, selectedFlock: sel, isLoading: false);
    if (sel != null) {
      loadReports(sel.id);
    }
  }

  void selectFlock(LocalFlock flock) {
    state = state.copyWith(selectedFlock: flock);
    loadReports(flock.id);
  }

  Future<void> loadReports(String flockId) async {
    final reps = await _service.getLabReports(flockId);
    state = state.copyWith(reports: reps);
  }

  Future<void> addReport(LocalLabReport report) async {
    await _service.insertLabReport(report);
    if (state.selectedFlock != null) {
      await loadReports(state.selectedFlock!.id);
    }
  }

  Future<void> addReportWithPhotos(LocalLabReport report, List<File> imageFiles) async {
    state = state.copyWith(isLoading: true);
    await _service.syncLabReportToFirestore(report: report, imageFiles: imageFiles);
    if (state.selectedFlock != null) {
      await loadReports(state.selectedFlock!.id);
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> deleteReport(String id) async {
    await _service.deleteLabReport(id);
    if (state.selectedFlock != null) {
      await loadReports(state.selectedFlock!.id);
    }
  }
}

final labReportProvider = StateNotifierProvider<LabReportNotifier, LabReportState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return LabReportNotifier(service);
});

// ============================================================================
// 5. DISEASE IDENTIFICATION PROVIDER
// ============================================================================
class DiseaseIdentificationState {
  final List<LocalFlock> flocks;
  final LocalFlock? selectedFlock;
  final Map<String, bool> selectedSymptoms;
  final List<LocalDiseaseLog> logs;
  final bool isLoading;

  DiseaseIdentificationState({
    this.flocks = const [],
    this.selectedFlock,
    this.selectedSymptoms = const {
      'gasping': false,
      'green_poop': false,
      'bloody_poop': false,
      'droopy': false,
      'comb_dark': false,
      'paralysis': false,
      'swollen_face': false,
      'high_mortality': false,
    },
    this.logs = const [],
    this.isLoading = true,
  });

  DiseaseIdentificationState copyWith({
    List<LocalFlock>? flocks,
    LocalFlock? selectedFlock,
    Map<String, bool>? selectedSymptoms,
    List<LocalDiseaseLog>? logs,
    bool? isLoading,
  }) {
    return DiseaseIdentificationState(
      flocks: flocks ?? this.flocks,
      selectedFlock: selectedFlock ?? this.selectedFlock,
      selectedSymptoms: selectedSymptoms ?? this.selectedSymptoms,
      logs: logs ?? this.logs,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class DiseaseIdentificationNotifier extends StateNotifier<DiseaseIdentificationState> {
  final LocalDataBankService _service;

  DiseaseIdentificationNotifier(this._service) : super(DiseaseIdentificationState()) {
    loadFlocks();
  }

  Future<void> loadFlocks() async {
    state = state.copyWith(isLoading: true);
    final flocks = await _service.getFlocks();
    LocalFlock? sel = state.selectedFlock ?? (flocks.isNotEmpty ? flocks.first : null);
    state = state.copyWith(flocks: flocks, selectedFlock: sel, isLoading: false);
    if (sel != null) {
      loadLogs(sel.id);
    }
  }

  void selectFlock(LocalFlock flock) {
    state = state.copyWith(selectedFlock: flock);
    loadLogs(flock.id);
  }

  void toggleSymptom(String key, bool val) {
    final updated = Map<String, bool>.from(state.selectedSymptoms);
    updated[key] = val;
    state = state.copyWith(selectedSymptoms: updated);
  }

  Future<void> loadLogs(String flockId) async {
    final logs = await _service.getDiseaseLogs(flockId);
    state = state.copyWith(logs: logs);
  }

  Future<void> addLog(LocalDiseaseLog log) async {
    await _service.insertDiseaseLog(log);
    if (state.selectedFlock != null) {
      await loadLogs(state.selectedFlock!.id);
    }
  }

  Future<void> addLogWithPhotos(LocalDiseaseLog log, List<File> imageFiles) async {
    state = state.copyWith(isLoading: true);
    await _service.syncDiseaseLogToFirestore(log: log, imageFiles: imageFiles);
    if (state.selectedFlock != null) {
      await loadLogs(state.selectedFlock!.id);
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> deleteLog(String id) async {
    await _service.deleteDiseaseLog(id);
    if (state.selectedFlock != null) {
      await loadLogs(state.selectedFlock!.id);
    }
  }
}

final diseaseIdentificationProvider =
    StateNotifierProvider<DiseaseIdentificationNotifier, DiseaseIdentificationState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return DiseaseIdentificationNotifier(service);
});

// ============================================================================
// 6. BREEDER MONITOR PROVIDER
// ============================================================================
class BreederMonitorState {
  final List<LocalFlock> flocks;
  final LocalFlock? selectedFlock;
  final List<LocalBreederLog> logs;
  final bool isLoading;

  BreederMonitorState({
    this.flocks = const [],
    this.selectedFlock,
    this.logs = const [],
    this.isLoading = true,
  });

  BreederMonitorState copyWith({
    List<LocalFlock>? flocks,
    LocalFlock? selectedFlock,
    List<LocalBreederLog>? logs,
    bool? isLoading,
  }) {
    return BreederMonitorState(
      flocks: flocks ?? this.flocks,
      selectedFlock: selectedFlock ?? this.selectedFlock,
      logs: logs ?? this.logs,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class BreederMonitorNotifier extends StateNotifier<BreederMonitorState> {
  final LocalDataBankService _service;

  BreederMonitorNotifier(this._service) : super(BreederMonitorState()) {
    loadFlocks();
  }

  Future<void> loadFlocks() async {
    state = state.copyWith(isLoading: true);
    final flocks = await _service.getFlocks();
    LocalFlock? sel = state.selectedFlock ?? (flocks.isNotEmpty ? flocks.first : null);
    state = state.copyWith(flocks: flocks, selectedFlock: sel, isLoading: false);
    if (sel != null) {
      loadLogs(sel.id);
    }
  }

  void selectFlock(LocalFlock flock) {
    state = state.copyWith(selectedFlock: flock);
    loadLogs(flock.id);
  }

  Future<void> addFlock(LocalFlock flock) async {
    await _service.insertFlock(flock);
    await loadFlocks();
    selectFlock(flock);
  }

  Future<void> loadLogs(String flockId) async {
    final logs = await _service.getBreederLogs(flockId);
    state = state.copyWith(logs: logs);
  }

  Future<void> addLog(LocalBreederLog log) async {
    await _service.insertBreederLog(log);
    if (state.selectedFlock != null) {
      await loadLogs(state.selectedFlock!.id);
    }
  }

  Future<void> deleteLog(String id) async {
    await _service.deleteBreederLog(id);
    if (state.selectedFlock != null) {
      await loadLogs(state.selectedFlock!.id);
    }
  }

  // Instance Target & Stage Helpers
  double getFemaleTargetWeight(int week) => calculateFemaleTargetWeight(week);
  double getMaleTargetWeight(int week) => calculateMaleTargetWeight(week);
  String getStageName(int week, bool isMale) => calculateStageName(week, isMale);

  // Target Body Weight Standards (Grams) by Week
  static double calculateFemaleTargetWeight(int week) {
    if (week <= 1) return 120.0;
    if (week == 2) return 200.0;
    if (week == 3) return 290.0;
    if (week == 4) return 390.0;
    if (week <= 10) return 390.0 + (week - 4) * 110.0;
    if (week <= 18) return 1050.0 + (week - 10) * 80.0;
    if (week <= 30) return 1690.0 + (week - 18) * 30.0;
    return 2050.0;
  }

  static double calculateMaleTargetWeight(int week) {
    if (week <= 1) return 135.0;
    if (week == 2) return 230.0;
    if (week == 3) return 350.0;
    if (week == 4) return 490.0;
    if (week <= 10) return 490.0 + (week - 4) * 140.0;
    if (week <= 18) return 1330.0 + (week - 10) * 110.0;
    if (week <= 30) return 2210.0 + (week - 18) * 40.0;
    return 2700.0;
  }

  static String calculateStageName(int week, bool isMale) {
    if (week <= 4) {
      return isMale ? "Starter Male" : "Starter";
    } else if (week <= 18) {
      return isMale ? "Grower Male" : "Grower";
    } else {
      return isMale ? "Breeder Male" : "Laying Breeder";
    }
  }
}

// Top level helper functions for Breeder Monitor
double getBreederFemaleTargetWeight(int week) => BreederMonitorNotifier.calculateFemaleTargetWeight(week);
double getBreederMaleTargetWeight(int week) => BreederMonitorNotifier.calculateMaleTargetWeight(week);
String getBreederStageName(int week, bool isMale) => BreederMonitorNotifier.calculateStageName(week, isMale);

final breederMonitorProvider = StateNotifierProvider<BreederMonitorNotifier, BreederMonitorState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return BreederMonitorNotifier(service);
});

// ============================================================================
// 7. FEED FORMULATION PROVIDER
// ============================================================================
class FeedFormulationState {
  final FeedTypeStandard selectedFeedType;
  final String formulaName;
  final Map<String, double> ingredientWeights;
  final List<LocalFeedFormulation> formulations;
  final List<FeedIngredient> allIngredients;
  final bool isLoading;
  final String searchQuery;
  final String standardsSearchQuery;
  final int selectedTabIndex; // 0: Select Feed Type, 1: Create Formula, 2: Nutrient Standards, 3: Saved Formulas

  FeedFormulationState({
    FeedTypeStandard? selectedFeedType,
    this.formulaName = 'Layer Pre-Layer Feed Formula',
    this.ingredientWeights = const {
      'Soybean Oil': 4.0,
      'Soybean Meal': 21.0,
      'DL-Methionine': 0.19,
      'Maize (Yellow Corn)': 55.0,
      'Rice Polish': 12.0,
      'DCP': 2.0,
      'Limestone': 5.0,
      'Salt': 0.3,
      'Premix': 0.5,
    },
    this.formulations = const [],
    List<FeedIngredient>? allIngredients,
    this.isLoading = true,
    this.searchQuery = '',
    this.standardsSearchQuery = '',
    this.selectedTabIndex = 0,
  })  : selectedFeedType = selectedFeedType ?? allFeedTypeStandards[11], // Layer / Layer / Pre-Layer
        allIngredients = allIngredients ?? defaultFeedIngredients;

  FeedFormulationState copyWith({
    FeedTypeStandard? selectedFeedType,
    String? formulaName,
    Map<String, double>? ingredientWeights,
    List<LocalFeedFormulation>? formulations,
    List<FeedIngredient>? allIngredients,
    bool? isLoading,
    String? searchQuery,
    String? standardsSearchQuery,
    int? selectedTabIndex,
  }) {
    return FeedFormulationState(
      selectedFeedType: selectedFeedType ?? this.selectedFeedType,
      formulaName: formulaName ?? this.formulaName,
      ingredientWeights: ingredientWeights ?? this.ingredientWeights,
      formulations: formulations ?? this.formulations,
      allIngredients: allIngredients ?? this.allIngredients,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
      standardsSearchQuery: standardsSearchQuery ?? this.standardsSearchQuery,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  // Helper to find ingredient definition
  FeedIngredient findIngredient(String name) {
    return allIngredients.firstWhere(
      (i) => i.name == name,
      orElse: () => FeedIngredient(name: name, cp: 0, me: 0, pricePerKg: 0),
    );
  }

  // --- Nutrient Calculations ---
  double get totalWeight {
    double total = 0.0;
    ingredientWeights.forEach((_, w) => total += w);
    return total;
  }

  double get calculatedCP {
    final tw = totalWeight;
    if (tw == 0) return 0.0;
    double cpSum = 0.0;
    ingredientWeights.forEach((name, w) {
      final ing = findIngredient(name);
      cpSum += (w * ing.cp);
    });
    return cpSum / tw;
  }

  double get calculatedME {
    final tw = totalWeight;
    if (tw == 0) return 0.0;
    double meSum = 0.0;
    ingredientWeights.forEach((name, w) {
      final ing = findIngredient(name);
      meSum += (w * ing.me);
    });
    return meSum / tw;
  }

  double get calculatedCa {
    final tw = totalWeight;
    if (tw == 0) return 0.0;
    double caSum = 0.0;
    ingredientWeights.forEach((name, w) {
      final ing = findIngredient(name);
      caSum += (w * ing.ca);
    });
    return caSum / tw;
  }

  double get calculatedAvP {
    final tw = totalWeight;
    if (tw == 0) return 0.0;
    double avpSum = 0.0;
    ingredientWeights.forEach((name, w) {
      final ing = findIngredient(name);
      avpSum += (w * ing.avP);
    });
    return avpSum / tw;
  }

  double get calculatedLys {
    final tw = totalWeight;
    if (tw == 0) return 0.0;
    double lysSum = 0.0;
    ingredientWeights.forEach((name, w) {
      final ing = findIngredient(name);
      lysSum += (w * ing.lys);
    });
    return lysSum / tw;
  }

  double get costPerKg {
    final tw = totalWeight;
    if (tw == 0) return 0.0;
    double costSum = 0.0;
    ingredientWeights.forEach((name, w) {
      final ing = findIngredient(name);
      costSum += (w * ing.pricePerKg);
    });
    return costSum / tw;
  }
}

class FeedFormulationNotifier extends StateNotifier<FeedFormulationState> {
  final LocalDataBankService _service;

  FeedFormulationNotifier(this._service) : super(FeedFormulationState()) {
    initData();
  }

  Future<void> initData() async {
    state = state.copyWith(isLoading: true);
    await loadFormulations();
    await loadIngredients();
    state = state.copyWith(isLoading: false);
  }

  Future<void> loadFormulations() async {
    final list = await _service.getFeedFormulations();
    state = state.copyWith(formulations: list);
  }

  Future<void> loadIngredients() async {
    final customList = await _service.getCustomIngredients();
    // Merge defaults with custom ingredients
    final merged = List<FeedIngredient>.from(defaultFeedIngredients);
    for (var custom in customList) {
      final idx = merged.indexWhere((i) => i.name == custom.name);
      if (idx >= 0) {
        merged[idx] = custom;
      } else {
        merged.add(custom);
      }
    }
    state = state.copyWith(allIngredients: merged);
  }

  Future<void> saveCustomIngredient(FeedIngredient item) async {
    await _service.insertCustomIngredient(item);
    await loadIngredients();
  }

  Future<void> deleteCustomIngredient(String id) async {
    await _service.deleteCustomIngredient(id);
    await loadIngredients();
  }

  void selectFeedType(FeedTypeStandard feedType) {
    state = state.copyWith(
      selectedFeedType: feedType,
      formulaName: "${feedType.displayName} Formula",
      selectedTabIndex: 1, // Jump straight to Create Formula tab!
    );
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setStandardsSearchQuery(String query) {
    state = state.copyWith(standardsSearchQuery: query);
  }

  void setSelectedTabIndex(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void setFormulaName(String name) {
    state = state.copyWith(formulaName: name);
  }

  void addIngredient(String name, double weight) {
    final updated = Map<String, double>.from(state.ingredientWeights);
    updated[name] = weight;
    state = state.copyWith(ingredientWeights: updated);
  }

  void removeIngredient(String name) {
    final updated = Map<String, double>.from(state.ingredientWeights);
    updated.remove(name);
    state = state.copyWith(ingredientWeights: updated);
  }

  void updateIngredientWeight(String ingredient, double weight) {
    final updated = Map<String, double>.from(state.ingredientWeights);
    updated[ingredient] = weight;
    state = state.copyWith(ingredientWeights: updated);
  }

  // Quick Action 1: Scale batch to 100 kg proportionally
  void scaleTo100Kg() {
    final currentTotal = state.totalWeight;
    if (currentTotal == 0 || currentTotal == 100.0) return;
    final scaleFactor = 100.0 / currentTotal;
    final updated = <String, double>{};
    state.ingredientWeights.forEach((name, weight) {
      updated[name] = double.parse((weight * scaleFactor).toStringAsFixed(2));
    });
    state = state.copyWith(ingredientWeights: updated);
  }

  // Quick Action 2: Auto-rebalance formula towards target CP and ME
  void rebalanceFormula() {
    scaleTo100Kg(); // First ensure total is 100kg
    final targetCP = state.selectedFeedType.targetCP;
    final currentCP = state.calculatedCP;

    if ((currentCP - targetCP).abs() < 0.2) return;

    final updated = Map<String, double>.from(state.ingredientWeights);
    final corn = updated.containsKey('Maize (Yellow Corn)') ? 'Maize (Yellow Corn)' : updated.keys.first;
    final soy = updated.containsKey('Soybean Meal') ? 'Soybean Meal' : updated.keys.elementAt(1);

    if (currentCP < targetCP) {
      // Increase Soybean Meal (+2kg) and decrease Maize (-2kg)
      final shift = (targetCP - currentCP) * 2.5;
      if ((updated[corn] ?? 0) > shift) {
        updated[soy] = (updated[soy] ?? 0) + shift;
        updated[corn] = (updated[corn] ?? 0) - shift;
      }
    } else {
      // Decrease Soybean Meal and increase Maize
      final shift = (currentCP - targetCP) * 2.5;
      if ((updated[soy] ?? 0) > shift) {
        updated[soy] = (updated[soy] ?? 0) - shift;
        updated[corn] = (updated[corn] ?? 0) + shift;
      }
    }

    state = state.copyWith(ingredientWeights: updated);
  }

  Future<void> saveFormulation(LocalFeedFormulation formulation) async {
    await _service.insertFeedFormulation(formulation);
    await loadFormulations();
  }

  Future<void> deleteFormulation(String id) async {
    await _service.deleteFeedFormulation(id);
    await loadFormulations();
  }
}

final feedFormulationProvider = StateNotifierProvider<FeedFormulationNotifier, FeedFormulationState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return FeedFormulationNotifier(service);
});

// ============================================================================
// 8. MOLTING MONITOR PROVIDER
// ============================================================================
class MoltingMonitorState {
  final List<LocalFlock> flocks;
  final LocalFlock? selectedFlock;
  final List<LocalMoltingRecord> records;
  final bool isLoading;

  MoltingMonitorState({
    this.flocks = const [],
    this.selectedFlock,
    this.records = const [],
    this.isLoading = true,
  });

  MoltingMonitorState copyWith({
    List<LocalFlock>? flocks,
    LocalFlock? selectedFlock,
    List<LocalMoltingRecord>? records,
    bool? isLoading,
  }) {
    return MoltingMonitorState(
      flocks: flocks ?? this.flocks,
      selectedFlock: selectedFlock ?? this.selectedFlock,
      records: records ?? this.records,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class MoltingMonitorNotifier extends StateNotifier<MoltingMonitorState> {
  final LocalDataBankService _service;

  MoltingMonitorNotifier(this._service) : super(MoltingMonitorState()) {
    loadFlocks();
  }

  Future<void> loadFlocks() async {
    state = state.copyWith(isLoading: true);
    final flocks = await _service.getFlocks();
    LocalFlock? sel = state.selectedFlock ?? (flocks.isNotEmpty ? flocks.first : null);
    state = state.copyWith(flocks: flocks, selectedFlock: sel, isLoading: false);
    if (sel != null) {
      loadRecords(sel.id);
    }
  }

  void selectFlock(LocalFlock flock) {
    state = state.copyWith(selectedFlock: flock);
    loadRecords(flock.id);
  }

  Future<void> loadRecords(String flockId) async {
    final list = await _service.getMoltingRecords(flockId);
    state = state.copyWith(records: list);
  }

  Future<void> addRecord(LocalMoltingRecord record) async {
    await _service.insertMoltingRecord(record);
    if (state.selectedFlock != null) {
      await loadRecords(state.selectedFlock!.id);
    }
  }

  Future<void> deleteRecord(String id) async {
    await _service.deleteMoltingRecord(id);
    if (state.selectedFlock != null) {
      await loadRecords(state.selectedFlock!.id);
    }
  }
}

final moltingMonitorProvider = StateNotifierProvider<MoltingMonitorNotifier, MoltingMonitorState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return MoltingMonitorNotifier(service);
});

// ============================================================================
// 9. INVESTMENT CALCULATOR PROVIDER
// ============================================================================
class InvestmentCalculatorState {
  final String projectName;
  final String location;
  final double shedCost;
  final double chickCost;
  final double feedBudget;
  final double medicineBudget;
  final double laborCost;
  final double expectedRevenue;
  final List<LocalInvestmentProject> projects;
  final bool isLoading;

  InvestmentCalculatorState({
    this.projectName = "500 Broiler Project Plan",
    this.location = "Farm House #1",
    this.shedCost = 150000,
    this.chickCost = 30000,
    this.feedBudget = 120000,
    this.medicineBudget = 15000,
    this.laborCost = 10000,
    this.expectedRevenue = 380000,
    this.projects = const [],
    this.isLoading = true,
  });

  InvestmentCalculatorState copyWith({
    String? projectName,
    String? location,
    double? shedCost,
    double? chickCost,
    double? feedBudget,
    double? medicineBudget,
    double? laborCost,
    double? expectedRevenue,
    List<LocalInvestmentProject>? projects,
    bool? isLoading,
  }) {
    return InvestmentCalculatorState(
      projectName: projectName ?? this.projectName,
      location: location ?? this.location,
      shedCost: shedCost ?? this.shedCost,
      chickCost: chickCost ?? this.chickCost,
      feedBudget: feedBudget ?? this.feedBudget,
      medicineBudget: medicineBudget ?? this.medicineBudget,
      laborCost: laborCost ?? this.laborCost,
      expectedRevenue: expectedRevenue ?? this.expectedRevenue,
      projects: projects ?? this.projects,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class InvestmentCalculatorNotifier extends StateNotifier<InvestmentCalculatorState> {
  final LocalDataBankService _service;

  InvestmentCalculatorNotifier(this._service) : super(InvestmentCalculatorState()) {
    loadProjects();
  }

  Future<void> loadProjects() async {
    state = state.copyWith(isLoading: true);
    final list = await _service.getInvestmentProjects();
    state = state.copyWith(projects: list, isLoading: false);
  }

  void updateFields({
    String? name,
    String? loc,
    double? shed,
    double? chick,
    double? feed,
    double? med,
    double? labor,
    double? rev,
  }) {
    state = state.copyWith(
      projectName: name ?? state.projectName,
      location: loc ?? state.location,
      shedCost: shed ?? state.shedCost,
      chickCost: chick ?? state.chickCost,
      feedBudget: feed ?? state.feedBudget,
      medicineBudget: med ?? state.medicineBudget,
      laborCost: labor ?? state.laborCost,
      expectedRevenue: rev ?? state.expectedRevenue,
    );
  }

  Future<void> saveProject(LocalInvestmentProject project) async {
    await _service.insertInvestmentProject(project);
    await loadProjects();
  }

  Future<void> deleteProject(String id) async {
    await _service.deleteInvestmentProject(id);
    await loadProjects();
  }
}

final investmentCalculatorProvider =
    StateNotifierProvider<InvestmentCalculatorNotifier, InvestmentCalculatorState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return InvestmentCalculatorNotifier(service);
});

// ============================================================================
// 10. BIOSECURITY AUDIT PROVIDER
// ============================================================================
class BiosecurityAuditState {
  final String farmName;
  final Map<String, bool> answers;
  final List<LocalBiosecurityAudit> audits;
  final bool isLoading;

  BiosecurityAuditState({
    this.farmName = "My Green Poultry Farm",
    this.answers = const {
      'fencing': false,
      'footbath': false,
      'vehicle': false,
      'visitor': false,
      'water': false,
      'mesh': false,
      'dead_bird': false,
      'litter': false,
      'feed_store': false,
      'all_in_out': false,
    },
    this.audits = const [],
    this.isLoading = true,
  });

  BiosecurityAuditState copyWith({
    String? farmName,
    Map<String, bool>? answers,
    List<LocalBiosecurityAudit>? audits,
    bool? isLoading,
  }) {
    return BiosecurityAuditState(
      farmName: farmName ?? this.farmName,
      answers: answers ?? this.answers,
      audits: audits ?? this.audits,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class BiosecurityAuditNotifier extends StateNotifier<BiosecurityAuditState> {
  final LocalDataBankService _service;

  BiosecurityAuditNotifier(this._service) : super(BiosecurityAuditState()) {
    loadAudits();
  }

  Future<void> loadAudits() async {
    state = state.copyWith(isLoading: true);
    final list = await _service.getBiosecurityAudits();
    state = state.copyWith(audits: list, isLoading: false);
  }

  void setFarmName(String name) {
    state = state.copyWith(farmName: name);
  }

  void toggleAnswer(String key, bool val) {
    final updated = Map<String, bool>.from(state.answers);
    updated[key] = val;
    state = state.copyWith(answers: updated);
  }

  Future<void> saveAudit(LocalBiosecurityAudit audit) async {
    await _service.insertBiosecurityAudit(audit);
    await loadAudits();
  }

  Future<void> deleteAudit(String id) async {
    await _service.deleteBiosecurityAudit(id);
    await loadAudits();
  }
}

final biosecurityAuditProvider = StateNotifierProvider<BiosecurityAuditNotifier, BiosecurityAuditState>((ref) {
  final service = ref.watch(localDataBankServiceProvider);
  return BiosecurityAuditNotifier(service);
});
