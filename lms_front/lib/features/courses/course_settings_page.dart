import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field.dart';

const _spacerBetweenFields = SizedBox(height: 44);

class CourseSettingsPage extends StatelessWidget {
  const CourseSettingsPage({
    required this.courseId,
    super.key,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Настройки курса: $courseId'),
              const _DescriptionTextField(),
              _spacerBetweenFields,
              const _CourseDatesField(),
              _spacerBetweenFields,
              const _TagsField(),
              _spacerBetweenFields,
              const _ForTeachersAndAdminsTextField(),
              _spacerBetweenFields,
              const _ForStudents(),
            ],
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
