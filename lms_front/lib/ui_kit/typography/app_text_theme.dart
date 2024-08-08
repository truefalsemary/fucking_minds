import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/ui_kit.dart';

class AppTextTheme {
  static const fontFamily = 'Inter';

  static const textTheme = TextTheme(
    labelLarge: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 12,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontSize: 8,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontSize: 14,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 20,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 24,
    ),
  );
}
