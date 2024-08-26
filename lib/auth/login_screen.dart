import 'dart:developer';
import 'dart:ffi';

import 'package:firestore4/auth/auth_service.dart';
import 'package:firestore4/auth/signup_screen.dart';
import 'package:firestore4/phone.dart';
import 'package:firestore4/widgets/button.dart';
import 'package:firestore4/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false; // Add this line to track loading state

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img1.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(),
              const Text("Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
              const SizedBox(height: 50),
              CustomTextField(
                hint: "Enter Email",
                label: "Email",
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Password",
                label: "Password",
                controller: _password,
              ),
              const SizedBox(height: 30),
              _isLoading
                  ? CircularProgressIndicator() // Show loading indicator
                  : CustomButton(
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Already have an account? "),
                InkWell(
                  onTap: () => goToSignup(context),
                  child: const Text("Signup", style: TextStyle(color: Colors.red)),
                )
              ]),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignupScreen()),
  );

  goToHome(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyPhone()),
  );

  _login() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    final user =
    await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    setState(() {
      _isLoading = false; // Hide loading indicator
    });

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    }
  }
}
