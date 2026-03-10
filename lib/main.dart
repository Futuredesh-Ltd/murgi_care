import 'package:firebase_core/firebase_core.dart';
import 'package:murgi_care/controller/auth_controller.dart';
import 'package:murgi_care/controller/controller.dart';
import 'package:murgi_care/services/auth_service.dart';
import 'package:murgi_care/view/myHome_screen.dart';
import 'package:flutter/material.dart';
import 'package:murgi_care/view/widgets/splash_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiseaseProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        Provider<AuthService>(create: (_) => AuthService()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Murgi Care',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: SplashScreen(),
    );
  }
}
