import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementItem {
  final String id;
  final String title;
  final String message;
  final bool isActive;
  final int priority;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AnnouncementItem({
    required this.id,
    required this.title,
    required this.message,
    this.isActive = true,
    this.priority = 1,
    this.createdAt,
    this.updatedAt,
  });

  factory AnnouncementItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return AnnouncementItem(
      id: doc.id,
      title: data['title'] ?? '',
      message: data['message'] ?? '',
      isActive: data['isActive'] ?? true,
      priority: data['priority'] ?? 1,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'isActive': isActive,
      'priority': priority,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
