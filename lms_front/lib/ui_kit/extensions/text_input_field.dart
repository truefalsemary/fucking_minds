import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field_theme.dart';

extension TextInputFieldExt on BuildContext {
  TextInputFieldTheme get textInputFieldTheme =>
      Theme.of(this).extension<TextInputFieldTheme>()!;
}
