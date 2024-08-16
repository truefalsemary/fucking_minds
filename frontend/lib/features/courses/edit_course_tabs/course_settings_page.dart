import 'package:flutter/material.dart';
import 'package:lms_front/features/courses/edit_course_tabs/course_program_tab.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';
import 'package:lms_front/ui_kit/ui_kit.dart';

const _spacerBetweenFields = SizedBox(height: 44);

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
                  TabContentWrapper(child: ProgramTab()),
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

class _ForStudents extends StatelessWidget {
  const _ForStudents();

  @override
  Widget build(BuildContext context) {
    return const TextInputField(
      title: 'Для студентов',
      hint: 'Введите текст',
    );
  }
}

class _ForTeachersAndAdminsTextField extends StatelessWidget {
  const _ForTeachersAndAdminsTextField();

  @override
  Widget build(BuildContext context) {
    return const TextInputField(
      title: 'Для преподавателя и администратора',
      hint: 'Разрешено только для преподавателя и администратора',
    );
  }
}

class _TagsField extends StatelessWidget {
  const _TagsField();

  @override
  Widget build(BuildContext context) {
    return const TextInputField(
      title: 'Теги',
      hint: 'Теги курса, через запятую',
    );
  }
}

class _CourseDatesField extends StatelessWidget {
  const _CourseDatesField();

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: DatePickerInputField(),
      alignment: Alignment.centerLeft,
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  const _DescriptionTextField();

  @override
  Widget build(BuildContext context) {
    return const TextInputField(
      title: 'Описание',
      hint: 'Описание курса',
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _DescriptionTextField(),
            _spacerBetweenFields,
            _CourseDatesField(),
            _spacerBetweenFields,
            _TagsField(),
            _spacerBetweenFields,
            _ForTeachersAndAdminsTextField(),
            _spacerBetweenFields,
            _ForStudents(),
          ],
        ),
      ),
    );
  }
}
