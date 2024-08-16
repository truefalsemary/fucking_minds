import 'package:bloc/bloc.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';
import 'package:lms_front/features/shared/domain/lesson/lesson_list_bloc/lesson_list_event.dart';
import 'package:lms_front/features/shared/domain/lesson/lesson_list_bloc/lesson_list_state.dart';
import 'package:lms_front/features/shared/domain/repositories/lesson_repository.dart';

class LessonListBloc extends Bloc<LessonListEvent, LessonListState> {
  final LessonRepository lessonRepository;

  LessonListBloc({required this.lessonRepository})
      : super(const LessonListState.initial()) {
    on<LessonListFetched>(_onLessonListFetched);
    on<LessonCreated>(_onLessonCreated);
    on<LessonUpdated>(_onLessonUpdated);
    on<LessonDeleted>(_onLessonDeleted);
  }

  Future<void> _onLessonListFetched(
    LessonListFetched event,
    Emitter<LessonListState> emit,
  ) async {
    emit(const LessonListState.loadInProgress());
    try {
      final lessons = await lessonRepository.readAll();
      emit(LessonListState.loadSuccess(lessons));
    } on () catch (e) {
      emit(LessonListState.loadFailure(e));
    }
  }

  Future<void> _onLessonCreated(
    LessonCreated event,
    Emitter<LessonListState> emit,
  ) async {
    try {
      await lessonRepository.create(event.newLesson);
      final currentState = state;
      if (currentState is LessonListLoadSuccess) {
        final updatedLessons = List<Lesson>.from(currentState.lessons)
          ..add(event.newLesson);
        emit(LessonListState.loadSuccess(updatedLessons));
      }
    } on () catch (e) {
      emit(LessonListState.operationFailure(e));
    }
  }

  Future<void> _onLessonUpdated(
    LessonUpdated event,
    Emitter<LessonListState> emit,
  ) async {
    try {
      await lessonRepository.update(
          event.updatedLesson.id, event.updatedLesson);
      final currentState = state;
      if (currentState is LessonListLoadSuccess) {
        final updatedLessons = currentState.lessons.map((lesson) {
          return lesson.id == event.updatedLesson.id
              ? event.updatedLesson
              : lesson;
        }).toList();
        emit(LessonListState.loadSuccess(updatedLessons));
      }
    } on () catch (e) {
      emit(LessonListState.operationFailure(e));
    }
  }

  Future<void> _onLessonDeleted(
    LessonDeleted event,
    Emitter<LessonListState> emit,
  ) async {
    try {
      await lessonRepository.delete(event.lessonId);
      final currentState = state;
      if (currentState is LessonListLoadSuccess) {
        final updatedLessons = currentState.lessons
            .where((lesson) => lesson.id != event.lessonId)
            .toList();
        emit(LessonListState.loadSuccess(updatedLessons));
      }
    } on () catch (e) {
      emit(LessonListState.operationFailure(e));
    }
  }
}
