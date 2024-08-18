import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_program_tab.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_settings_tab.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_students_tab.dart';
import 'package:lms_front/features/shared/data/repository_impl/course_repository_impl.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_cubit.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';
import 'package:lms_front/ui_kit/ui_kit.dart';

class CourseSettingsPage extends StatelessWidget {
  const CourseSettingsPage({
    required this.courseId,
    super.key,
  });

  static const tabsCount = 5;
  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleCourseCubit(
        repository: context.read<CourseRepositoryImpl>(),
        courseId: courseId,
      )..fetchCourse(),
      child: DefaultTabController(
        animationDuration: Duration.zero,
        length: tabsCount,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    centerTitle: false,
                    leading: BackButton(
                      onPressed: () {
                        final beamer = Beamer.of(context);
                        if (beamer.canBeamBack) {
                          beamer.beamBack();
                        } else {
                          beamer.beamToNamed('/course/$courseId/lessons');
                        }
                      },
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Курс по Flutter',
                        style: context.appTextTheme.display2,
                      ),
                    ),
                    pinned: true,
                    floating: true,
                    bottom: const TabBar(
                      enableFeedback: false,
                      isScrollable: true,
                      tabs: [
                        TabWrapper(child: Text('Настройки')),
                        TabWrapper(child: Text('Программа')),
                        TabWrapper(child: Text('Участники')),
                        TabWrapper(child: Text('Проверка заданий')),
                        TabWrapper(child: Text('Отчеты')),
                      ],
                    ),
                  ),
                ];
              },
              body: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  children: [
                    TabContentWrapper(child: CourseSettingsTab()),
                    TabContentWrapper(child: CourseProgramTab()),
                    TabContentWrapper(child: CourseStudentsTab()),
                    TabContentWrapper(
                        child: Icon(Icons.directions_bike, size: 350)),
                    TabContentWrapper(
                        child: Icon(Icons.directions_boat, size: 350)),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
