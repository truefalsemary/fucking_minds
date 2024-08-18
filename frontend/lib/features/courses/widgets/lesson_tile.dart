import 'package:flutter/material.dart';
import 'package:lms_front/ui_kit/app_shadows.dart';
import 'package:lms_front/ui_kit/typography/app_text_theme.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({
    required this.title,
    required this.description,
    this.onCourseTap,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback? onCourseTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          AppShadows.card,
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListTile(
        onTap: onCourseTap,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: context.appTextTheme.header2,
          ),
        ),
        subtitle: Text(
          description,
          style: context.appTextTheme.body2,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 28,
        ),
        trailing: const SizedBox(
          child: Icon(
            Icons.chevron_right,
            size: 38,
          ),
        ),
      ),
    );
  }
}

final mockLessons = [
  const LessonTile(
    title: 'Базовый Dart',
    description: 'Введение в язык с полного нуля.',
  ),
  const LessonTile(
    title: 'Основы Flutter',
    description:
        'Введение в фреймворк Flutter на языке Dart, разбираемся с концепцией виджетов...',
  ),
  const LessonTile(
    title: 'Работа с Git',
    description: 'Инструменты для работы с удаленным репозиторием.',
  ),
  const LessonTile(
    title: 'Продвинутый Dart',
    description:
        'Разбор сложных концепций на языке Dart, таких как абстракции, миксины и генераторы.',
  ),
  const LessonTile(
    title: 'Разработка UI на Flutter',
    description:
        'Создание пользовательских интерфейсов с использованием Flutter, кастомизация виджетов.',
  ),
  const LessonTile(
    title: 'Стейт-менеджмент во Flutter',
    description:
        'Изучение методик управления состоянием в приложениях, используя Provider, Riverpod и Bloc.',
  ),
  const LessonTile(
    title: 'Работа с API в Flutter',
    description:
        'Интеграция REST API и GraphQL в ваше приложение на Flutter, обработка данных и обновление интерфейса.',
  ),
  const LessonTile(
    title: 'Flutter и Firebase',
    description:
        'Использование Firebase для добавления баз данных, аутентификации, аналитики и других возможностей.',
  ),
  const LessonTile(
    title: 'CI/CD для проектов на Flutter',
    description:
        'Автоматизация сборки, тестирования и деплоя приложений на Flutter с помощью CI/CD.',
  ),
  const LessonTile(
    title: 'Тестирование Flutter-приложений',
    description:
        'Изучение юнит-тестирования, widget-тестирования и интеграционного тестирования во Flutter.',
  ),
  const LessonTile(
    title: 'Работа с хранилищами данных во Flutter',
    description:
        'Использование локальных баз данных, таких как SQLite и Hive, а также интеграция с удаленными базами данных.',
  ),
  const LessonTile(
    title: 'Flutter для веба',
    description:
        'Разработка кроссплатформенных веб-приложений с использованием Flutter.',
  ),
  const LessonTile(
    title: 'Оптимизация производительности во Flutter',
    description:
        'Практические советы по улучшению производительности приложения на всех платформах с использованием Flutter.',
  ),
];
