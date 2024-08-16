import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';

part 'lesson_list_event.freezed.dart';

@freezed
class LessonListEvent with _$LessonListEvent {
  const factory LessonListEvent.fetch() = LessonListFetched;
  const factory LessonListEvent.create(Lesson newLesson) = LessonCreated;
  const factory LessonListEvent.update(Lesson updatedLesson) = LessonUpdated;
  const factory LessonListEvent.delete(String lessonId) = LessonDeleted;
}
