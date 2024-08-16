import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/app_router/app_router_inh.dart';
import 'package:lms_front/core/di/di_container.dart';
import 'package:lms_front/features/shared/data/repository_impl/course_repository_impl.dart';
import 'package:lms_front/features/shared/data/repository_impl/lesson_repository_impl.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _diContainer.httpClient,
        ),
        RepositoryProvider(
          create: (context) => CourseRepositoryImpl(_diContainer.httpClient),
        ),
        RepositoryProvider(
          create: (context) => LessonRepositoryImpl(_diContainer.httpClient),
        ),
      ],
      child: AppRouter(
        router: _diContainer.routerDelegate.router,
        child: child,
      ),
    );
  }
}
