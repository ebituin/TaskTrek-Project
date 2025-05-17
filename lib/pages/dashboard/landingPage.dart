import 'package:flutter/material.dart';
import 'package:tasktrek/pages/home/logIn.dart';
import 'package:tasktrek/styles/styles.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Route _createFadeRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => const logIn(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(_createFadeRoute());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.primaryColor,
        child: Image.asset('lib/assets/images/Logo.png'),
      ),
    );
  }
}
