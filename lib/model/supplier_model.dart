import 'package:cloud_firestore/cloud_firestore.dart';

class Supplier {
  final String id;
  final String name;
  final String category; // 'feed_chick', 'layer', 'equipment', 'vaccine', 'medicine', 'raw_material'
  final String phone;
  final String email;
  final String address;
  final String district;
  final String details;
  final bool isActive;

  Supplier({
    required this.id,
    required this.name,
    required this.category,
    required this.phone,
    this.email = '',
    required this.address,
    required this.district,
    this.details = '',
    this.isActive = true,
  });

  factory Supplier.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Supplier(
      id: doc.id,
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      district: data['district'] ?? '',
      details: data['details'] ?? '',
      isActive: data['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'phone': phone,
      'email': email,
      'address': address,
      'district': district,
      'details': details,
      'isActive': isActive,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
