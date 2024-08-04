import 'package:flutter/material.dart';
import 'package:lms_front/core/app.dart';
import 'package:lms_front/core/di/di_container.dart';

void main() {
  runApp(App(DiContainer()..init()));
}
