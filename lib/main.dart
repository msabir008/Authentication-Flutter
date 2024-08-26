import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'phone.dart'; // Ensure the path is correct
import 'verify.dart';  // Ensure the path is correct
import 'main1.dart';   // Ensure the path is correct

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',  // Set initial route to 'login'
      routes: {
        'login': (context) => const LoginScreen(),
        'signup': (context) => const SignupScreen(),
        'phone': (context) => const MyPhone(),
        'verify': (context) => VerifyPage(verificationId: ''), // Placeholder for verification ID
        'main': (context) => const MainPage(),
      },
    );
  }
}
