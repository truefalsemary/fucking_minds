import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/app_colors.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: AppColors.backgroundColor,
  extensions: [
    AppTextTheme.light(),
  ],
);
