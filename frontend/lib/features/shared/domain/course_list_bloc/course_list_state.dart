import 'package:equatable/equatable.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

sealed class CourseListState extends Equatable {
  const CourseListState();

  @override
  List<Object> get props => [];
}

class CourseListInitial extends CourseListState {}

class CourseListLoadInProgress extends CourseListState {}

class CourseListLoadSuccess extends CourseListState {
  final List<Course> courses;

  const CourseListLoadSuccess(this.courses);

  @override
  List<Object> get props => [courses];
}

class CourseListLoadFailure extends CourseListState {
  final Object error;

  const CourseListLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

class CourseOperationFailure extends CourseListState {
  final Object error;

  const CourseOperationFailure(this.error);

  @override
  List<Object> get props => [error];
}
