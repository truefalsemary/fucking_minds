import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';

class DatePickerInputFieldTheme
    extends ThemeExtension<DatePickerInputFieldTheme> {
  const DatePickerInputFieldTheme({
    required this.borderColor,
  });

  factory DatePickerInputFieldTheme.light() => const DatePickerInputFieldTheme(
        borderColor: ColorPalette.borderColor,
      );

  final Color borderColor;

  @override
  DatePickerInputFieldTheme lerp(
      ThemeExtension<DatePickerInputFieldTheme>? other, double t) {
    if (other is! DatePickerInputFieldTheme) {
      return this;
    }
    return DatePickerInputFieldTheme(
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }

  @override
  DatePickerInputFieldTheme copyWith({Color? borderColor}) {
    return DatePickerInputFieldTheme(
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

extension DatePickerInputFieldThemeCtx on BuildContext {
  DatePickerInputFieldTheme get datePickerInputFieldTheme =>
      Theme.of(this).extension<DatePickerInputFieldTheme>()!;
}
