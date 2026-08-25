import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String qualification;
  final String experience;
  final String phone;
  final String email;
  final String address;
  final String district;
  final String upazila;
  final String profileImage;
  final String availableTime;
  final bool isActive;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    required this.experience,
    required this.phone,
    this.email = '',
    required this.address,
    required this.district,
    this.upazila = '',
    this.profileImage = '',
    this.availableTime = '',
    this.isActive = true,
  });

  factory Doctor.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Doctor(
      id: doc.id,
      name: data['name'] ?? '',
      specialization: data['specialization'] ?? '',
      qualification: data['qualification'] ?? '',
      experience: data['experience'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      district: data['district'] ?? '',
      upazila: data['upazila'] ?? '',
      profileImage: data['profileImage'] ?? '',
      availableTime: data['availableTime'] ?? '',
      isActive: data['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialization': specialization,
      'qualification': qualification,
      'experience': experience,
      'phone': phone,
      'email': email,
      'address': address,
      'district': district,
      'upazila': upazila,
      'profileImage': profileImage,
      'availableTime': availableTime,
      'isActive': isActive,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
