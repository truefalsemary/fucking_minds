import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lms_front/core/di/di_container.dart';
import 'package:lms_front/core/di/repository_scope.dart';
import 'package:lms_front/ui_kit/ui_kit.dart';

/// Main app entry point with DI and RepositoryScope
class App extends StatelessWidget {
  const App(
    this._diContainer, {
    super.key,
  });

  final DiContainer _diContainer;

  @override
  Widget build(BuildContext context) {
    return RepositoryScope(
      _diContainer,
      child: MaterialApp.router(
        theme: lightTheme,
        locale: const Locale('ru'),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) => locale,
        debugShowCheckedModeBanner: false,
        routerConfig: _diContainer.routerDelegate.router,
      ),
    );
  }
}
