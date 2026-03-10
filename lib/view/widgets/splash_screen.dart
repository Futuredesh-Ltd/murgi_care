import 'package:flutter/material.dart';
import 'package:murgi_care/view/Onboarding_Screen.dart';
import 'package:murgi_care/view/myHome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 5));

    final prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (mounted) {
      if (isFirstTime) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyhomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset("assets/logo.png", height: 140, width: 140),
            SizedBox(height: 10),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "MURGI ",
                    style: TextStyle(
                      color: Color(0xff0c6938),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextSpan(
                    text: "CARE",
                    style: TextStyle(
                      color: Color(0xffdc851c),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
