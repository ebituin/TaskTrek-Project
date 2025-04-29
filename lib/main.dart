import 'package:flutter/material.dart';
import 'package:tasktrek/pages/dashBoard.dart';
import 'package:tasktrek/pages/forgotPassword.dart';
import 'package:tasktrek/pages/homePageV2.dart';
import 'package:tasktrek/pages/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/SignUp': (context) => Signup(),
        '/Forgot': (context) => ForgotPage(),
        '/DashBoard': (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


