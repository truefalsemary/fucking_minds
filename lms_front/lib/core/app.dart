import 'package:flutter/material.dart';
import 'package:lms_front/core/di_configuration_widget.dart';
import 'package:lms_front/core/di_container.dart';

class App extends StatelessWidget {
  const App(this._diContainer, {super.key});

  final DiContainer _diContainer;

  @override
  Widget build(BuildContext context) {
    return DiConfigurationWidget(
      _diContainer,
      builder: (context) {
        return const MaterialApp();
      },
    );
  }
}
