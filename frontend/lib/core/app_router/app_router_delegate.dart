import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/logger/logger.dart';
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

class AppRouterDelegate extends BeamerDelegate {
  AppRouterDelegate()
      : super(
          initialPath: '/',
          locationBuilder: RoutesLocationBuilder(
            routes: {
              '/': (context, state, data) => const _MainPageBuilder(),
              '/courses': (context, state, data) => const ListCoursesPage(),
              '/courses/:filter': (context, state, data) =>
                  _FilteredCourseListPageBuilder(state: state),
              '/course/:courseId': (context, state, data) {
                final courseId = state.pathParameters['courseId']!;
                return _SingleCoursePageBuilder(state: state);
                // return BeamGuard(
                //   pathPatterns: [],
                //   guardNonMatching: true,
                //   check: (context, location) => true,
                //   beamToNamed: (origin, target) => '/course/$courseId/program',
                // );
              },
              '/course/:courseId/settings': (context, state, data) =>
                  _CourseSettingsPageBuilder(state: state),
              '/course/:courseId/:tabName': (context, state, data) =>
                  _SingleCoursePageBuilder(state: state),
            },
          ),
        );
}

// class AppRouterDelegate extends StatelessWidget {
//   const AppRouterDelegate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BeamerProvider(
//       routerDelegate: BeamerRouterDelegate(),
//       child: MaterialApp.router(
//         routerDelegate: BeamerRouterDelegate(),
//         routeInformationParser: BeamerParser(),
//       ),
//     );
//   }
// }

class BeamerRouterDelegate extends BeamerDelegate {
  BeamerRouterDelegate()
      : super(
          initialPath: '/',
          locationBuilder: RoutesLocationBuilder(
            routes: {
              '/': (context, state, data) => const _MainPageBuilder(),
              '/courses': (context, state, data) => const ListCoursesPage(),
              '/courses/:filter': (context, state, data) =>
                  _FilteredCourseListPageBuilder(state: state),
              '/course/:courseId': (context, state, data) {
                final courseId = state.pathParameters['courseId']!;
                // return BeamRedirect('/course/$courseId/program');
                return BeamGuard(
                  pathPatterns: [],
                  guardNonMatching: true,
                  check: (context, location) => true,
                  beamToNamed: (origin, target) => '/course/$courseId/program',
                );
              },
              '/course/:courseId/settings': (context, state, data) =>
                  _CourseSettingsPageBuilder(state: state),
              '/course/:courseId/:tabName': (context, state, data) =>
                  _SingleCoursePageBuilder(state: state),
            },
          ),
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
  final BeamState state;
  const _FilteredCourseListPageBuilder({required this.state});

  @override
  Widget build(BuildContext context) {
    Log.info('$_logTag : ${state.uri}');
    final filterParameter = state.pathParameters['filter'];
    final filter = ListCoursesFilter.fromString(filterParameter);
    return ListCoursesPage(filter: filter);
  }
}

class _SingleCoursePageBuilder extends StatelessWidget {
  final BeamState state;
  const _SingleCoursePageBuilder({required this.state});

  @override
  Widget build(BuildContext context) {
    Log.info('$_logTag : ${state.uri}');
    final courseId = state.pathParameters['courseId']!;
    final tabName = state.pathParameters['tabName']!;
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
  final BeamState state;
  const _CourseSettingsPageBuilder({required this.state});

  @override
  Widget build(BuildContext context) {
    final courseId = state.pathParameters['courseId']!;
    return CourseSettingsPage(courseId: courseId);
  }
}

// For future TabView navigation

// class _LessonDetailPageBuilder extends StatelessWidget {
//   final BeamState state;
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


// final routerDelegate = BeamerDelegate(
//   locationBuilder: RoutesLocationBuilder(
//     routes: {
//       '/': (context, state, data) => const _MainPageBuilder(),
//       '/courses': (context, state, data) => const ListCoursesPage(),
//       '/courses/:filter': (context, state, data) =>
//           _FilteredCourseListPageBuilder(state: state),
//       '/course/:courseId': (context, state, data) {
//         final courseId = state.pathParameters['courseId']!;
//         // return BeamRedirect('/course/$courseId/program');
//         return BeamGuard(
//           pathPatterns: [],
//           guardNonMatching: true,
//           check: (context, location) => true,
//           beamToNamed: (origin, target) => '/course/$courseId/program',
//         );
//       },
//       '/course/:courseId/settings': (context, state, data) =>
//           _CourseSettingsPageBuilder(state: state),
//       '/course/:courseId/:tabName': (context, state, data) =>
//           _SingleCoursePageBuilder(state: state),
//     },
//   ),
// );
