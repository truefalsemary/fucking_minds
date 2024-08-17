import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/features/auth/presentation/pages/first_auth_page.dart';
import 'package:lms_front/features/auth/presentation/pages/login_page.dart';
import 'package:lms_front/features/auth/presentation/pages/register_page.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_settings_page.dart';
import 'package:lms_front/features/courses/list_courses_page.dart';
import 'package:lms_front/features/courses/single_course/presentation/page/single_course_page.dart';
import 'package:lms_front/features/main_page/domain/course_list_sort_cubit/course_list_sort_cubit.dart';
import 'package:lms_front/features/main_page/presentation/page/main_page.dart';
import 'package:lms_front/features/shared/data/repository_impl/course_repository_impl.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_bloc.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_event.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_cubit.dart';

const _logTag = '[AppRouterDelegate]';

class AppRouterDelegate {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/first-auth',
        builder: (context, state) => const FistAuthPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const _MainPageBuilder(),
        routes: [
          /// ---
          GoRoute(
            path: 'courses',
            builder: (context, state) => const ListCoursesPage(),
          ),
          GoRoute(
            path: 'courses/:filter',
            builder: (context, state) =>
                _FilteredCourseListPageBuilder(state: state),
          ),

          /// --- с этим надо будет штото сдел0ть – убрать или заиспользовать
          GoRoute(
            path: 'course/:courseId',
            redirect: (context, state) {
              final courseId = state.pathParameters['courseId']!;
              return '/course/$courseId/program';
            },
          ),
          GoRoute(
            path: 'course/:courseId/settings',
            builder: (context, state) =>
                _CourseSettingsPageBuilder(state: state),
          ),
          GoRoute(
            path: 'course/:courseId/:tabName',
            builder: (context, state) => _SingleCoursePageBuilder(state: state),
          ),
        ],
      ),
    ],
  );
}

class _MainPageBuilder extends StatelessWidget {
  const _MainPageBuilder();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseListBloc(
            courseRepository: context.read<CourseRepositoryImpl>(),
          )..add(const CourseListFetched()),
        ),
        BlocProvider(
          create: (context) => CourseListSortCubit(),
        ),
      ],
      child: const MainPage(),
    );
  }
}

class _FilteredCourseListPageBuilder extends StatelessWidget {
  final GoRouterState state;
  const _FilteredCourseListPageBuilder({required this.state});

  @override
  Widget build(BuildContext context) {
    Log.info('$_logTag : ${state.path}');
    final filterParameter = state.pathParameters['filter'];
    final filter = ListCoursesFilter.fromString(filterParameter);
    Log.info('$_logTag : ${state.path}');
    return ListCoursesPage(filter: filter);
  }
}

class _SingleCoursePageBuilder extends StatelessWidget {
  final GoRouterState state;
  const _SingleCoursePageBuilder({required this.state});

  @override
  Widget build(BuildContext context) {
    Log.info('$_logTag : ${state.path}');
    final courseId = state.pathParameters['courseId']!;
    final tabName = state.pathParameters['tabName']!;
    Log.info('$_logTag : ${state.path}');
    return BlocProvider(
      create: (context) {
        return SingleCourseCubit(
          repository: context.read<CourseRepositoryImpl>(),
          courseId: courseId,
        )..fetchCourse();
      },
      child: SingleCoursePage(
        courseId: courseId,
        tabName: tabName,
      ),
    );
  }
}

class _CourseSettingsPageBuilder extends StatelessWidget {
  final GoRouterState state;
  const _CourseSettingsPageBuilder({required this.state});

  @override
  Widget build(BuildContext context) {
    final courseId = state.pathParameters['courseId']!;
    return CourseSettingsPage(courseId: courseId);
  }
}

// Для перемещения внутри TabView в будущем

// class _LessonDetailPageBuilder extends StatelessWidget {
//   final GoRouterState state;
//   const _LessonDetailPageBuilder({required this.state});

//   @override
//   Widget build(BuildContext context) {
//     final lessonId = state.pathParameters['lessonId']!;
//     return BlocProvider(
//       create: (context) => SingleLessonCubit(
//         repository: context.read<LessonRepositoryImpl>(),
//         lessonId: lessonId,
//       )..fetchLesson(),
//       child: LessonDetailPage(
//         lessonId: lessonId,
//       ),
//     );
//   }
// }
