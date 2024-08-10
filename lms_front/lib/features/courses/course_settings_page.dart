import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

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
          body: const TabBarView(children: [
            SettingsTab(),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_bike, size: 350),
            Icon(Icons.directions_boat, size: 350),
          ]),
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
