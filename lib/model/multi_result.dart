/// Represents the type of multi-photo analysis outcome.
enum ResultType {
  /// All 3 photos agree on the same disease.
  unanimous,

  /// 2 out of 3 photos agree — majority vote wins.
  majority,

  /// All 3 photos show different results — ranked by confidence.
  inconclusive,
}

/// The result from processing a single photo.
class SingleResult {
  final String label;
  final double confidence;

  /// How many photos out of 3 agreed with this result.
  final int photoCount;

  const SingleResult({
    required this.label,
    required this.confidence,
    this.photoCount = 1,
  });
}

/// The aggregated result from processing multiple photos in parallel.
class MultiAnalysisResult {
  final ResultType type;

  /// For unanimous/majority: 1 item. For inconclusive: up to 3 items (ranked by confidence).
  final List<SingleResult> results;

  /// Raw per-photo labels for display in the image strip.
  final List<String> perPhotoLabels;

  /// Specific results for each individual photo (in order).
  final List<SingleResult> individualResults;

  const MultiAnalysisResult({
    required this.type,
    required this.results,
    required this.perPhotoLabels,
    required this.individualResults,
  });

  /// The primary (winning) result.
  SingleResult get primary => results.first;
}
