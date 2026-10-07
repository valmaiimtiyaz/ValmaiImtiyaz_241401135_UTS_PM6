import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static const String fontName = 'GoogleSansFlex';

  //design light mode
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.cream,
    primaryColor: AppColors.sageGreen,
    fontFamily: fontName,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.sageGreen,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: AppColors.sageGreen,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.sageGreen),
    ),
    iconTheme: const IconThemeData(color: AppColors.terracotta),
  );

  //design dark mode
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.terracotta,
    fontFamily: fontName,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.cream,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(color: AppColors.cream, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: AppColors.cream),
    ),
    iconTheme: const IconThemeData(color: AppColors.terracotta),
  );
}
