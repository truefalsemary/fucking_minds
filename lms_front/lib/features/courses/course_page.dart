import 'package:flutter/material.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_settings_page.dart';
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
    return DefaultTabController(
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
                  title: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      'Курс по Flutter',
                      style: context.appTextTheme.display2,
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  // TODO(any): сделать адаптивные таббары, чтобы при сужении экрана, таббары переходили на вторую строку
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
                  TabContentWrapper(child: SettingsTab()),
                  TabContentWrapper(
                      child: Icon(Icons.directions_transit, size: 350)),
                  TabContentWrapper(
                      child: Icon(Icons.directions_car, size: 350)),
                  TabContentWrapper(
                      child: Icon(Icons.directions_bike, size: 350)),
                  TabContentWrapper(
                      child: Icon(Icons.directions_boat, size: 350)),
                ]),
          ),
        ),
      ),
    );
  }
}
