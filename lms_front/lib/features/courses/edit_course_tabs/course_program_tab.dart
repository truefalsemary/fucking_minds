import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class ProgramTab extends StatelessWidget {
  const ProgramTab({super.key});

  static const _defaultSpacer = SizedBox(height: 44);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 115,
        right: 115,
        top: 64,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProgramHeader(),
            SizedBox(height: 52),
            _LessonNameTextField(),
            _defaultSpacer,
            _LessonDescriptionTextField(),
            _defaultSpacer,
            _LessonMaterialsSection(),
            _defaultSpacer,
            _LessonTasksSection(),
          ],
        ),
      ),
    );
  }
}

class _LessonTasksSection extends StatelessWidget {
  const _LessonTasksSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Задания',
          style: context.appTextTheme.header1,
        ),
        const SizedBox(height: 24),
        AppIcons.circlePlus,
      ],
    );
  }
}

class _LessonMaterialsSection extends StatelessWidget {
  const _LessonMaterialsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Материалы',
          style: context.appTextTheme.header1,
        ),
        const SizedBox(height: 24),
        AppIcons.circlePlus,
      ],
    );
  }
}

class _LessonDescriptionTextField extends StatelessWidget {
  const _LessonDescriptionTextField();

  @override
  Widget build(BuildContext context) {
    return const TextInputField(
      title: 'Описание урока',
      hint: 'Введите текст',
    );
  }
}

class _LessonNameTextField extends StatelessWidget {
  const _LessonNameTextField();

  @override
  Widget build(BuildContext context) {
    return const TextInputField(
      title: 'Название урока',
      hint: 'Введите текст',
      minLines: 1,
    );
  }
}

class _ProgramHeader extends StatelessWidget {
  const _ProgramHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Создание нового урока',
      style: context.appTextTheme.display2,
    );
  }
}
