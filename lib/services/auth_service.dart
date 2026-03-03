// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  User? get currentUser => _auth.currentUser;

  // --- Image Upload Logic ---
  Future<String?> uploadProfileImage({
    required File imageFile,
    required String fileName,
    required String path,
  }) async {
    try {
      final ref = _storage.ref().child(path).child(fileName);
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      final uploadTask = ref.putFile(imageFile, metadata);
      final snapshot = await uploadTask.whenComplete(() {});

      if (snapshot.state == TaskState.success) {
        return await snapshot.ref.getDownloadURL();
      }
      return null;
    } catch (e) {
      debugPrint('Storage Error: $e');
      return null;
    }
  }

  // --- Sign Up (Profile Image is now Optional) ---
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String address,
    required String userType,
    required String phone,
    String? gender,
    File? profileImage, // Nullable file
  }) async {
    UserCredential? credential;

    try {
      credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = credential.user;
      if (user == null) throw Exception('User creation failed');

      String profilePicUrl = '';

      // Only upload if an image was actually selected
      if (profileImage != null) {
        final uploadedUrl = await uploadProfileImage(
          imageFile: profileImage,
          fileName: '${user.uid}.jpg',
          path: 'profile_pics',
        );
        if (uploadedUrl != null) {
          profilePicUrl = uploadedUrl;
        }
      }

      await _db.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'address': address.trim(),
        'userType': userType,
        'gender': gender ?? 'Not Specified',
        'profilePic': profilePicUrl,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      if (credential?.user != null) {
        await credential!.user!.delete();
      }
      if (e is FirebaseException) throw Exception(_mapAuthError(e.code));
      rethrow;
    }
  }

  // --- Sign In ---
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapAuthError(e.code));
    }
  }

  // --- Password Reset ---
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapAuthError(e.code));
    }
  }

  Future<void> signOut() async => await _auth.signOut();

  String _mapAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'invalid-email':
        return 'Invalid email format.';
      case 'weak-password':
        return 'Password is too weak.';
      default:
        return 'Authentication error ($code).';
    }
  }
}
