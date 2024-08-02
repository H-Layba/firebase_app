import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapplication/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';
import '../ui/posts/post_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      // User is signed in, navigate to posts screen
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PostScreen()),
        );
      });
    } else {
      // No user is signed in, navigate to login screen
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }
  }
}
