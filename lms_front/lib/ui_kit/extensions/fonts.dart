import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

extension Fonts on BuildContext {
  AppTextTheme get appTextTheme => Theme.of(this).extension<AppTextTheme>()!;
}
