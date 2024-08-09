import 'package:flutter/material.dart';

class TextInputFieldTheme extends ThemeExtension<TextInputFieldTheme> {
  final ShapeBorder? border;
  final int? minLines;
  final int? maxLines;

  const TextInputFieldTheme({
    this.border,
    this.minLines,
    this.maxLines,
  });

  factory TextInputFieldTheme.light() {
    return const TextInputFieldTheme(
      border: OutlineInputBorder(),
      minLines: 3,
    );
  }

  @override
  TextInputFieldTheme copyWith({ShapeBorder? border}) {
    return TextInputFieldTheme(
      border: border ?? this.border,
      minLines: minLines,
      maxLines: maxLines,
    );
  }

  @override
  ThemeExtension<TextInputFieldTheme> lerp(
      ThemeExtension<TextInputFieldTheme>? other, double t) {
    if (other is! TextInputFieldTheme) {
      return this;
    }
    return TextInputFieldTheme(
      border: ShapeBorder.lerp(border, other.border, t),
      minLines: other.minLines,
      maxLines: other.maxLines,
    );
  }
}
