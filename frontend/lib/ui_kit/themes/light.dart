import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field_theme.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field_theme.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: ColorPalette.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorPalette.backgroundColor,
  ),
  inputDecorationTheme: const InputDecorationTheme().copyWith(
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.2,
      ),
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.2,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.2,
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    tabAlignment: TabAlignment.start,
    labelPadding: EdgeInsets.zero,
    indicatorColor: Colors.black,
    labelColor: const Color(0xFF348BDC),
    unselectedLabelColor: const Color.fromRGBO(0, 0, 0, 0.85),
    indicatorSize: TabBarIndicatorSize.label,
    indicator: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      border: Border(
        top: BorderSide(),
        left: BorderSide(),
        right: BorderSide(),
      ),
    ),
    dividerColor: Colors.black,
    dividerHeight: 0.000000001,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  ),
  extensions: [
    AppTextTheme.light(),
    TextInputFieldTheme.light(),
    DatePickerInputFieldTheme.light(),
  ],
);
