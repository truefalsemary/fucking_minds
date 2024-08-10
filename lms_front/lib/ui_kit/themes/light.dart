import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/app_colors.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field_theme.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field_theme.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: Colors.black,
    labelColor: Color(0xFF348BDC),
    unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.85),
    dividerColor: Colors.black,
    dividerHeight: 0.5,
  ),
  extensions: [
    AppTextTheme.light(),
    TextInputFieldTheme.light(),
    DatePickerInputFieldTheme.light(),
  ],
);
