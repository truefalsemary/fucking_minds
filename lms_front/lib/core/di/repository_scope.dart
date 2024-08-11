import 'package:flutter/material.dart';
import 'package:lms_front/core/app_router/app_router_inh.dart';
import 'package:lms_front/core/di/di_container.dart';

/// This widget is used to create and provide repositories
/// it has [_diContainer] as a dependency to create repositories
class RepositoryScope extends StatelessWidget {
  const RepositoryScope(
    this._diContainer, {
    required this.child,
    super.key,
  });

  final DiContainer _diContainer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppRouter(
      router: _diContainer.routerDelegate.router,
      child: child,
    );
  }
}
