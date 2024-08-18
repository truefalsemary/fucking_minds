import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_front/features/courses/edit_course_tabs/resource_modal_content.dart';
import 'package:lms_front/features/courses/edit_course_tabs/task_modal_content.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/app_shadows.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class CourseProgramTab extends StatelessWidget {
  const CourseProgramTab({super.key});

  static const _defaultSpacer = SizedBox(height: 44);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 115,
        vertical: 64,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProgramHeader(),
            // _LessonNameTextField(),
            // _defaultSpacer,
            // _LessonDescriptionTextField(),
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
        _createTaskButton(context),
      ],
    );
  }

  IconButton _createTaskButton(BuildContext context) => IconButton(
        icon: AppIcons.circlePlus,
        onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: SizedBox(
                  width: 700,
                  height: 630,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ColorPalette.backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [AppShadows.card],
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TaskModalContent()),
                  ),
                ),
              );
            }),
      );
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
        _createResourceButton(context),
      ],
    );
  }

  IconButton _createResourceButton(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: SizedBox(
                width: 300,
                height: 180,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorPalette.backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [AppShadows.card],
                  ),
                  child: ResourceModalContent(),
                ),
              ),
            );
          }),
      icon: AppIcons.circlePlus,
    );
  }
}

// class _LessonDescriptionTextField extends StatelessWidget {
//   const _LessonDescriptionTextField();

//   @override
//   Widget build(BuildContext context) {
//     return const TextInputField(
//       title: 'Описание урока',
//       hint: 'Введите текст',
//     );
//   }
// }

// class _LessonNameTextField extends StatelessWidget {
//   const _LessonNameTextField();

//   @override
//   Widget build(BuildContext context) {
//     return const TextInputField(
//       title: 'Название урока',
//       hint: 'Введите текст',
//       minLines: 1,
//     );
//   }
// }

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
