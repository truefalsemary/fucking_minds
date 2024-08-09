import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/typography/app_text_styles.dart';

/// [ThemeExtension] implemented as a [AppTextTheme] class
/// representing all the typography in GravityUI kit
///
/// You can use different styles depending on the theme
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  AppTextTheme({
    required this.display4,
    required this.display3,
    required this.display2,
    required this.display1,
    required this.header2,
    required this.header1,
    required this.subheader3,
    required this.subheader2,
    required this.subheader1,
    required this.body3,
    required this.body2,
    required this.body1,
    required this.body1Short,
    required this.caption2,
    required this.caption1,
    required this.code3,
    required this.code3Inline,
    required this.code2,
    required this.code2Inline,
    required this.code1,
    required this.code1Inline,
  });

  // Display
  final TextStyle display4;
  final TextStyle display3;
  final TextStyle display2;
  final TextStyle display1;

  // Header
  final TextStyle header2;
  final TextStyle header1;

  // Subheader
  final TextStyle subheader3;
  final TextStyle subheader2;
  final TextStyle subheader1;

  // Body
  final TextStyle body3;
  final TextStyle body2;
  final TextStyle body1;
  final TextStyle body1Short;

  // Caption
  final TextStyle caption2;
  final TextStyle caption1;

  // Misc (monospace and code)
  final TextStyle code3;
  final TextStyle code3Inline;
  final TextStyle code2;
  final TextStyle code2Inline;
  final TextStyle code1;
  final TextStyle code1Inline;

  @override
  AppTextTheme copyWith({
    TextStyle? display4,
    TextStyle? display3,
    TextStyle? display2,
    TextStyle? display1,
    TextStyle? header3,
    TextStyle? header2,
    TextStyle? header1,
    TextStyle? subheader3,
    TextStyle? subheader2,
    TextStyle? subheader1,
    TextStyle? body3,
    TextStyle? body2,
    TextStyle? body1,
    TextStyle? body1Short,
    TextStyle? caption2,
    TextStyle? caption1,
    TextStyle? code3,
    TextStyle? code3Inline,
    TextStyle? code2,
    TextStyle? code2Inline,
    TextStyle? code1,
    TextStyle? code1Inline,
  }) {
    return AppTextTheme(
      display4: display4 ?? this.display4,
      display3: display3 ?? this.display3,
      display2: display2 ?? this.display2,
      display1: display1 ?? this.display1,
      header2: header2 ?? this.header2,
      header1: header1 ?? this.header1,
      subheader3: subheader3 ?? this.subheader3,
      subheader2: subheader2 ?? this.subheader2,
      subheader1: subheader1 ?? this.subheader1,
      body3: body3 ?? this.body3,
      body2: body2 ?? this.body2,
      body1: body1 ?? this.body1,
      body1Short: body1Short ?? this.body1Short,
      caption2: caption2 ?? this.caption2,
      caption1: caption1 ?? this.caption1,
      code3: code3 ?? this.code3,
      code3Inline: code3Inline ?? this.code3Inline,
      code2: code2 ?? this.code2,
      code2Inline: code2Inline ?? this.code2Inline,
      code1: code1 ?? this.code1,
      code1Inline: code1Inline ?? this.code1Inline,
    );
  }

  // Interpolation function for text transforming between themes
  // basically it just lerp between all the text styles
  @override
  AppTextTheme lerp(ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme(
        display4: TextStyle.lerp(display4, other.display4, t)!,
        display3: TextStyle.lerp(display3, other.display3, t)!,
        display2: TextStyle.lerp(display2, other.display2, t)!,
        display1: TextStyle.lerp(display1, other.display1, t)!,
        header2: TextStyle.lerp(header2, other.header2, t)!,
        header1: TextStyle.lerp(header1, other.header1, t)!,
        subheader3: TextStyle.lerp(subheader3, other.subheader3, t)!,
        subheader2: TextStyle.lerp(subheader2, other.subheader2, t)!,
        subheader1: TextStyle.lerp(subheader1, other.subheader1, t)!,
        body3: TextStyle.lerp(body3, other.body3, t)!,
        body2: TextStyle.lerp(body2, other.body2, t)!,
        body1: TextStyle.lerp(body1, other.body1, t)!,
        body1Short: TextStyle.lerp(body1Short, other.body1Short, t)!,
        caption2: TextStyle.lerp(caption2, other.caption2, t)!,
        caption1: TextStyle.lerp(caption1, other.caption1, t)!,
        code3: TextStyle.lerp(code3, other.code3, t)!,
        code3Inline: TextStyle.lerp(code3Inline, other.code3Inline, t)!,
        code2: TextStyle.lerp(code2, other.code2, t)!,
        code2Inline: TextStyle.lerp(code2Inline, other.code2Inline, t)!,
        code1: TextStyle.lerp(code1, other.code1, t)!,
        code1Inline: TextStyle.lerp(code1Inline, other.code1Inline, t)!);
  }

  factory AppTextTheme.light() {
    return AppTextTheme(
      display4: AppTextStyles.display4,
      display3: AppTextStyles.display3,
      display2: AppTextStyles.display2,
      display1: AppTextStyles.display1,
      header2: AppTextStyles.header2,
      header1: AppTextStyles.header1,
      subheader3: AppTextStyles.subheader3,
      subheader2: AppTextStyles.subheader2,
      subheader1: AppTextStyles.subheader1,
      body3: AppTextStyles.body3,
      body2: AppTextStyles.body2,
      body1: AppTextStyles.body1,
      body1Short: AppTextStyles.body1Short,
      caption2: AppTextStyles.caption2,
      caption1: AppTextStyles.caption1,
      code3: AppTextStyles.code3,
      code3Inline: AppTextStyles.code3Inline,
      code2: AppTextStyles.code2,
      code2Inline: AppTextStyles.code2Inline,
      code1: AppTextStyles.code1,
      code1Inline: AppTextStyles.code1Inline,
    );
  }

  factory AppTextTheme.dark() => AppTextTheme.light();
}
