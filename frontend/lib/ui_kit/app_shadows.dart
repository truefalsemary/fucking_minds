import 'package:flutter/material.dart';

abstract class AppShadows {
  static const card = BoxShadow(
    color: Color(0x3f000000),
    blurRadius: 4,
    offset: Offset(0, 4),
  );

  static const cardWhite = BoxShadow(
    color: Colors.white,
    blurRadius: 4,
    offset: Offset(0, 4),
  );
}
