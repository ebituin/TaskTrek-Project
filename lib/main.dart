import 'package:flutter/material.dart';
import 'package:tasktrek/pages/dashboard/dashBoard.dart';
import 'package:tasktrek/pages/reset_password/forgotPassword.dart';
import 'package:tasktrek/pages/home/home_sceen.dart';
import 'package:tasktrek/pages/sign_up/signUpAccountType.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasktrek/pages/sign_up/signUpForm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ntnbqdtldgsboiynwfxi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im50bmJxZHRsZGdzYm9peW53ZnhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYxMjM4MDgsImV4cCI6MjA2MTY5OTgwOH0.Xn6lvUfkPKsHWSy1EVHM8NSb1-zyvS7uOvoTQFgaJ2o',
  );

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
        '/': (context) => Homescreen(),
        '/SignUp': (context) => Signup(),
        '/SignUpForm': (context) => SignupForm(),
        '/Forgot': (context) => ForgotPage(),
        '/DashBoard': (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,

      
    );
  }
}
