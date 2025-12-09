import 'package:bloc_login_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(userRepository: FirebaseUserRepoImpl()));
}

// 42:15
// https://www.youtube.com/watch?v=rgkaurIyso8
