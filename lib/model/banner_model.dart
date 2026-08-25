import 'package:cloud_firestore/cloud_firestore.dart';

class BannerItem {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final bool isActive;
  final int priority;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BannerItem({
    required this.id,
    required this.imageUrl,
    this.title = '',
    this.description = '',
    this.isActive = true,
    this.priority = 1,
    this.createdAt,
    this.updatedAt,
  });

  factory BannerItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return BannerItem(
      id: doc.id,
      imageUrl: data['imageUrl'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isActive: data['isActive'] ?? true,
      priority: data['priority'] ?? 1,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'isActive': isActive,
      'priority': priority,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
