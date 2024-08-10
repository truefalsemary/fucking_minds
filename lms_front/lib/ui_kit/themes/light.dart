import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field_theme.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field_theme.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: ColorPalette.backgroundColor,
  extensions: [
    AppTextTheme.light(),
    TextInputFieldTheme.light(),
    DatePickerInputFieldTheme.light(),
  ],
);
