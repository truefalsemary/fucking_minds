import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';

part 'single_course_state.freezed.dart';

@freezed
class SingleCourseState with _$SingleCourseState {
  const factory SingleCourseState.initial() = _Initial;
  const factory SingleCourseState.loadInProgress() = _Loading;
  const factory SingleCourseState.loadSuccess(Course course) = _Loaded;
  const factory SingleCourseState.loadFailure(String message) = _Error;
}
