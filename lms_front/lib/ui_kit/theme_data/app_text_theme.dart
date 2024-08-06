import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/ui_kit.dart';

class AppTextTheme {
  static const _fontFamily = 'Inter';

  static const textTheme = TextTheme(
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 12,
    ),
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontSize: 8,
    ),
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontSize: 14,
    ),
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 20,
    ),
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
      fontSize: 24,
    ),
  );
}
