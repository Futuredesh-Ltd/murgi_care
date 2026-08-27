import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controller.dart';
import '../model/databank_model.dart';

// 1. DiseaseProvider Riverpod Bridge
final diseaseRiverpodProvider = ChangeNotifierProvider<DiseaseProvider>((ref) {
  return DiseaseProvider();
});

// 2. Navigation State for Home & Drawer
class NavigationState {
  final int currentIndex;
  final int homeSubTabIndex;

  NavigationState({
    this.currentIndex = 0,
    this.homeSubTabIndex = 0,
  });

  NavigationState copyWith({
    int? currentIndex,
    int? homeSubTabIndex,
  }) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      homeSubTabIndex: homeSubTabIndex ?? this.homeSubTabIndex,
    );
  }
}

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(NavigationState());

  void selectTab(int mainIndex, {int? homeSubTabIndex}) {
    state = state.copyWith(
      currentIndex: mainIndex,
      homeSubTabIndex: homeSubTabIndex ?? state.homeSubTabIndex,
    );
  }

  void setHomeSubTab(int subIndex) {
    state = state.copyWith(homeSubTabIndex: subIndex);
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationState>((ref) {
  return NavigationNotifier();
});

// 3. SearchTab State
class SearchTabState {
  final String searchQuery;
  final String? selectedCategory;

  SearchTabState({
    this.searchQuery = '',
    this.selectedCategory,
  });

  SearchTabState copyWith({
    String? searchQuery,
    String? selectedCategory,
    bool clearCategory = false,
  }) {
    return SearchTabState(
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory:
          clearCategory ? null : (selectedCategory ?? this.selectedCategory),
    );
  }
}

class SearchTabNotifier extends StateNotifier<SearchTabState> {
  SearchTabNotifier() : super(SearchTabState());

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void selectCategory(String? category) {
    if (state.selectedCategory == category) {
      state = state.copyWith(clearCategory: true);
    } else {
      state = state.copyWith(selectedCategory: category);
    }
  }

  void clearCategory() {
    state = state.copyWith(clearCategory: true);
  }
}

final searchTabProvider =
    StateNotifierProvider<SearchTabNotifier, SearchTabState>((ref) {
  return SearchTabNotifier();
});

// 4. DoctorsTab Search State
class DoctorsTabNotifier extends StateNotifier<String> {
  DoctorsTabNotifier() : super('');

  void setSearchQuery(String query) {
    state = query;
  }
}

final doctorsTabProvider =
    StateNotifierProvider<DoctorsTabNotifier, String>((ref) {
  return DoctorsTabNotifier();
});

// 5. DataBank Tab State
class DataBankState {
  final int selectedTabIndex;
  final String? selectedBatch;

  DataBankState({
    this.selectedTabIndex = 0,
    this.selectedBatch,
  });

  DataBankState copyWith({
    int? selectedTabIndex,
    String? selectedBatch,
    bool clearBatch = false,
  }) {
    return DataBankState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      selectedBatch:
          clearBatch ? null : (selectedBatch ?? this.selectedBatch),
    );
  }
}

class DataBankNotifier extends StateNotifier<DataBankState> {
  DataBankNotifier() : super(DataBankState());

  void setTabIndex(int index) {
    state = state.copyWith(selectedTabIndex: index);
  }

  void setSelectedBatch(String? batch) {
    state = state.copyWith(selectedBatch: batch);
  }
}

final dataBankTabProvider =
    StateNotifierProvider<DataBankNotifier, DataBankState>((ref) {
  return DataBankNotifier();
});

// 6. Poultry Diseases Search State
class PoultryDiseasesSearchNotifier extends StateNotifier<String> {
  PoultryDiseasesSearchNotifier() : super('');

  void setSearchQuery(String query) {
    state = query;
  }
}

final poultryDiseasesSearchProvider =
    StateNotifierProvider<PoultryDiseasesSearchNotifier, String>((ref) {
  return PoultryDiseasesSearchNotifier();
});

// 7. Production Cost State
class ProductionCostState {
  final double totalCost;
  final double costPerBird;
  final double expectedRevenue;
  final double estimatedProfit;
  final bool calculated;

  ProductionCostState({
    this.totalCost = 0.0,
    this.costPerBird = 0.0,
    this.expectedRevenue = 0.0,
    this.estimatedProfit = 0.0,
    this.calculated = false,
  });

  ProductionCostState copyWith({
    double? totalCost,
    double? costPerBird,
    double? expectedRevenue,
    double? estimatedProfit,
    bool? calculated,
  }) {
    return ProductionCostState(
      totalCost: totalCost ?? this.totalCost,
      costPerBird: costPerBird ?? this.costPerBird,
      expectedRevenue: expectedRevenue ?? this.expectedRevenue,
      estimatedProfit: estimatedProfit ?? this.estimatedProfit,
      calculated: calculated ?? this.calculated,
    );
  }
}

class ProductionCostNotifier extends StateNotifier<ProductionCostState> {
  ProductionCostNotifier() : super(ProductionCostState());

  void calculateCost({
    required double birds,
    required double chickPrice,
    required double feedTotal,
    required double medTotal,
    required double laborTotal,
    required double electTotal,
    required double otherTotal,
    required double sellPricePerKg,
  }) {
    final totalChicks = birds * chickPrice;
    final totalCost = totalChicks + feedTotal + medTotal + laborTotal + electTotal + otherTotal;
    final costPerBird = birds > 0 ? totalCost / birds : 0.0;
    final totalWeightKg = birds * 1.6;
    final expectedRevenue = totalWeightKg * sellPricePerKg;
    final estimatedProfit = expectedRevenue - totalCost;

    state = state.copyWith(
      totalCost: totalCost,
      costPerBird: costPerBird,
      expectedRevenue: expectedRevenue,
      estimatedProfit: estimatedProfit,
      calculated: true,
    );
  }
}

final productionCostProvider =
    StateNotifierProvider<ProductionCostNotifier, ProductionCostState>((ref) {
  return ProductionCostNotifier();
});

// 8. Detection Tab State
class DetectionTabState {
  final bool showResults;
  final int? selectedPhotoIndex;

  DetectionTabState({
    this.showResults = false,
    this.selectedPhotoIndex,
  });

  DetectionTabState copyWith({
    bool? showResults,
    int? selectedPhotoIndex,
    bool clearPhotoIndex = false,
  }) {
    return DetectionTabState(
      showResults: showResults ?? this.showResults,
      selectedPhotoIndex:
          clearPhotoIndex ? null : (selectedPhotoIndex ?? this.selectedPhotoIndex),
    );
  }
}

class DetectionTabNotifier extends StateNotifier<DetectionTabState> {
  DetectionTabNotifier() : super(DetectionTabState());

  void setShowResults(bool val) {
    state = state.copyWith(showResults: val);
  }

  void setSelectedPhotoIndex(int? idx) {
    if (idx == null) {
      state = state.copyWith(clearPhotoIndex: true);
    } else {
      state = state.copyWith(selectedPhotoIndex: idx);
    }
  }

  void reset() {
    state = DetectionTabState();
  }
}

final detectionTabProvider =
    StateNotifierProvider<DetectionTabNotifier, DetectionTabState>((ref) {
  return DetectionTabNotifier();
});

// 9. Camera Scan State
class CameraScanState {
  final List<File> capturedFiles;
  final bool isTakingPicture;
  final int tick;

  CameraScanState({
    this.capturedFiles = const [],
    this.isTakingPicture = false,
    this.tick = 0,
  });

  List<File> get capturedPhotos => capturedFiles;
  bool get isTaking => isTakingPicture;

  CameraScanState copyWith({
    List<File>? capturedFiles,
    bool? isTakingPicture,
    int? tick,
  }) {
    return CameraScanState(
      capturedFiles: capturedFiles ?? this.capturedFiles,
      isTakingPicture: isTakingPicture ?? this.isTakingPicture,
      tick: tick ?? this.tick,
    );
  }
}

class CameraScanNotifier extends StateNotifier<CameraScanState> {
  CameraScanNotifier() : super(CameraScanState());

  void addFile(File file) {
    state = state.copyWith(capturedFiles: [...state.capturedFiles, file]);
  }

  void addPhoto(File file) => addFile(file);

  void removeFile(int index) {
    final updated = List<File>.from(state.capturedFiles)..removeAt(index);
    state = state.copyWith(capturedFiles: updated);
  }

  void setIsTakingPicture(bool val) {
    state = state.copyWith(isTakingPicture: val);
  }

  void setIsTaking(bool val) => setIsTakingPicture(val);

  void touch() {
    state = state.copyWith(tick: state.tick + 1);
  }

  void clear() {
    state = CameraScanState();
  }
}

final cameraScanProvider =
    StateNotifierProvider<CameraScanNotifier, CameraScanState>((ref) {
  return CameraScanNotifier();
});

// 10. Admin Dashboard State
class AdminDashboardState {
  final bool isSaving;
  final bool isLoaded;
  final int tick;

  AdminDashboardState({this.isSaving = false, this.isLoaded = false, this.tick = 0});

  AdminDashboardState copyWith({bool? isSaving, bool? isLoaded, int? tick}) {
    return AdminDashboardState(
      isSaving: isSaving ?? this.isSaving,
      isLoaded: isLoaded ?? this.isLoaded,
      tick: tick ?? this.tick,
    );
  }
}

class AdminDashboardNotifier extends StateNotifier<AdminDashboardState> {
  AdminDashboardNotifier() : super(AdminDashboardState());

  void setIsSaving(bool val) {
    state = state.copyWith(isSaving: val);
  }

  void setIsLoaded(bool val) {
    state = state.copyWith(isLoaded: val);
  }

  void touch() {
    state = state.copyWith(tick: state.tick + 1);
  }
}

final adminDashboardProvider =
    StateNotifierProvider<AdminDashboardNotifier, AdminDashboardState>((ref) {
  return AdminDashboardNotifier();
});

// 11. Home Market Filter State
class HomeMarketFilterState {
  final String category;
  final String subCategory;

  HomeMarketFilterState({
    this.category = 'all',
    this.subCategory = 'all',
  });

  HomeMarketFilterState copyWith({
    String? category,
    String? subCategory,
  }) {
    return HomeMarketFilterState(
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
    );
  }
}

class HomeMarketFilterNotifier extends StateNotifier<HomeMarketFilterState> {
  HomeMarketFilterNotifier() : super(HomeMarketFilterState());

  void setCategory(String cat) {
    state = state.copyWith(category: cat, subCategory: 'all');
  }

  void setSubCategory(String subCat) {
    state = state.copyWith(subCategory: subCat);
  }
}

final homeMarketFilterProvider =
    StateNotifierProvider<HomeMarketFilterNotifier, HomeMarketFilterState>((ref) {
  return HomeMarketFilterNotifier();
});

// 12. DataBank Farm & Batch State
final databankFarmProvider = StateProvider<Farm?>((ref) => null);
final databankBatchProvider = StateProvider<Batch?>((ref) => null);

// 13. Current Time Stream Provider
final currentTimeProvider = StreamProvider.autoDispose<DateTime>((ref) async* {
  yield DateTime.now();
  yield* Stream.periodic(const Duration(seconds: 30), (_) => DateTime.now());
});



