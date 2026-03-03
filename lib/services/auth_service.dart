// ignore_for_file: deprecated_member_use
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart'; // for debugPrint & kDebugMode

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  User? get currentUser => _auth.currentUser;

  // ────────────────────────────────────────────────
  //  Improved image upload with better error handling
  // ────────────────────────────────────────────────
  Future<String?> uploadProfileImage({
    required File imageFile,
    required String fileName,
    required String path,
    bool addTimestamp = false,
  }) async {
    try {
      // Build clean reference
      String finalName = fileName;
      if (addTimestamp) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        finalName = '${fileName}_$timestamp';
      }

      final ref = _storage.ref().child(path).child(finalName);

      // ─── Metadata (helps with resumable uploads & debugging) ───
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {
          'uploadedBy': currentUser?.uid ?? 'anonymous',
          'appVersion': '1.0',
        },
      );

      // Use putFile with metadata
      final uploadTask = ref.putFile(imageFile, metadata);

      // ─── Optional: progress listening (good for UX later) ───
      // uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      //   final progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      //   debugPrint('Upload progress: $progress%');
      // });

      // Wait for completion
      final snapshot = await uploadTask.whenComplete(() {});

      if (snapshot.state == TaskState.success) {
        final url = await snapshot.ref.getDownloadURL();
        debugPrint('Upload successful → $url');
        return url;
      } else {
        debugPrint('Upload completed but state is ${snapshot.state}');
        return null;
      }
    } on FirebaseException catch (e) {
      debugPrint('Firebase Storage Exception: ${e.code} - ${e.message}');
      debugPrint('Full error: $e');

      if (e.code == 'object-not-found' || e.code == 'unauthenticated') {
        debugPrint(
          '→ Most likely: App Check not configured or Storage rules issue',
        );
      }
      if (e.code == 'unauthorized') {
        debugPrint('→ Storage security rules do not allow this write');
      }
      return null;
    } catch (e, stack) {
      debugPrint('Unexpected upload error: $e');
      debugPrint('Stack: $stack');
      return null;
    }
  }

  // ────────────────────────────────────────────────
  //                   SIGN UP - FIXED
  // ────────────────────────────────────────────────
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String address,
    required String userType,
    required String phone,
    String? gender,
    File? profileImage,
  }) async {
    UserCredential? credential;

    try {
      // 1. Create Firebase Auth user
      credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = credential.user;
      if (user == null) throw Exception('User creation failed');

      String? profilePicUrl = '';

      // 2. Upload profile picture (if provided)
      if (profileImage != null) {
        final uploadedUrl = await uploadProfileImage(
          imageFile: profileImage,
          fileName: '${user.uid}.jpg',
          path: 'profile_pics',
          // addTimestamp: true,   // ← uncomment if you want unique names
        );
        debugPrint("\n\n\n${uploadedUrl}\n\n\n");
        if (uploadedUrl != null) {
          profilePicUrl = uploadedUrl;
        } else {
          // You can decide: continue without photo or fail registration
          debugPrint('Profile photo upload failed → continuing without photo');
          // If you want to fail → throw Exception('Image upload failed');
        }
      }

      // 3. Save user document
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
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      debugPrint('User registered successfully: ${user.uid}');
    } catch (e) {
      // Cleanup: delete auth user if firestore or upload failed
      if (credential?.user != null) {
        try {
          await credential!.user!.delete();
          debugPrint('Cleaned up incomplete user after failure');
        } catch (deleteErr) {
          debugPrint('Failed to delete incomplete user: $deleteErr');
        }
      }

      // Re-throw with better context
      if (e is FirebaseException) {
        throw Exception('${e.code}: ${e.message}');
      }
      rethrow;
    }
  }

  // ────────────────────────────────────────────────
  //                   SIGN IN
  // ────────────────────────────────────────────────
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

  // ────────────────────────────────────────────────
  //                PASSWORD RESET
  // ────────────────────────────────────────────────
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapAuthError(e.code));
    }
  }

  // ────────────────────────────────────────────────
  //                   SIGN OUT
  // ────────────────────────────────────────────────
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Helper
  String _mapAuthError(String code) {
    switch (code) {
      case 'user-not-found':
      case 'user-disabled':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'This email is already registered.';
      case 'invalid-email':
        return 'Invalid email format.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'operation-not-allowed':
        return 'Sign-in method not enabled in Firebase console.';
      default:
        return 'Authentication error ($code). Please try again.';
    }
  }
}
