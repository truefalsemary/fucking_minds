import 'package:flutter/material.dart';

/// This class defines only the 'size' and 'form" of text styles which is const
/// and defined by the GravityUI kit itself
///
/// It can be used across the app or in themes
class AppTextStyles {
  static const String _fontFamily = 'Inter';

  // +---------------------+
  // |   Display section   |
  // +---------------------+

  static const TextStyle display4 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 48,
    height: 52 / 48,
    letterSpacing: 0,
  );

  static const TextStyle display3 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 40,
    height: 48 / 40,
    letterSpacing: 0,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 32,
    height: 40 / 32,
    letterSpacing: 0,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 28,
    height: 36 / 28,
    letterSpacing: 0,
  );

  // +---------------------+
  // |   Header  section   |
  // +---------------------+

  static const TextStyle header2 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    height: 28 / 24,
    letterSpacing: 0,
  );

  static const TextStyle header1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 24 / 20,
    letterSpacing: 0,
  );

  // +-----------------------+
  // |   Subheader section   |
  // +-----------------------+

  static const TextStyle subheader3 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static const TextStyle subheader2 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 20 / 15,
    letterSpacing: 0,
  );

  static const TextStyle subheader1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 18 / 13,
    letterSpacing: 0,
  );

  // +-------------------+
  // |   Body  section   |
  // +-------------------+

  static const TextStyle body3 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    height: 24 / 17,
    letterSpacing: 0,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 20 / 15,
    letterSpacing: 0,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 18 / 13,
    letterSpacing: 0,
  );

  static const TextStyle body1Short = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 16 / 13,
    letterSpacing: 0,
  );

  // +---------------------+
  // |   Caption section   |
  // +---------------------+

  static const TextStyle caption2 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 16 / 11,
    letterSpacing: 0,
  );

  static const TextStyle caption1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 9,
    height: 12 / 9,
    letterSpacing: 0,
  );

  // +------------------+
  // |   Misc section   |
  // +------------------+

  static const TextStyle code3 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0,
  );

  static const TextStyle code3Inline = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 20 / 16,
    letterSpacing: 0,
  );

  static const TextStyle code2 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0,
  );

  static const TextStyle code2Inline = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 16 / 14,
    letterSpacing: 0,
  );

  static const TextStyle code1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 18 / 12,
    letterSpacing: 0,
  );

  static const TextStyle code1Inline = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 14 / 12,
    letterSpacing: 0,
  );
}
