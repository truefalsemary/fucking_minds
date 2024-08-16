import 'package:lms_front/core/networking/api_client/api_client.dart';
import 'package:lms_front/core/networking/mock.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';
import 'package:lms_front/features/shared/domain/repositories/lesson_repository.dart';

class LessonRepositoryImpl implements LessonRepository {
  final ApiClient apiClient;

  LessonRepositoryImpl(this.apiClient);

  @override
  Future<void> create(Lesson lesson) async {
    await apiClient.createLesson(lesson);
  }

  @override
  Future<List<Lesson>> readAll() async {
    // return apiClient.getLessons();
    return Mock.mockLessons;
  }

  @override
  Future<Lesson> read(String id) async {
    // return apiClient.getLesson(id);
    return Mock.mockLessons.firstWhere((e) => e.id == id);
  }

  @override
  Future<void> update(String id, Lesson lesson) async {
    await apiClient.updateLesson(id, lesson);
  }

  @override
  Future<void> delete(String id) async {
    await apiClient.deleteLesson(id);
  }
}
