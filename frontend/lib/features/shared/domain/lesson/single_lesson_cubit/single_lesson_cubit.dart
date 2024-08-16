import 'package:bloc/bloc.dart';
import 'package:lms_front/features/shared/domain/lesson/single_lesson_cubit/single_lesson_state.dart';
import 'package:lms_front/features/shared/domain/repositories/lesson_repository.dart';

class SingleLessonCubit extends Cubit<SingleLessonState> {
  final LessonRepository repository;
  final String lessonId;

  SingleLessonCubit({required this.repository, required this.lessonId})
      : super(const SingleLessonState.initial());

  Future<void> fetchLesson() async {
    emit(const SingleLessonState.loading());
    try {
      final lesson = await repository.read(lessonId);
      emit(SingleLessonState.loaded(lesson));
    } on () catch (e) {
      emit(SingleLessonState.error(e.toString()));
    }
  }
}
