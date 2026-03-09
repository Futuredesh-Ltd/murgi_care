import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:murgi_care/view/myHome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _controller = PageController();
  final ValueNotifier<bool> _isLastPage = ValueNotifier<bool>(false);

  // Toggle: true = English, false = Bangla
  final ValueNotifier<bool> _isEnglish = ValueNotifier<bool>(true);

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
                    'MurgiCare helps poultry farmers identify common chicken diseases using AI.\nSimply scan chicken droppings, feet, or face to get possible disease information along with symptoms, prevention tips, and treatment suggestions.',
                banglaSubtitle:
                    'MurgiCare একটি স্মার্ট অ্যাপ যা AI ব্যবহার করে মুরগির সাধারণ রোগ শনাক্ত করতে সাহায্য করে।\nশুধু মুরগির মল, পা বা মুখের ছবি স্ক্যান করুন এবং সম্ভাব্য রোগ, লক্ষণ, প্রতিরোধ এবং চিকিৎসা সম্পর্কে তথ্য পান।',
                color: Colors.teal,
                hieght: 81,
              ),
              _buildPage(
                context,
                imagePath: "assets/Murgi2.png",
                title: 'How it works',
                subtitle:
                    'Our AI analyzes the image you capture and compares it with thousands of trained disease patterns to predict possible chicken health issues.',
                banglaSubtitle:
                    'আপনি যে ছবি তুলবেন তা আমাদের এআই বিশ্লেষণ করে এবং প্রশিক্ষিত ডেটার সাথে মিলিয়ে সম্ভাব্য রোগ নির্ধারণ করে।',
                color: Colors.indigo,
                hieght: 150,
              ),
              _buildPage(
                context,
                imagePath: "assets/Murgi3.png",
                title: 'Get Results',
                subtitle:
                    'The app provides possible disease information, symptoms, prevention tips, and treatment suggestions based on AI analysis.',
                banglaSubtitle:
                    'এই অ্যাপটি এআই বিশ্লেষণের মাধ্যমে সম্ভাব্য রোগ, লক্ষণ, প্রতিরোধ এবং চিকিৎসা সম্পর্কিত তথ্য প্রদান করে।',
                color: Colors.blueGrey,
                hieght: 66,
              ),
            ],
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Row: Language Toggle and Skip Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Language Toggle Button
                      ValueListenableBuilder<bool>(
                        valueListenable: _isEnglish,
                        builder: (context, isEng, child) {
                          return TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.teal.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () =>
                                _isEnglish.value = !_isEnglish.value,
                            icon: const Icon(
                              Icons.language,
                              size: 20,
                              color: Colors.teal,
                            ),
                            label: Text(
                              isEng ? "বাংলা" : "English",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          );
                        },
                      ),

                      // Skip Button
                      ValueListenableBuilder<bool>(
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
                    ],
                  ),
                ),

                // Bottom Controls
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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

  Widget _buildPage(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required String banglaSubtitle,
    required Color color,
    double? hieght,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: hieght),

          // Image Animation
          TweenAnimationBuilder(
            key: ValueKey(
              imagePath,
            ), // Key ensures animation re-triggers on slide
            duration: const Duration(milliseconds: 800),
            tween: Tween<double>(begin: 0.8, end: 1.0),
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: Opacity(opacity: value, child: child),
              );
            },
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),

          const SizedBox(height: 10),

          // Title
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

          // Animated Switcher for Subtitle Toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ValueListenableBuilder<bool>(
              valueListenable: _isEnglish,
              builder: (context, isEng, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                  child: Text(
                    isEng ? subtitle : banglaSubtitle,
                    key: ValueKey<bool>(isEng),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: isEng ? Colors.black87 : Colors.teal.shade900,
                      height: 1.5,
                      fontWeight: isEng ? FontWeight.normal : FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
