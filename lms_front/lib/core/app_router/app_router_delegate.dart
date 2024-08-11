import 'package:go_router/go_router.dart';
import 'package:lms_front/core/app_router/routes.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/features/courses/course_page.dart';
import 'package:lms_front/features/courses/course_settings_page.dart';
import 'package:lms_front/features/courses/list_courses_page.dart';
import 'package:lms_front/features/main_page/main_page.dart';

const _logTag = '[AppRouterDelegate]';

class AppRouterDelegate {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: Routes.home,
          builder: (context, state) => const MainPage(),
          routes: [
            GoRoute(
              path: Routes.courses,
              builder: (context, state) => const ListCoursesPage(),
            ),
            GoRoute(
              path: Routes.filteredCourses,
              builder: (context, state) {
                Log.info('$_logTag : ${state.path}');
                final filterParameter = state.pathParameters['filter'];
                final filter = ListCoursesFilter.fromString(filterParameter);
                Log.info('$_logTag : ${state.path}');

                return ListCoursesPage(filter: filter);
              },
            ),
            GoRoute(
              path: Routes.course,
              builder: (context, state) {
                Log.info('$_logTag : ${state.path}');
                final courseId = state.pathParameters['courseId']!;
                Log.info('$_logTag : ${state.path}');

                return CoursePage(courseId: courseId);
              },
            ),
            GoRoute(
              path: Routes.courseSettings,
              builder: (context, state) {
                final courseId = state.pathParameters['courseId']!;
                return CourseSettingsPage(
                  courseId: courseId,
                );
              },
            ),
          ]),
    ],
  );
}
