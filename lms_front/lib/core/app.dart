import 'package:flutter/material.dart';
import 'package:lms_front/core/di/di_container.dart';
import 'package:lms_front/core/di/di_tree_widget.dart';

class App extends StatelessWidget {
  const App(this._diContainer, {super.key});

  final DiContainer _diContainer;

  @override
  Widget build(BuildContext context) {
    return DiTreeWidget(
      _diContainer,
      builder: (context) {
        return const MaterialApp();
      },
    );
  }
}
