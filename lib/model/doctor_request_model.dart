import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorContactRequest {
  final String id;
  final String userId;
  final String userName;
  final String userPhone;
  final String userEmail;
  final String doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final String status; // 'pending', 'accepted', 'rejected'
  final String permission; // 'yes', 'no'
  final DateTime? requestedAt;
  final DateTime? updatedAt;

  DoctorContactRequest({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhone = '',
    this.userEmail = '',
    required this.doctorId,
    required this.doctorName,
    this.doctorSpecialization = '',
    this.status = 'pending',
    this.permission = 'no',
    this.requestedAt,
    this.updatedAt,
  });

  bool get isApproved => permission == 'yes' || status == 'accepted';

  factory DoctorContactRequest.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    final stat = data['status'] ?? 'pending';
    return DoctorContactRequest(
      id: doc.id,
      userId: data['userId'] ?? '',
      userName: data['userName'] ?? 'সাধারন ইউজার',
      userPhone: data['userPhone'] ?? '',
      userEmail: data['userEmail'] ?? '',
      doctorId: data['doctorId'] ?? '',
      doctorName: data['doctorName'] ?? '',
      doctorSpecialization: data['doctorSpecialization'] ?? '',
      status: stat,
      permission: data['permission'] ?? (stat == 'accepted' ? 'yes' : 'no'),
      requestedAt: (data['requestedAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userPhone': userPhone,
      'userEmail': userEmail,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'doctorSpecialization': doctorSpecialization,
      'status': status,
      'permission': permission,
      'requestedAt': requestedAt != null
          ? Timestamp.fromDate(requestedAt!)
          : FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
