import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';

abstract class LessonRepository {
  Future<List<Lesson>> readAll();
  Future<void> create(Lesson lesson);
  Future<Lesson> read(String id);
  Future<void> update(String id, Lesson lesson);
  Future<void> delete(String id);
}
