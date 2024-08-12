import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_front/core/logger/logger.dart';
import 'package:lms_front/core/networking/api_client/api_client.dart';
import 'package:lms_front/features/courses/course_page.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_settings_page.dart';
import 'package:lms_front/features/courses/list_courses_page.dart';
import 'package:lms_front/features/main_page/course_list/course_list_sort_cubit/course_list_sort_cubit.dart';
import 'package:lms_front/features/main_page/page/main_page.dart';
import 'package:lms_front/features/shared/data/repository_impl/course_repository_impl.dart';
import 'package:lms_front/features/shared/domain/course_list_bloc/course_list_bloc.dart';
import 'package:lms_front/features/shared/domain/course_list_bloc/course_list_event.dart';

const _logTag = '[AppRouterDelegate]';

class AppRouterDelegate {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) {
                      final apiClient = context.read<ApiClient>();
                      final repository = CourseRepositoryImpl(apiClient);
                      return CourseListBloc(repository: repository)
                        ..add(CourseListFetched());
                    },
                  ),
                  BlocProvider(
                    create: (context) => CourseListSortCubit(),
                  ),
                ],
                child: const MainPage(),
              ),
          routes: [
            GoRoute(
              path: 'courses',
              builder: (context, state) => const ListCoursesPage(),
            ),
            GoRoute(
              path: 'courses/:filter',
              builder: (context, state) {
                Log.info('$_logTag : ${state.path}');
                final filterParameter = state.pathParameters['filter'];
                final filter = ListCoursesFilter.fromString(filterParameter);
                Log.info('$_logTag : ${state.path}');

                return ListCoursesPage(filter: filter);
              },
            ),
            GoRoute(
              path: 'course/:courseId',
              builder: (context, state) {
                Log.info('$_logTag : ${state.path}');
                final courseId = state.pathParameters['courseId']!;
                Log.info('$_logTag : ${state.path}');

                return CoursePage(courseId: courseId);
              },
              routes: [
                GoRoute(
                  path: 'settings',
                  builder: (context, state) {
                    final courseId = state.pathParameters['courseId']!;
                    return CourseSettingsPage(
                      courseId: courseId,
                    );
                  },
                ),
              ],
            ),
          ]),
    ],
  );
}
