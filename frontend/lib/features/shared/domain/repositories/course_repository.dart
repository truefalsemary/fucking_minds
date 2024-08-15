import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

abstract class CourseRepository {
  Future<void> create(Course course);
  Future<List<Course>> readAll();
  Future<Course> read(String id);
  Future<void> update(String id, Course course);
  Future<void> delete(String id);
}
