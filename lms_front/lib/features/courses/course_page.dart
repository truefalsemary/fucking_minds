import 'package:flutter/material.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';
import 'package:lms_front/features/shared/presentation/user_profile_button.dart';

final lessons = [
  Lesson(
    id: '1',
    title: 'Знакомство с  основами языка Dart',
    description: '''
На уроке мы изучим язык Dart, научимся его использовать для построения консольных проектов для Flutter. 
Узнаем больше про Flutter, какие в нем есть компоненты, виджеты и события.
На основе Flutter мы за урок создадим приложение текст элементом приложения на Flutter являются виджеты. Фактически это те визуальные компоненты,из которых состоит
графический интерфейс
''',
    authorId: '1',
  ),
  Lesson(
    id: '1',
    title: 'Знакомство с  основами языка Dart',
    description: '''
На уроке мы изучим язык Dart, научимся его использовать для построения консольных проектов для Flutter. 
Узнаем больше про Flutter, какие в нем есть компоненты, виджеты и события.
На основе Flutter мы за урок создадим приложение текст элементом приложения на Flutter являются виджеты. Фактически это те визуальные компоненты,из которых состоит
графический интерфейс
''',
    authorId: '1',
  ),
  Lesson(
    id: '1',
    title: 'Знакомство с  основами языка Dart',
    description: '''
На уроке мы изучим язык Dart, научимся его использовать для построения консольных проектов для Flutter. 
Узнаем больше про Flutter, какие в нем есть компоненты, виджеты и события.
На основе Flutter мы за урок создадим приложение текст элементом приложения на Flutter являются виджеты. Фактически это те визуальные компоненты,из которых состоит
графический интерфейс
''',
    authorId: '1',
  ),
  Lesson(
    id: '1',
    title: 'Знакомство с  основами языка Dart',
    description: '''
На уроке мы изучим язык Dart, научимся его использовать для построения консольных проектов для Flutter. 
Узнаем больше про Flutter, какие в нем есть компоненты, виджеты и события.
На основе Flutter мы за урок создадим приложение текст элементом приложения на Flutter являются виджеты. Фактически это те визуальные компоненты,из которых состоит
графический интерфейс
''',
    authorId: '1',
  ),
  Lesson(
    id: '1',
    title: 'Знакомство с  основами языка Dart',
    description: '''
На уроке мы изучим язык Dart, научимся его использовать для построения консольных проектов для Flutter. 
Узнаем больше про Flutter, какие в нем есть компоненты, виджеты и события.
На основе Flutter мы за урок создадим приложение текст элементом приложения на Flutter являются виджеты. Фактически это те визуальные компоненты,из которых состоит
графический интерфейс
''',
    authorId: '1',
  ),
  Lesson(
    id: '1',
    title: 'Знакомство с  основами языка Dart',
    description: '''
На уроке мы изучим язык Dart, научимся его использовать для построения консольных проектов для Flutter. 
Узнаем больше про Flutter, какие в нем есть компоненты, виджеты и события.
На основе Flutter мы за урок создадим приложение текст элементом приложения на Flutter являются виджеты. Фактически это те визуальные компоненты,из которых состоит
графический интерфейс
''',
    authorId: '1',
  ),
];

class CoursePage extends StatefulWidget {
  final String courseId;
  const CoursePage({required this.courseId, super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Курс ...'),
        actions: const [
          UserProfileButton(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Text('Уроки'),
          ),
          SliverList.separated(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return Container(
                child: Text(lesson.title),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
