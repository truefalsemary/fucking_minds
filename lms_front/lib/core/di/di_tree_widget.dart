import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/di/di_container.dart';

class DiTreeWidget extends StatelessWidget {
  const DiTreeWidget(
    this._diContainer, {
    required this.builder,
    super.key,
  });

  final DiContainer _diContainer;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context);
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [],
        child: builder(context),
      ),
    );
  }
}
