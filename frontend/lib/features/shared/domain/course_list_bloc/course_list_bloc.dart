import 'package:bloc/bloc.dart';
import 'package:lms_front/core/networking/mock.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/domain/course_list_bloc/course_list_event.dart';
import 'package:lms_front/features/shared/domain/course_list_bloc/course_list_state.dart';
import 'package:lms_front/features/shared/domain/repositories/course_repository.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  final CourseRepository repository;

  CourseListBloc({required this.repository}) : super(CourseListInitial()) {
    on<CourseListFetched>(_onCourseListFetched);
    on<CourseCreated>(_onCourseCreated);
    on<CourseUpdated>(_onCourseUpdated);
    on<CourseDeleted>(_onCourseDeleted);
  }

  Future<void> _onCourseListFetched(
    CourseListFetched event,
    Emitter<CourseListState> emit,
  ) async {
    emit(CourseListLoadInProgress());
    try {
      // final courses = await repository.readAll();
      emit(CourseListLoadSuccess(Mock.mockCourses));
    } catch (e) {
      emit(CourseListLoadFailure(e));
    }
  }

  Future<void> _onCourseCreated(
    CourseCreated event,
    Emitter<CourseListState> emit,
  ) async {
    try {
      await repository.create(event.newCourse);
      final currentState = state;
      if (currentState is CourseListLoadSuccess) {
        final updatedCourses = List<Course>.from(currentState.courses)
          ..add(event.newCourse);
        emit(CourseListLoadSuccess(updatedCourses));
      }
    } catch (e) {
      emit(CourseOperationFailure(e));
    }
  }

  Future<void> _onCourseUpdated(
    CourseUpdated event,
    Emitter<CourseListState> emit,
  ) async {
    try {
      await repository.update(event.updatedCourse.id, event.updatedCourse);
      final currentState = state;
      if (currentState is CourseListLoadSuccess) {
        final updatedCourses = currentState.courses.map((course) {
          return course.id == event.updatedCourse.id
              ? event.updatedCourse
              : course;
        }).toList();
        emit(CourseListLoadSuccess(updatedCourses));
      }
    } catch (e) {
      emit(CourseOperationFailure(e));
    }
  }

  Future<void> _onCourseDeleted(
    CourseDeleted event,
    Emitter<CourseListState> emit,
  ) async {
    try {
      await repository.delete(event.courseId);
      final currentState = state;
      if (currentState is CourseListLoadSuccess) {
        final updatedCourses = currentState.courses
            .where((course) => course.id != event.courseId)
            .toList();
        emit(CourseListLoadSuccess(updatedCourses));
      }
    } catch (e) {
      emit(CourseOperationFailure(e));
    }
  }
}
