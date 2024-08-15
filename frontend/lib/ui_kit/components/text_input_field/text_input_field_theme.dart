import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';

class TextInputFieldTheme extends ThemeExtension<TextInputFieldTheme> {
  final InputBorder? border;
  final int? minLines;
  final int? maxLines;

  const TextInputFieldTheme({
    this.border,
    this.minLines,
    this.maxLines,
  });

  factory TextInputFieldTheme.light() {
    return const TextInputFieldTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorPalette.borderColor,
        ),
      ),
      minLines: 3,
    );
  }

  @override
  TextInputFieldTheme copyWith({InputBorder? border}) {
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
      border: other.border,
      minLines: other.minLines,
      maxLines: other.maxLines,
    );
  }
}

extension TextInputFieldExt on BuildContext {
  TextInputFieldTheme get textInputFieldTheme =>
      Theme.of(this).extension<TextInputFieldTheme>()!;
}
