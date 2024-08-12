import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  const AppColorScheme({
    required this.borderColor,
    required this.disabledBorderColor,
    required this.backgroundColor,
  });

  // Borders
  final Color borderColor;
  final Color disabledBorderColor;
  final Color backgroundColor;

  factory AppColorScheme.light() {
    return AppColorScheme(
      borderColor: Colors.grey.shade300,
      disabledBorderColor: Colors.grey.shade400,
      backgroundColor: Colors.white,
    );
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) {
      return this;
    }
    return AppColorScheme(
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      disabledBorderColor:
          Color.lerp(disabledBorderColor, other.disabledBorderColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? borderColor,
    Color? disabledBorderColor,
  }) {
    return AppColorScheme(
      borderColor: borderColor ?? this.borderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      backgroundColor: backgroundColor,
    );
  }
}

extension AppColorSchemeExt on BuildContext {
  AppColorScheme get appColorScheme =>
      Theme.of(this).extension<AppColorScheme>()!;
}
