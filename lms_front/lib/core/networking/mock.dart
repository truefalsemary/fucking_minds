import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';
import 'package:lms_front/features/shared/data/models/course_related/task/task.dart';
import 'package:lms_front/features/shared/data/models/submissions/accepted/accepted_submission.dart';
import 'package:lms_front/features/shared/data/models/submissions/sent/sent_submission.dart';
import 'package:lms_front/features/shared/data/models/user/user.dart';
import 'package:lms_front/features/shared/data/models/user/user_role.dart';

class Mock {
  static final List<Course> mockCourses = [
    Course(
      id: 'course_1',
      title: 'Название курса 1',
      startDate: DateTime.parse('2024-08-10T19:12:15.292463'),
      endDate: DateTime.parse('2024-08-30T19:12:15.292479'),
      description: 'Это описание для курса 1.',
      authorId: 'author_3',
    ),
    Course(
      id: 'course_2',
      title: 'Название курса 2',
      startDate: DateTime.parse('2024-07-14T19:12:15.292510'),
      endDate: null,
      description: 'Это описание для курса 2.',
      authorId: 'author_1',
    ),
    Course(
      id: 'course_3',
      title: 'Название курса 3',
      startDate: null,
      endDate: DateTime.parse('2024-08-21T19:12:15.292530'),
      description: 'Это описание для курса 3.',
      authorId: 'author_2',
    ),
    Course(
      id: 'course_4',
      title: 'Название курса 4',
      startDate: DateTime.parse('2024-08-11T19:12:15.292545'),
      endDate: DateTime.parse('2024-08-31T19:12:15.292552'),
      description: 'Это описание для курса 4.',
      authorId: 'author_4',
    ),
    Course(
      id: 'course_5',
      title: 'Название курса 5',
      startDate: DateTime.parse('2024-07-15T19:12:15.292560'),
      endDate: DateTime.parse('2024-09-08T19:12:15.292564'),
      description: 'Это описание для курса 5.',
      authorId: 'author_2',
    ),
    Course(
      id: 'course_6',
      title: 'Название курса 6',
      startDate: DateTime.parse('2024-08-02T19:12:15.292572'),
      endDate: DateTime.parse('2024-08-23T19:12:15.292578'),
      description: 'Это описание для курса 6.',
      authorId: 'author_2',
    ),
    Course(
      id: 'course_7',
      title: 'Название курса 7',
      startDate: DateTime.parse('2024-08-04T19:12:15.292584'),
      endDate: DateTime.parse('2024-08-17T19:12:15.292587'),
      description: 'Это описание для курса 7.',
      authorId: 'author_5',
    ),
    Course(
      id: 'course_8',
      title: 'Название курса 8',
      startDate: DateTime.parse('2024-07-20T19:12:15.292594'),
      endDate: DateTime.parse('2024-08-28T19:12:15.292598'),
      description: 'Это описание для курса 8.',
      authorId: 'author_1',
    ),
    Course(
      id: 'course_9',
      title: 'Название курса 9',
      startDate: DateTime.parse('2024-07-26T19:12:15.292603'),
      endDate: DateTime.parse('2024-08-16T19:12:15.292606'),
      description: 'Это описание для курса 9.',
      authorId: 'author_4',
    ),
    Course(
      id: 'course_10',
      title: 'Название курса 10',
      startDate: DateTime.parse('2024-08-06T19:12:15.292611'),
      endDate: DateTime.parse('2024-08-25T19:12:15.292614'),
      description: 'Это описание для курса 10.',
      authorId: 'author_4',
    ),
  ];

  static final List<Lesson> mockLessons = [
    Lesson(
      id: 'lesson_1',
      title: 'Введение в Flutter',
      description: 'Основы создания приложений с помощью Flutter.',
      authorId: 'user_01',
    ),
    Lesson(
      id: 'lesson_2',
      title: 'Обзор языка Dart',
      description: 'Изучение основных концепций и синтаксиса языка Dart.',
      authorId: 'user_02',
    ),
    Lesson(
      id: 'lesson_3',
      title: 'Управление состоянием',
      description:
          'Как управлять состоянием в приложениях Flutter с использованием BLoC.',
      authorId: 'user_04',
    ),
    Lesson(
      id: 'lesson_4',
      title: 'Интеграция Firebase',
      description:
          'Использование Firebase для хранения данных и аутентификации.',
      authorId: 'user_05',
    ),
    Lesson(
      id: 'lesson_5',
      title: 'Создание анимаций в Flutter',
      description:
          'Изучение анимаций в Flutter для создания плавного пользовательского интерфейса.',
      authorId: 'user_01',
    ),
  ];

  final List<Task> mockTasks = [
    Task(
      id: '1',
      title: 'Завершите учебник по Flutter',
      contentLink: 'https://flutter.dev/docs/get-started',
      authorId: 'user_01',
    ),
    Task(
      id: '2',
      title: 'Отправьте задание по Dart',
      contentLink: 'https://dart.dev/guides/language',
      authorId: 'user_02',
    ),
    Task(
      id: '3',
      title: 'Создайте простое приложение',
      contentLink: null,
      authorId: 'user_03',
    ),
    Task(
      id: '4',
      title: 'Прочитайте статью о управлении состоянием',
      contentLink: 'https://bloclibrary.dev/',
      authorId: 'user_04',
    ),
    Task(
      id: '5',
      title: 'Завершите задание по интеграции базы данных',
      contentLink: 'https://firebase.google.com/docs/firestore',
      authorId: 'user_05',
    ),
  ];

  final List<AcceptedSubmission> mockAcceptedSubmissions = [
    AcceptedSubmission(
      taskId: '1',
      contentLink: 'https://example.com/submission1',
      sentTs: DateTime(2024, 7, 1, 14, 30),
    ),
    AcceptedSubmission(
      taskId: '2',
      contentLink: 'https://example.com/submission2',
      sentTs: DateTime(2024, 7, 2, 15, 45),
    ),
    AcceptedSubmission(
      taskId: '3',
      contentLink: 'https://example.com/submission3',
      sentTs: DateTime(2024, 7, 3, 16),
    ),
    AcceptedSubmission(
      taskId: '4',
      contentLink: 'https://example.com/submission4',
      sentTs: DateTime(2024, 7, 4, 17, 15),
    ),
    AcceptedSubmission(
      taskId: '5',
      contentLink: 'https://example.com/submission5',
      sentTs: DateTime(2024, 7, 5, 18, 30),
    ),
  ];

  final List<SentSubmission> mockSentSubmissions = [
    SentSubmission(contentLink: 'https://example.com/sent_submission1'),
    SentSubmission(contentLink: 'https://example.com/sent_submission2'),
    SentSubmission(contentLink: 'https://example.com/sent_submission3'),
    SentSubmission(contentLink: 'https://example.com/sent_submission4'),
    SentSubmission(contentLink: 'https://example.com/sent_submission5'),
  ];

  final List<User> mockUsers = [
    User(id: 'user_01', fullname: 'Алиса Джонсон', role: UserRole.teacher),
    User(id: 'user_02', fullname: 'Боб Смит', role: UserRole.student),
    User(id: 'user_03', fullname: 'Чарли Браун', role: UserRole.admin),
    User(id: 'user_04', fullname: 'Диана Принс', role: UserRole.teacher),
    User(id: 'user_05', fullname: 'Ева Дэвис', role: UserRole.student),
  ];
}
