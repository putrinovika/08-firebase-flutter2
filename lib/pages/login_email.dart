// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/main.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const FlutterLogo(size: 120),
              const SizedBox(height: 20),
              const Text(
                'Hey There,\n Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(Icons.lock_open, size: 32),
                label: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    // Navigator.of(context) not working!
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
