import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/ui_kit.dart';

const _spacerBetweenFields = SizedBox(height: 44);

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
