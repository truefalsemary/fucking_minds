import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field_theme.dart';

extension DatePickerInputFieldThemeCtx on BuildContext {
  DatePickerInputFieldTheme get datePickerInputFieldTheme =>
      Theme.of(this).extension<DatePickerInputFieldTheme>()!;
}
