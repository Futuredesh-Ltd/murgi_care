import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  // State variables
  bool _isLogin = true;
  bool _isLoading = false;
  File? _selectedImage;
  String _selectedUserType = 'Farmer';
  String _selectedGender = 'Male';

  // Getters
  bool get isLogin => _isLogin;
  bool get isLoading => _isLoading;
  File? get selectedImage => _selectedImage;
  String get selectedUserType => _selectedUserType;
  String get selectedGender => _selectedGender;

  // --- Image Handling (Following your Reference style) ---

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 50, // Matches your upload quality preference
        maxWidth: 500,
      );

      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  // --- Auth Logic ---

  void toggleAuthMode() {
    _isLogin = !_isLogin;
    _selectedImage = null;
    notifyListeners();
  }

  void setUserType(String type) {
    _selectedUserType = type;
    notifyListeners();
  }

  void setGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  Future<void> authenticate({
    required BuildContext context,
    required String email,
    required String password,
    String? name,
    String? phone,
    String? address,
  }) async {
    // Validation
    if (!_isLogin && _selectedImage == null) {
      _showError(context, "Please select a profile image.");
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      if (_isLogin) {
        await _authService.signIn(email: email, password: password);
      } else {
        // For registration, we pass the data to AuthService
        // The AuthService will call uploadProfileImage internally
        await _authService.signUp(
          email: email,
          password: password,
          name: name ?? "",
          phone: phone ?? "",
          address: address ?? "",
          userType: _selectedUserType,
          gender: _selectedGender,
          profileImage: _selectedImage!,
        );
      }

      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      _showError(context, _mapAuthError(e.code));
    } catch (e) {
      // Handles the 404/Storage errors from your reference methods
      _showError(
        context,
        "Upload Failed: Ensure Firebase Storage is enabled in Console.",
      );
      debugPrint("Auth Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Helper methods for UI feedback
  void _showError(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  String _mapAuthError(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return "This email is already registered.";
      case 'wrong-password':
        return "Incorrect password.";
      case 'user-not-found':
        return "No user found with this email.";
      default:
        return "Authentication failed. Please try again.";
    }
  }
}
