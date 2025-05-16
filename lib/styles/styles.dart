import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF6C96B5);
  static const Color secondaryColor = Color(0xFF5E7EB2);
  static const Color accentColor = Color(0xFF050A35);
  static const Color backgroundColor = Color(0xFF278696);
  static const Color loginBackground = Color(0xFF638AA7);
  static const Color blackButton = Color(0xFF2C2C2C);
  static const Color textWelcome = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF82849A);
  static const Color textColor2 = Color(0xFF6CDAB3);
  static const Color errorColor = Color(0xFFAD292B);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.accentColor,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: AppColors.accentColor,
  );
  static const TextStyle body_title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.accentColor,
  );
  static const TextStyle body_subtitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.accentColor,
  );
  static const TextStyle time = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.accentColor,
  );
  static const TextStyle body_button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
}
