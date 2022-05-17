// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/first_screen.dart';
import 'package:flutter_firebase/pages/home_screen.dart';
import 'package:flutter_firebase/pages/login_email.dart';
import 'package:flutter_firebase/sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FlutterLogo(size: 150),
              const SizedBox(height: 50),
              _signInButton2(),
              const SizedBox(height: 16),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton2() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    return const HomeScreen();
                  } else {
                    return const LoginEmail();
                  }
                },
              );
            },
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: const BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/email.png"), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Email',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: const BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage("assets/google.png"), height: 35.0),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
