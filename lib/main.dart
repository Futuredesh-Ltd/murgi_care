import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:murgi_care/core/app_theme.dart';
import 'package:murgi_care/view/widgets/splash_screen.dart';
import 'package:murgi_care/controller/riverpod_providers.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diseaseProv = ref.watch(diseaseRiverpodProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Murgi Care',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: diseaseProv.themeMode,
      home: const SplashScreen(),
    );
  }
}
