import 'package:bloc/bloc.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/domain/course/single_course_cubit/single_course_state.dart';
import 'package:lms_front/features/shared/domain/repositories/course_repository.dart';

class SingleCourseCubit extends Cubit<SingleCourseState> {
  final CourseRepository repository;
  final String courseId;

  SingleCourseCubit({required this.repository, required this.courseId})
      : super(const SingleCourseState.initial());

  Future<void> fetchCourse() async {
    emit(const SingleCourseState.loadInProgress());
    try {
      final course = await repository.read(courseId);
      emit(SingleCourseState.loadSuccess(course));
    } on () catch (e) {
      emit(SingleCourseState.loadFailure(e.toString()));
    }
  }

  void set(Course course) => emit(SingleCourseState.loadSuccess(course));
}
