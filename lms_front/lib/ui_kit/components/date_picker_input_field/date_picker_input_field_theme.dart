import 'package:flutter/material.dart';

class DatePickerInputFieldTheme
    extends ThemeExtension<DatePickerInputFieldTheme> {
  const DatePickerInputFieldTheme({
    required this.borderColor,
  });

  factory DatePickerInputFieldTheme.light() => const DatePickerInputFieldTheme(
        borderColor: Color(0xFFE0E0E0),
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
