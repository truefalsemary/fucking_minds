import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';

part 'lesson_list_state.freezed.dart';

@freezed
sealed class LessonListState with _$LessonListState {
  const factory LessonListState.initial() = LessonListInitial;
  const factory LessonListState.loadInProgress() = LessonListLoadInProgress;
  const factory LessonListState.loadSuccess(List<Lesson> lessons) =
      LessonListLoadSuccess;
  const factory LessonListState.loadFailure(Object error) =
      LessonListLoadFailure;

  /// Used to distinguish failure in loading the list of lessons from failure while processing a single lesson operation
  const factory LessonListState.operationFailure(Object error) =
      LessonOperationFailure;
}
