import 'package:flutter/material.dart';

import 'package:lms_front/ui_kit/colors/color_palette.dart';

class CardTheme extends ThemeExtension<CardTheme> {
  const CardTheme({
    required this.color,
  });

  factory CardTheme.light() {
    return const CardTheme(color: ColorPalette.backgroundColor);
  }

  factory CardTheme.dark() {
    return const CardTheme(color: ColorPalette.backgroundColor);
  }

  final Color color;

  @override
  CardTheme copyWith({Color? color}) {
    return CardTheme(
      color: color ?? this.color,
    );
  }

  @override
  CardTheme lerp(ThemeExtension<CardTheme>? other, double t) {
    if (other is! CardTheme) {
      return this;
    }
    return CardTheme(
      color: Color.lerp(color, other.color, t)!,
    );
  }
}
