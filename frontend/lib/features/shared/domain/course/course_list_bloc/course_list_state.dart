import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

part 'course_list_state.freezed.dart';

@freezed
sealed class CourseListState with _$CourseListState {
  const factory CourseListState.initial() = CourseListInitial;
  const factory CourseListState.loadInProgress() = CourseListLoadInProgress;
  const factory CourseListState.loadSuccess(List<Course> courses) =
      CourseListLoadSuccess;
  const factory CourseListState.loadFailure(Object error) =
      CourseListLoadFailure;

  /// Used to distinguish failure in loading the list of courses from failure while processing a single course operation
  const factory CourseListState.operationFailure(Object error) =
      CourseOperationFailure;
}
