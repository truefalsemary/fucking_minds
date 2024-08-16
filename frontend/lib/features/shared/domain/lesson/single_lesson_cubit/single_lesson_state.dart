import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';

part 'single_lesson_state.freezed.dart';

@freezed
class SingleLessonState with _$SingleLessonState {
  const factory SingleLessonState.initial() = _Initial;
  const factory SingleLessonState.loading() = _Loading;
  const factory SingleLessonState.loaded(Lesson lesson) = _Loaded;
  const factory SingleLessonState.error(String message) = _Error;
}
