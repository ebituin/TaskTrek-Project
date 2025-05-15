import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF23A18F);
  static const Color accentColor = Color(0xFF050A35);
  static const Color backgroundColor = Color(0xFF278696);
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
