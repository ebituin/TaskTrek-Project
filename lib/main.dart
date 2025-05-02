import 'package:flutter/material.dart';
import 'package:tasktrek/pages/dashBoard.dart';
import 'package:tasktrek/pages/forgotPassword.dart';
import 'package:tasktrek/pages/homePageV2.dart';
import 'package:tasktrek/pages/signUp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
        '/Forgot': (context) => ForgotPage(),
        '/DashBoard': (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
