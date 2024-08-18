import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_settings_page.dart';
import 'package:lms_front/features/courses/single_course/presentation/page/single_course_page.dart';
import 'package:lms_front/features/shared/data/repository_impl/course_repository_impl.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_cubit.dart';

class CourseLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        '/course/:courseId',
        '/course/:courseId/settings',
        '/course/:courseId/:tabName',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final courseId = state.pathParameters['courseId'];
    if (courseId == null || courseId.isEmpty) {
      return [
        const BeamPage(
          key: ValueKey('Error'),
          title: 'Error',
          child: Scaffold(
            body: Center(
              child: Text('Course ID is missing or invalid.'),
            ),
          ),
        ),
      ];
    }

    final segments = state.uri.pathSegments;
    final path = state.uri.path;

    if (path.endsWith('/settings')) {
      return [
        BeamPage(
          key: const ValueKey('CourseSettings'),
          title: 'Course Settings',
          child: CourseSettingsPage(courseId: courseId),
        ),
      ];
    } else if (segments.length == 2) {
      // Only /course/:courseId
      return [
        BeamPage(
          key: ValueKey('Course-$courseId'),
          title: 'Course $courseId',
          child: BlocProvider(
            create: (context) => SingleCourseCubit(
              repository: context.read<CourseRepositoryImpl>(),
              courseId: courseId,
            )..fetchCourse(),
            child: SingleCoursePage(
              courseId: courseId,
              initialTabName: 'Lessons', // Default tab name if not specified
            ),
          ),
        ),
      ];
    } else if (segments.length == 3) {
      // /course/:courseId/:tabName
      final tabName = state.pathParameters['tabName']!;
      return [
        BeamPage(
          key: ValueKey('Course-$courseId-Tab-$tabName'),
          title: 'Course $courseId - Tab $tabName',
          type: BeamPageType.noTransition,
          child: BlocProvider(
            create: (context) => SingleCourseCubit(
              repository: context.read<CourseRepositoryImpl>(),
              courseId: courseId,
            )..fetchCourse(),
            child: SingleCoursePage(
              courseId: courseId,
              initialTabName: tabName,
            ),
          ),
        ),
      ];
    } else {
      return [];
    }
  }
}
