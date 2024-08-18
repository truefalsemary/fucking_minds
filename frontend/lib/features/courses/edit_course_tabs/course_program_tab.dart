import 'package:flutter/material.dart';
import 'package:lms_front/features/auth/presentation/widgets/auth_button.dart';
import 'package:lms_front/features/courses/edit_course_tabs/resource_modal_content.dart';
import 'package:lms_front/features/courses/widgets/lesson_tile.dart';
import 'package:lms_front/ui_kit/app_icons.dart';
import 'package:lms_front/ui_kit/app_shadows.dart';
import 'package:lms_front/ui_kit/colors/color_palette.dart';
import 'package:lms_front/ui_kit/components/text_input_field/text_input_field.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class CourseProgramTab extends StatelessWidget {
  const CourseProgramTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 115,
        vertical: 64,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: AuthButton(
                    inputText: 'Создать урок',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: _EditCourseModal(
                            defaultSpacer: SizedBox(height: 20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverList.separated(
            itemCount: lessonsMock.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: lessonsMock[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          )
        ],
      ),
    );
  }
}

class _EditCourseModal extends StatelessWidget {
  const _EditCourseModal({
    required SizedBox defaultSpacer,
  }) : _defaultSpacer = defaultSpacer;

  final SizedBox _defaultSpacer;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProgramHeader(),
            _defaultSpacer,
            const _LessonNameTextField(),
            _defaultSpacer,
            const _LessonDescriptionTextField(),
            _defaultSpacer,
            const _LessonMaterialsSection(),
            _defaultSpacer,
            const _LessonTasksSection(),
            _defaultSpacer,
            AuthButton(
              inputText: 'Сохранить',
              onPressed: () => {},
            ),
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
        IconButton(onPressed: () => (), icon: AppIcons.circlePlus),
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
        },
      ),
      icon: AppIcons.circlePlus,
    );
  }
}

class _LessonDescriptionTextField extends StatelessWidget {
  const _LessonDescriptionTextField();

  @override
  Widget build(BuildContext context) {
    return const TextInputField(
      controller: null,
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
      controller: null,
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

final lessonsMock = [
  const LessonTile(
    title: '1. Продвинутый Dart',
    description: 'Углублённое изучение языка Dart, особенности и тонкости.',
  ),
  const LessonTile(
    title: '2. Архитектура Flutter',
    description: 'Изучение архитектурных паттернов и подходов в приложениях.',
  ),
  const LessonTile(
    title: '3. Работа с базами данных в Flutter',
    description:
        'Изучаем подключение и работу с SQLite, Firebase и другими базами данных.',
  ),
  const LessonTile(
    title: '4. State Management в Flutter',
    description:
        'Оптимизация работы с состоянием: ScopedModel, Provider, Riverpod и другие',
  ),
  const LessonTile(
    title: '5. Анимации в Flutter',
    description: 'Создание плавных и динамичных анимаций в вашем приложении.',
  ),
  const LessonTile(
    title: '6. Тестирование в Flutter',
    description: 'Пишем Unit и UI тесты, покрытие кода тестами.',
  ),
  const LessonTile(
    title: '7. Работа с REST API',
    description: 'Изучаем взаимодействие с API: Dio, Http, Retrofit.',
  ),
  const LessonTile(
    title: '8. Flutter для веба',
    description: 'Создаём кросс-платформенные приложения для веба с Flutter.',
  ),
  const LessonTile(
    title: '9. Создание собственных виджетов',
    description: 'Освоение навыков создания кастомных виджетов в Flutter.',
  ),
  const LessonTile(
    title: '10. Оптимизация производительности приложения',
    description:
        'Учимся находить и устранять узкие места в производительности приложений на Flutter.',
  ),
];
