// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/login_page.dart';
import 'package:flutter_firebase/sign_in.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 143, 205, 255),
              Color.fromARGB(255, 0, 103, 188),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl!,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 40),
              const Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name!,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email!,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.lightBlue,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
