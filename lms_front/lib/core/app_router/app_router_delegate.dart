import 'package:go_router/go_router.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/features/courses/list_courses_page.dart';
import 'package:lms_front/features/main_page/main_page.dart';

const _logTag = '[AppRouterDelegate]';

class AppRouterDelegate {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/courses',
        builder: (context, state) => const ListCoursesPage(),
      ),
      GoRoute(
        path: '/courses/:filter',
        builder: (context, state) {
          Log.info('$_logTag : ${state.path}');
          final filterParameter = state.pathParameters['filter'];
          final filter = ListCoursesFilter.fromString(filterParameter);
          Log.info('$_logTag : ${state.path}');

          return ListCoursesPage(filter: filter);
        },
      ),
    ],
  );
}
