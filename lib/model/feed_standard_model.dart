class FeedTypeStandard {
  final String id;
  final String category; // Broiler, Color, Sonali, Layer, Breeder
  final String breed; // Broiler, Color, Sonali, Layer, Broiler Breeder, Color Breeder, Layer Breeder
  final String stage; // Starter, Grower, Finisher, Chick, Pre-Layer, Layer, Pre-Breeder, Breeder Phase-1, Breeder Phase-2
  final double targetCP; // Crude Protein %
  final double targetME; // Metabolizable Energy kcal/kg
  final double targetCa; // Calcium %
  final double targetAvP; // Available Phosphorus %
  final double targetLys; // Lysine %
  final double targetMet; // Methionine %
  final double maxFiber; // Max Crude Fiber %

  const FeedTypeStandard({
    required this.id,
    required this.category,
    required this.breed,
    required this.stage,
    required this.targetCP,
    required this.targetME,
    required this.targetCa,
    required this.targetAvP,
    required this.targetLys,
    required this.targetMet,
    required this.maxFiber,
  });

  String get displayName => "$breed - $stage";
  String get fullPath => "$category / $breed / $stage";
}

class FeedIngredient {
  final String id;
  final String name;
  final double cp; // Crude Protein %
  final double me; // Metabolizable Energy kcal/kg
  final double ca; // Calcium %
  final double avP; // Available Phosphorus %
  final double lys; // Lysine %
  final double met; // Methionine %
  final double fiber; // Fiber %
  final double fat; // Fat %
  final double pricePerKg; // Cost in ৳/kg
  final bool isCustom;

  const FeedIngredient({
    this.id = '',
    required this.name,
    required this.cp,
    required this.me,
    this.ca = 0.0,
    this.avP = 0.0,
    this.lys = 0.0,
    this.met = 0.0,
    this.fiber = 0.0,
    this.fat = 0.0,
    required this.pricePerKg,
    this.isCustom = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id.isEmpty ? name : id,
      'name': name,
      'cp': cp,
      'me': me,
      'ca': ca,
      'avP': avP,
      'lys': lys,
      'met': met,
      'fiber': fiber,
      'fat': fat,
      'pricePerKg': pricePerKg,
      'isCustom': isCustom ? 1 : 0,
    };
  }

  factory FeedIngredient.fromMap(Map<String, dynamic> map) {
    return FeedIngredient(
      id: map['id'] ?? map['name'] ?? '',
      name: map['name'] ?? '',
      cp: (map['cp'] as num?)?.toDouble() ?? 0.0,
      me: (map['me'] as num?)?.toDouble() ?? 0.0,
      ca: (map['ca'] as num?)?.toDouble() ?? 0.0,
      avP: (map['avP'] as num?)?.toDouble() ?? 0.0,
      lys: (map['lys'] as num?)?.toDouble() ?? 0.0,
      met: (map['met'] as num?)?.toDouble() ?? 0.0,
      fiber: (map['fiber'] as num?)?.toDouble() ?? 0.0,
      fat: (map['fat'] as num?)?.toDouble() ?? 0.0,
      pricePerKg: (map['pricePerKg'] as num?)?.toDouble() ?? 0.0,
      isCustom: (map['isCustom'] as int?) == 1,
    );
  }
}

// ============================================================================
// PREDEFINED 28 FEED TYPE STANDARDS
// ============================================================================
final List<FeedTypeStandard> allFeedTypeStandards = [
  // 1. BROILER (3)
  const FeedTypeStandard(
    id: 'broiler_starter',
    category: 'Broiler',
    breed: 'Broiler',
    stage: 'Starter',
    targetCP: 22.0,
    targetME: 3000.0,
    targetCa: 1.0,
    targetAvP: 0.45,
    targetLys: 1.2,
    targetMet: 0.5,
    maxFiber: 4.0,
  ),
  const FeedTypeStandard(
    id: 'broiler_grower',
    category: 'Broiler',
    breed: 'Broiler',
    stage: 'Grower',
    targetCP: 20.0,
    targetME: 3100.0,
    targetCa: 0.9,
    targetAvP: 0.40,
    targetLys: 1.1,
    targetMet: 0.45,
    maxFiber: 4.5,
  ),
  const FeedTypeStandard(
    id: 'broiler_finisher',
    category: 'Broiler',
    breed: 'Broiler',
    stage: 'Finisher',
    targetCP: 18.5,
    targetME: 3200.0,
    targetCa: 0.85,
    targetAvP: 0.38,
    targetLys: 1.0,
    targetMet: 0.42,
    maxFiber: 5.0,
  ),

  // 2. COLOR (3)
  const FeedTypeStandard(
    id: 'color_starter',
    category: 'Color',
    breed: 'Color',
    stage: 'Starter',
    targetCP: 21.0,
    targetME: 2950.0,
    targetCa: 1.0,
    targetAvP: 0.45,
    targetLys: 1.15,
    targetMet: 0.48,
    maxFiber: 4.5,
  ),
  const FeedTypeStandard(
    id: 'color_grower',
    category: 'Color',
    breed: 'Color',
    stage: 'Grower',
    targetCP: 19.0,
    targetME: 3050.0,
    targetCa: 0.9,
    targetAvP: 0.40,
    targetLys: 1.0,
    targetMet: 0.43,
    maxFiber: 5.0,
  ),
  const FeedTypeStandard(
    id: 'color_finisher',
    category: 'Color',
    breed: 'Color',
    stage: 'Finisher',
    targetCP: 17.5,
    targetME: 3150.0,
    targetCa: 0.85,
    targetAvP: 0.38,
    targetLys: 0.95,
    targetMet: 0.40,
    maxFiber: 5.5,
  ),

  // 3. SONALI (3)
  const FeedTypeStandard(
    id: 'sonali_starter',
    category: 'Sonali',
    breed: 'Sonali',
    stage: 'Starter',
    targetCP: 20.5,
    targetME: 2900.0,
    targetCa: 1.0,
    targetAvP: 0.42,
    targetLys: 1.1,
    targetMet: 0.45,
    maxFiber: 5.0,
  ),
  const FeedTypeStandard(
    id: 'sonali_grower',
    category: 'Sonali',
    breed: 'Sonali',
    stage: 'Grower',
    targetCP: 18.5,
    targetME: 3000.0,
    targetCa: 0.9,
    targetAvP: 0.40,
    targetLys: 0.95,
    targetMet: 0.40,
    maxFiber: 5.5,
  ),
  const FeedTypeStandard(
    id: 'sonali_finisher',
    category: 'Sonali',
    breed: 'Sonali',
    stage: 'Finisher',
    targetCP: 17.0,
    targetME: 3100.0,
    targetCa: 0.85,
    targetAvP: 0.38,
    targetLys: 0.88,
    targetMet: 0.38,
    maxFiber: 6.0,
  ),

  // 4. LAYER (4)
  const FeedTypeStandard(
    id: 'layer_chick',
    category: 'Layer',
    breed: 'Layer',
    stage: 'Chick',
    targetCP: 20.0,
    targetME: 2850.0,
    targetCa: 1.0,
    targetAvP: 0.45,
    targetLys: 1.0,
    targetMet: 0.42,
    maxFiber: 5.0,
  ),
  const FeedTypeStandard(
    id: 'layer_grower',
    category: 'Layer',
    breed: 'Layer',
    stage: 'Grower',
    targetCP: 16.0,
    targetME: 2750.0,
    targetCa: 1.0,
    targetAvP: 0.40,
    targetLys: 0.75,
    targetMet: 0.35,
    maxFiber: 6.0,
  ),
  const FeedTypeStandard(
    id: 'layer_pre_layer',
    category: 'Layer',
    breed: 'Layer',
    stage: 'Pre-Layer',
    targetCP: 17.0,
    targetME: 2750.0,
    targetCa: 2.2,
    targetAvP: 0.42,
    targetLys: 0.80,
    targetMet: 0.38,
    maxFiber: 5.5,
  ),
  const FeedTypeStandard(
    id: 'layer_layer',
    category: 'Layer',
    breed: 'Layer',
    stage: 'Layer',
    targetCP: 16.5,
    targetME: 2750.0,
    targetCa: 3.8,
    targetAvP: 0.42,
    targetLys: 0.82,
    targetMet: 0.40,
    maxFiber: 5.5,
  ),

  // 5. BROILER BREEDER (5)
  const FeedTypeStandard(
    id: 'broiler_breeder_starter',
    category: 'Breeder',
    breed: 'Broiler Breeder',
    stage: 'Starter',
    targetCP: 19.0,
    targetME: 2850.0,
    targetCa: 1.0,
    targetAvP: 0.45,
    targetLys: 0.95,
    targetMet: 0.40,
    maxFiber: 5.5,
  ),
  const FeedTypeStandard(
    id: 'broiler_breeder_grower',
    category: 'Breeder',
    breed: 'Broiler Breeder',
    stage: 'Grower',
    targetCP: 15.0,
    targetME: 2700.0,
    targetCa: 0.9,
    targetAvP: 0.38,
    targetLys: 0.65,
    targetMet: 0.28,
    maxFiber: 7.5,
  ),
  const FeedTypeStandard(
    id: 'broiler_breeder_pre_breeder',
    category: 'Breeder',
    breed: 'Broiler Breeder',
    stage: 'Pre-Breeder',
    targetCP: 16.0,
    targetME: 2750.0,
    targetCa: 1.5,
    targetAvP: 0.40,
    targetLys: 0.75,
    targetMet: 0.32,
    maxFiber: 7.0,
  ),
  const FeedTypeStandard(
    id: 'broiler_breeder_phase_1',
    category: 'Breeder',
    breed: 'Broiler Breeder',
    stage: 'Breeder Phase-1',
    targetCP: 16.5,
    targetME: 2800.0,
    targetCa: 3.2,
    targetAvP: 0.42,
    targetLys: 0.80,
    targetMet: 0.35,
    maxFiber: 7.0,
  ),
  const FeedTypeStandard(
    id: 'broiler_breeder_phase_2',
    category: 'Breeder',
    breed: 'Broiler Breeder',
    stage: 'Breeder Phase-2',
    targetCP: 15.5,
    targetME: 2750.0,
    targetCa: 3.5,
    targetAvP: 0.40,
    targetLys: 0.75,
    targetMet: 0.32,
    maxFiber: 7.5,
  ),

  // 6. COLOR BREEDER (5)
  const FeedTypeStandard(
    id: 'color_breeder_starter',
    category: 'Breeder',
    breed: 'Color Breeder',
    stage: 'Starter',
    targetCP: 18.5,
    targetME: 2800.0,
    targetCa: 1.0,
    targetAvP: 0.42,
    targetLys: 0.90,
    targetMet: 0.38,
    maxFiber: 6.0,
  ),
  const FeedTypeStandard(
    id: 'color_breeder_grower',
    category: 'Breeder',
    breed: 'Color Breeder',
    stage: 'Grower',
    targetCP: 15.0,
    targetME: 2700.0,
    targetCa: 0.9,
    targetAvP: 0.38,
    targetLys: 0.65,
    targetMet: 0.28,
    maxFiber: 7.5,
  ),
  const FeedTypeStandard(
    id: 'color_breeder_pre_breeder',
    category: 'Breeder',
    breed: 'Color Breeder',
    stage: 'Pre-Breeder',
    targetCP: 16.0,
    targetME: 2750.0,
    targetCa: 1.5,
    targetAvP: 0.40,
    targetLys: 0.72,
    targetMet: 0.32,
    maxFiber: 7.0,
  ),
  const FeedTypeStandard(
    id: 'color_breeder_phase_1',
    category: 'Breeder',
    breed: 'Color Breeder',
    stage: 'Breeder Phase-1',
    targetCP: 16.5,
    targetME: 2800.0,
    targetCa: 3.2,
    targetAvP: 0.42,
    targetLys: 0.78,
    targetMet: 0.35,
    maxFiber: 7.0,
  ),
  const FeedTypeStandard(
    id: 'color_breeder_phase_2',
    category: 'Breeder',
    breed: 'Color Breeder',
    stage: 'Breeder Phase-2',
    targetCP: 15.5,
    targetME: 2750.0,
    targetCa: 3.5,
    targetAvP: 0.40,
    targetLys: 0.72,
    targetMet: 0.32,
    maxFiber: 7.5,
  ),

  // 7. LAYER BREEDER (5)
  const FeedTypeStandard(
    id: 'layer_breeder_starter',
    category: 'Breeder',
    breed: 'Layer Breeder',
    stage: 'Starter',
    targetCP: 19.0,
    targetME: 2800.0,
    targetCa: 1.0,
    targetAvP: 0.42,
    targetLys: 0.92,
    targetMet: 0.40,
    maxFiber: 5.5,
  ),
  const FeedTypeStandard(
    id: 'layer_breeder_grower',
    category: 'Breeder',
    breed: 'Layer Breeder',
    stage: 'Grower',
    targetCP: 15.0,
    targetME: 2700.0,
    targetCa: 0.9,
    targetAvP: 0.38,
    targetLys: 0.65,
    targetMet: 0.28,
    maxFiber: 7.5,
  ),
  const FeedTypeStandard(
    id: 'layer_breeder_pre_breeder',
    category: 'Breeder',
    breed: 'Layer Breeder',
    stage: 'Pre-Breeder',
    targetCP: 16.0,
    targetME: 2750.0,
    targetCa: 1.5,
    targetAvP: 0.40,
    targetLys: 0.75,
    targetMet: 0.32,
    maxFiber: 7.0,
  ),
  const FeedTypeStandard(
    id: 'layer_breeder_phase_1',
    category: 'Breeder',
    breed: 'Layer Breeder',
    stage: 'Breeder Phase-1',
    targetCP: 16.5,
    targetME: 2800.0,
    targetCa: 3.4,
    targetAvP: 0.42,
    targetLys: 0.80,
    targetMet: 0.35,
    maxFiber: 7.0,
  ),
  const FeedTypeStandard(
    id: 'layer_breeder_phase_2',
    category: 'Breeder',
    breed: 'Layer Breeder',
    stage: 'Breeder Phase-2',
    targetCP: 15.5,
    targetME: 2750.0,
    targetCa: 3.6,
    targetAvP: 0.40,
    targetLys: 0.75,
    targetMet: 0.32,
    maxFiber: 7.5,
  ),
];

// ============================================================================
// INGREDIENTS REPOSITORY
// ============================================================================
final List<FeedIngredient> defaultFeedIngredients = [
  const FeedIngredient(name: 'Maize (Yellow Corn)', cp: 8.5, me: 3350.0, ca: 0.02, avP: 0.10, lys: 0.24, met: 0.18, fiber: 2.2, pricePerKg: 36.0),
  const FeedIngredient(name: 'Soybean Meal', cp: 44.0, me: 2450.0, ca: 0.30, avP: 0.20, lys: 2.70, met: 0.62, fiber: 6.0, pricePerKg: 72.0),
  const FeedIngredient(name: 'Soybean Oil', cp: 0.0, me: 8800.0, ca: 0.00, avP: 0.00, lys: 0.00, met: 0.00, fiber: 0.0, pricePerKg: 135.0),
  const FeedIngredient(name: 'DL-Methionine', cp: 58.0, me: 0.0, ca: 0.00, avP: 0.00, lys: 0.00, met: 99.00, fiber: 0.0, pricePerKg: 450.0),
  const FeedIngredient(name: 'DCP', cp: 0.0, me: 0.0, ca: 24.00, avP: 18.00, lys: 0.00, met: 0.00, fiber: 0.0, pricePerKg: 85.0),
  const FeedIngredient(name: 'Rice Polish', cp: 12.0, me: 2900.0, ca: 0.08, avP: 0.25, lys: 0.55, met: 0.22, fiber: 10.0, pricePerKg: 32.0),
  const FeedIngredient(name: 'Wheat Bran', cp: 14.5, me: 1300.0, ca: 0.12, avP: 0.22, lys: 0.60, met: 0.20, fiber: 11.0, pricePerKg: 35.0),
  const FeedIngredient(name: 'Limestone', cp: 0.0, me: 0.0, ca: 38.00, avP: 0.00, lys: 0.00, met: 0.00, fiber: 0.0, pricePerKg: 12.0),
  const FeedIngredient(name: 'L-Lysine', cp: 94.0, me: 0.0, ca: 0.00, avP: 0.00, lys: 78.80, met: 0.00, fiber: 0.0, pricePerKg: 280.0),
  const FeedIngredient(name: 'Fish Meal (60%)', cp: 60.0, me: 2800.0, ca: 4.50, avP: 2.80, lys: 4.50, met: 1.70, fiber: 1.0, pricePerKg: 140.0),
  const FeedIngredient(name: 'Salt', cp: 0.0, me: 0.0, ca: 0.00, avP: 0.00, lys: 0.00, met: 0.00, fiber: 0.0, pricePerKg: 20.0),
  const FeedIngredient(name: 'Premix', cp: 0.0, me: 0.0, ca: 0.00, avP: 0.00, lys: 0.00, met: 0.00, fiber: 0.0, pricePerKg: 220.0),
];
