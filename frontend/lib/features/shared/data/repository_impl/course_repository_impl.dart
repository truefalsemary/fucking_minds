import 'package:lms_front/core/networking/api_client/api_client.dart';
import 'package:lms_front/core/networking/mock.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final ApiClient apiClient;

  CourseRepositoryImpl(this.apiClient);

  @override
  Future<void> create(Course course) async {
    await apiClient.createCourse(course);
  }

  @override
  Future<List<Course>> readAll() async {
    return Mock.mockCourses;
    // return apiClient.getCourses();
  }

  @override
  Future<Course> read(String id) async {
    return Mock.mockCourses.firstWhere((e) => e.id == id);

    // return apiClient.getCourse(id);
  }

  @override
  Future<void> update(String id, Course course) async {
    await apiClient.updateCourse(id, course);
  }

  @override
  Future<void> delete(String id) async {
    await apiClient.deleteCourse(id);
  }
}
