import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:murgi_care/view/myHome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _controller = PageController();
  final ValueNotifier<bool> _isLastPage = ValueNotifier<bool>(false);

  // Helper method to save preference and navigate
  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyhomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Page Content (Images and Text)
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              _isLastPage.value = (index == 2);
            },
            children: [
              _buildPage(
                context,
                imagePath: "assets/Murgi1.png",
                title: 'Disease Detection',
                subtitle:
                    'Identify poultry diseases instantly using our AI-powered scanner.',
                color: Colors.teal,
                hieght: 81,
              ),
              _buildPage(
                context,
                imagePath: "assets/Murgi2.png",
                title: 'Expert Consult',
                subtitle:
                    'Connect with certified veterinarians for professional bird care.',
                color: Colors.indigo,
                hieght: 150,
              ),
              _buildPage(
                context,
                imagePath: "assets/Murgi3.png",
                title: 'Farm Records',
                subtitle:
                    'Monitor health history and maintain digital records for your flock.',
                color: Colors.blueGrey,
                hieght: 66,
              ),
            ],
          ),

          // 2. Navigation UI (Top Skip & Bottom Controls)
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Skip Button
                Align(
                  alignment: Alignment.topRight,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _isLastPage,
                    builder: (context, isLast, child) {
                      return isLast
                          ? const SizedBox(height: 48)
                          : TextButton(
                              onPressed: () => _completeOnboarding(context),
                              child: const Text(
                                'SKIP',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            );
                    },
                  ),
                ),

                // Bottom Controls (Dots & Circular Button)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Dots Indicator
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.teal,
                          dotColor: Colors.black12,
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 4,
                        ),
                      ),

                      // Next/Done Circular Button
                      ValueListenableBuilder<bool>(
                        valueListenable: _isLastPage,
                        builder: (context, isLast, child) {
                          return FloatingActionButton(
                            elevation: 2,
                            backgroundColor: Colors.teal,
                            onPressed: () {
                              if (isLast) {
                                _completeOnboarding(context);
                              } else {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            child: Icon(
                              isLast ? Icons.done : Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Optimized Page Builder
  Widget _buildPage(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required Color color,
    double? hieght,
  }) {
    return Column(
      children: [
        SizedBox(height: hieght),
        // Image Section
        Image.asset(imagePath, fit: BoxFit.cover),
        const SizedBox(height: 40),
        // Title Section
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 20),
        // Subtitle Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
