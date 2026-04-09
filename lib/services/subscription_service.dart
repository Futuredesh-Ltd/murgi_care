import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionService {
  static const String _guestCountKey = 'guest_detect_count';
  static const int _maxGuestScans = 5;

  Future<bool> canPerformDetection() async {
    final user = FirebaseAuth.instance.currentUser;
    // 1. Logged in users get unlimited access
    if (user != null) return true;

    // 2. Guests check local storage count
    final prefs = await SharedPreferences.getInstance();
    int count = prefs.getInt(_guestCountKey) ?? 0;
    return count < _maxGuestScans;
  }

  Future<void> incrementGuestCount() async {
    final prefs = await SharedPreferences.getInstance();
    int count = prefs.getInt(_guestCountKey) ?? 0;
    await prefs.setInt(_guestCountKey, count + 1);
  }
}
