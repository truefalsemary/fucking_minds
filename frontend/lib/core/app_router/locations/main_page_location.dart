import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/main_page/domain/course_list_sort_cubit/course_list_sort_cubit.dart';
import 'package:lms_front/features/main_page/presentation/page/main_page.dart';
import 'package:lms_front/features/shared/data/repository_impl/course_repository_impl.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_bloc.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_event.dart';

class MainPageLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey('Main'),
        title: 'Main Page',
        type: BeamPageType.noTransition,
        child: MultiBlocProvider(
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
        ),
      ),
    ];
  }
}
