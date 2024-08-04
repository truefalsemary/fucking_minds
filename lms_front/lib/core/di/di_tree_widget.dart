import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/app_router/app_router_inh.dart';
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
    return AppRouter(
      router: _diContainer.routerDelegate.router,
      child: builder(context),
    );
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [],
        child: AppRouter(
          router: _diContainer.routerDelegate.router,
          child: builder(context),
        ),
      ),
    );
  }
}
