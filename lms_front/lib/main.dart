import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:lms_front/core/app.dart';
import 'package:lms_front/core/di/di_container.dart';

void main() {
  // usePathUrlStrategy();
  runApp(App(DiContainer()..init()));
}
