import 'package:cloud_firestore/cloud_firestore.dart';

class PriceEntry {
  final String name;
  final String price;
  final String unit;

  PriceEntry({required this.name, required this.price, this.unit = ''});

  factory PriceEntry.fromMap(Map<String, dynamic> map) {
    return PriceEntry(
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      unit: map['unit'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price, 'unit': unit};
  }

  String get formatted {
    if (unit.isNotEmpty) return '$name: ৳$price/$unit';
    return '$name: ৳$price';
  }
}

class MarketCategoryPrice {
  final String id; // category key e.g. 'chick', 'egg', 'chicken', 'raw_material'
  final String titleBn;
  final String titleEn;
  final List<PriceEntry> items;
  final DateTime? updatedAt;

  MarketCategoryPrice({
    required this.id,
    required this.titleBn,
    required this.titleEn,
    required this.items,
    this.updatedAt,
  });

  factory MarketCategoryPrice.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    final rawItems = (data['items'] as List<dynamic>?) ?? [];
    return MarketCategoryPrice(
      id: doc.id,
      titleBn: data['titleBn'] ?? '',
      titleEn: data['titleEn'] ?? '',
      items: rawItems.map((e) => PriceEntry.fromMap(Map<String, dynamic>.from(e))).toList(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titleBn': titleBn,
      'titleEn': titleEn,
      'items': items.map((e) => e.toMap()).toList(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  String get marqueeText {
    if (items.isEmpty) return 'কোনো আপডেট তথ্য পাওয়া যায়নি';
    return items.map((e) => e.formatted).join(' | ');
  }
}
