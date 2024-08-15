import 'package:equatable/equatable.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

abstract class CourseListEvent extends Equatable {
  const CourseListEvent();

  @override
  List<Object> get props => [];
}

class CourseListFetched extends CourseListEvent {}

class CourseCreated extends CourseListEvent {
  final Course newCourse;

  const CourseCreated(this.newCourse);

  @override
  List<Object> get props => [newCourse];
}

class CourseUpdated extends CourseListEvent {
  final Course updatedCourse;

  const CourseUpdated(this.updatedCourse);

  @override
  List<Object> get props => [updatedCourse];
}

class CourseDeleted extends CourseListEvent {
  final String courseId;

  const CourseDeleted(this.courseId);

  @override
  List<Object> get props => [courseId];
}
