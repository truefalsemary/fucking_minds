import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:lms_front/core/app.dart';
import 'package:lms_front/core/di/di_container.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBloc.storage = storage;

  FlutterError.onError = (details) {
    Log.error(details.exceptionAsString(), trace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    Log.error(error, trace: stack);
    return true;
  };

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      // setPathUrlStrategy();

      runApp(App(DiContainer()..init()));
    },
    (error, stackTrace) => Log.error(
      error,
      trace: stackTrace,
    ),
  );
}
