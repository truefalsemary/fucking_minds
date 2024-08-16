import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lms_front/core/app.dart';
import 'package:lms_front/core/di/di_container.dart';
import 'package:lms_front/core/logger/logger.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  FlutterError.onError = (details) {
    Log.error(details.exceptionAsString(), trace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    Log.error(error, trace: stack);
    return true;
  };

  runZonedGuarded(
    () => runApp(App(DiContainer()..init())),
    (error, stackTrace) => Log.error(
      error,
      trace: stackTrace,
    ),
  );
}
