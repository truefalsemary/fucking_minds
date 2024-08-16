import 'package:bloc/bloc.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_event.dart';
import 'package:lms_front/features/shared/domain/course/course_list_bloc/course_list_state.dart';
import 'package:lms_front/features/shared/domain/repositories/course_repository.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  final CourseRepository courseRepository;

  CourseListBloc({required this.courseRepository})
      : super(const CourseListState.initial()) {
    on<CourseListFetched>(_onCourseListFetched);
    on<CourseCreated>(_onCourseCreated);
    on<CourseUpdated>(_onCourseUpdated);
    on<CourseDeleted>(_onCourseDeleted);
  }

  Future<void> _onCourseListFetched(
    CourseListFetched event,
    Emitter<CourseListState> emit,
  ) async {
    emit(const CourseListState.loadInProgress());
    try {
      final courses = await courseRepository.readAll();
      emit(CourseListState.loadSuccess(courses));
    } on () catch (e) {
      emit(CourseListState.loadFailure(e));
    }
  }

  Future<void> _onCourseCreated(
    CourseCreated event,
    Emitter<CourseListState> emit,
  ) async {
    try {
      await courseRepository.create(event.newCourse);
      final currentState = state;
      if (currentState is CourseListLoadSuccess) {
        final updatedCourses = List<Course>.from(currentState.courses)
          ..add(event.newCourse);
        emit(CourseListState.loadSuccess(updatedCourses));
      }
    } on () catch (e) {
      emit(CourseListState.operationFailure(e));
    }
  }

  Future<void> _onCourseUpdated(
    CourseUpdated event,
    Emitter<CourseListState> emit,
  ) async {
    try {
      await courseRepository.update(
          event.updatedCourse.id, event.updatedCourse);
      final currentState = state;
      if (currentState is CourseListLoadSuccess) {
        final updatedCourses = currentState.courses.map((course) {
          return course.id == event.updatedCourse.id
              ? event.updatedCourse
              : course;
        }).toList();
        emit(CourseListState.loadSuccess(updatedCourses));
      }
    } on () catch (e) {
      emit(CourseListState.operationFailure(e));
    }
  }

  Future<void> _onCourseDeleted(
    CourseDeleted event,
    Emitter<CourseListState> emit,
  ) async {
    try {
      await courseRepository.delete(event.courseId);
      final currentState = state;
      if (currentState is CourseListLoadSuccess) {
        final updatedCourses = currentState.courses
            .where((course) => course.id != event.courseId)
            .toList();
        emit(CourseListState.loadSuccess(updatedCourses));
      }
    } on () catch (e) {
      emit(CourseListState.operationFailure(e));
    }
  }
}
