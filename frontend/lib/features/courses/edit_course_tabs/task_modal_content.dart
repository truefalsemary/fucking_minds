import 'package:flutter/material.dart';
import 'package:lms_front/features/auth/presentation/widgets/auth_button.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/components/date_picker_input_field/date_picker_input_field.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class TaskModalContent extends StatefulWidget {
  const TaskModalContent({super.key});

  @override
  State<TaskModalContent> createState() => _TaskModalContentState();
}

class _TaskModalContentState extends State<TaskModalContent> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController deadlineForStudentController = TextEditingController();
  TextEditingController deadlineForReviewerController = TextEditingController();
  TextEditingController criteriaController = TextEditingController();

  static const heightBetweenFields = 20.0;

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    deadlineForStudentController.dispose();
    deadlineForReviewerController.dispose();
    criteriaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: heightBetweenFields),
              Text(
                'Создание задания',
                style: context.appTextTheme.header1,
              ),
              const SizedBox(height: heightBetweenFields),
              Text('Название задания', style: context.appTextTheme.body3),
              const SizedBox(height: heightBetweenFields / 2),
              Material(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Ссылка на материал',
                  ),
                  onChanged: (value) => taskTitleController.text = value,
                ),
              ),
              const SizedBox(height: heightBetweenFields),
              Text('Название задания', style: context.appTextTheme.body3),
              const SizedBox(height: heightBetweenFields / 2),
              Material(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Ссылка на материал',
                  ),
                  onChanged: (value) => taskTitleController.text = value,
                ),
              ),
              const SizedBox(height: heightBetweenFields),
              Text('Описание задания', style: context.appTextTheme.body3),
              const SizedBox(height: heightBetweenFields / 2),
              Material(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: '''На уроке мы изучим  Dart.''',
                  ),
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) => taskTitleController.text = value,
                ),
              ),
              const SizedBox(height: heightBetweenFields),
              DatePickerInputField(
                startDate: DateTime.now(),
                endDate: DateTime.now().add(const Duration(days: 365 * 1000)),
                title: 'Дедлайн для студента',
                titleStyle: context.appTextTheme.body3,
              ),
              const SizedBox(height: heightBetweenFields),
              DatePickerInputField(
                startDate: DateTime.now(),
                endDate: DateTime.now().add(const Duration(days: 365 * 1000)),
                title: 'Дедлайн для проверяющего',
                titleStyle: context.appTextTheme.body3,
              ),
              const SizedBox(height: heightBetweenFields),
              Text('Опишите критерии проверки',
                  style: context.appTextTheme.body3),
              const SizedBox(height: heightBetweenFields / 2),
              Material(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Введите текст',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) => taskTitleController.text = value,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(color: ColorPalette.borderColor),
                  AuthButton(
                    inputText: 'Сохранить',
                    hasMinumumSize: false,
                    onPressed: () {
                      // TODO: implement logic for sending value to backend
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Отменить'),
                    style: TextButton.styleFrom(
                      foregroundColor: ColorPalette.red,
                      textStyle: context.appTextTheme.body3,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
