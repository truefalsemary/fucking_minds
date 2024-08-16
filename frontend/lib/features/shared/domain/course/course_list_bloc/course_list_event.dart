import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

part 'course_list_event.freezed.dart';

@freezed
class CourseListEvent with _$CourseListEvent {
  const factory CourseListEvent.fetch() = CourseListFetched;
  const factory CourseListEvent.create(Course newCourse) = CourseCreated;
  const factory CourseListEvent.update(Course updatedCourse) = CourseUpdated;
  const factory CourseListEvent.delete(String courseId) = CourseDeleted;
}
