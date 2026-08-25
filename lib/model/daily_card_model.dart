import 'package:cloud_firestore/cloud_firestore.dart';

class DailyCardInfo {
  final String id;
  final String country;
  final String dateText;
  final String timeText;
  final String dailyTip;
  final String weather;
  final DateTime? updatedAt;

  DailyCardInfo({
    required this.id,
    this.country = 'বাংলাদেশ',
    this.dateText = '',
    this.timeText = '',
    this.dailyTip = 'আজকের টিপস: শেডের লিটার পরিষ্কার ও শুকনো রাখুন।',
    this.weather = 'তাপমাত্রা ৩২° সে: | আর্দ্রতা ৬৫%',
    this.updatedAt,
  });

  factory DailyCardInfo.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return DailyCardInfo(
      id: doc.id,
      country: data['country'] ?? 'বাংলাদেশ',
      dateText: data['dateText'] ?? '',
      timeText: data['timeText'] ?? '',
      dailyTip: data['dailyTip'] ?? '',
      weather: data['weather'] ?? '',
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'dateText': dateText,
      'timeText': timeText,
      'dailyTip': dailyTip,
      'weather': weather,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
