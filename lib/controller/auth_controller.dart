import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  // State
  bool _isLogin = true;
  bool _isLoading = false;
  bool _obscurePassword = true;
  File? _selectedImage;
  String _selectedUserType = 'Farmer';
  String _selectedGender = 'Male';

  // Getters
  bool get isLogin => _isLogin;
  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;
  File? get selectedImage => _selectedImage;
  String get selectedUserType => _selectedUserType;
  String get selectedGender => _selectedGender;

  void toggleAuthMode() {
    _isLogin = !_isLogin;
    _selectedImage = null;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void setUserType(String type) => {
    _selectedUserType = type,
    notifyListeners(),
  };
  void setGender(String gender) => {
    _selectedGender = gender,
    notifyListeners(),
  };

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // --- Password Reset Logic ---
  Future<void> sendPasswordReset(BuildContext context, String email) async {
    if (email.isEmpty) {
      _showError(context, "Please enter your email.");
      return;
    }
    _isLoading = true;
    notifyListeners();
    try {
      await _authService.resetPassword(email);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Reset link sent!"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      _showError(context, e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // --- Authentication Logic ---
  Future<void> authenticate({
    required BuildContext context,
    required String email,
    required String password,
    String? name,
    String? phone,
    String? address,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (_isLogin) {
        await _authService.signIn(email: email, password: password);
      } else {
        await _authService.signUp(
          email: email,
          password: password,
          name: name ?? "",
          phone: phone ?? "",
          address: address ?? "",
          userType: _selectedUserType,
          gender: _selectedGender,
          profileImage: _selectedImage, // Can be null now
        );
      }
      if (context.mounted) Navigator.pop(context);
    } catch (e) {
      _showError(context, e.toString().replaceAll('Exception: ', ''));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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
}
