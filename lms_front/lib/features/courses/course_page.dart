import 'package:flutter/material.dart';
import 'package:lms_front/features/courses/course_program_tab.dart';
import 'package:lms_front/features/courses/course_settings_page.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class CourseSettingsPage extends StatelessWidget {
  const CourseSettingsPage({
    required this.courseId,
    super.key,
  });

  static const tabsCount = 5;
  final String courseId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsCount,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Курс по Flutter',
                      style: context.appTextTheme.display2,
                    ),
                  ),
                ),
                pinned: true,
                floating: true,
                // TODO(any): сделать адаптивные таббары, чтобы при сужении экрана, таббары переходили на вторую строку
                bottom: const TabBar(
                  enableFeedback: false,
                  isScrollable: true,
                  tabs: [
                    Tab(child: Text('Настройки')),
                    Tab(child: Text('Программа')),
                    Tab(child: Text('Участники')),
                    Tab(child: Text('Проверка заданий')),
                    Tab(child: Text('Отчеты')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SettingsTab(),
                ProgramTab(),
                Icon(Icons.directions_car, size: 350),
                Icon(Icons.directions_bike, size: 350),
                Icon(Icons.directions_boat, size: 350),
              ]),
        ),
      ),
    );
  }
}
