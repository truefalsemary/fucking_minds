import 'package:dio/dio.dart';
import 'package:lms_front/core/networking/const/base_url.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';
import 'package:lms_front/features/shared/data/models/course_related/material/material.dart';
import 'package:lms_front/features/shared/data/models/course_related/task/task.dart';
import 'package:lms_front/features/shared/data/models/submissions/sent/sent_submission.dart';
import 'package:lms_front/features/shared/data/models/user/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api_http_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiHttpClient {
  factory ApiHttpClient(Dio dio, {String baseUrl}) = _ApiHttpClient;

  // Course catalog
  @POST('/course/create')
  Future<void> createCourse(@Body() Course course);

  @GET('/courses')
  Future<List<Course>> getCourses();

  @GET('/course/{id}')
  Future<Course> getCourse(@Path('course_id') String id);

  @DELETE('/course/{id}')
  Future<void> deleteCourse(@Path('course_id') String id);

  // Course administration
  @PUT('/course/{id}')
  Future<void> updateCourse(
    @Path('course_id') String id,
    @Body() Course course,
  );

  @GET('/course/{id}/students')
  Future<List<User>> getCourseStudents(@Path('course_id') String id);

  @GET('/course/{id}/teachers')
  Future<List<User>> getCourseTeachers(@Path('course_id') String id);

  @GET('/course/{id}/admins')
  Future<List<User>> getCourseAdmins(@Path('course_id') String id);

  @GET('/course/{id}/lessons')
  Future<List<Lesson>> getCourseLessons(@Path('course_id') String id);

  @GET('/course/{id}/lessons_ids')
  Future<List<int>> getCourseLessonsIds(@Path('course_id') String id);

  @GET('/course/{id}/materials')
  Future<List<Resource>> getCourseMaterials(@Path('course_id') String id);

  @GET('/course/{id}/tasks')
  Future<List<Task>> getCourseTasks(@Path('course_id') String id);

  @POST('/course/{id}/add_lesson')
  Future<void> addCourseLesson(
    @Path('course_id') String id,
    @Body() Lesson lesson,
  );

  @DELETE('/course/{id}/lesson/{lesson_id}')
  Future<void> deleteCourseLesson(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
  );

  @POST('/course/{id}/lesson/{lesson_id}')
  Future<void> addCourseLessonMaterial(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Body() Resource resource,
  );

  @POST('/course/{id}/add_task')
  Future<void> addCourseLessonTask(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Body() Task task,
  );

  @PUT('/course/{id}/change_task')
  Future<void> changeCourseLessonTask(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Body() Task task,
  );

  @DELETE(
    '/course/{id}/lesson/{lesson_id}/task/{task_id}/student/{student_id}/inspector',
  )
  Future<void> deleteCourseLessonTaskStudentInspector(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
    @Path('student_id') String studentId,
  );

  // Lesson catalog
  @POST('/lesson/create')
  Future<void> createLesson(
    @Body() Lesson lesson,
  );

  @GET('/lessons')
  Future<List<Lesson>> getLessons();

  @GET('/lesson/{id}')
  Future<Lesson> getLesson(@Path('lesson_id') String id);

  @DELETE('/lesson/{id}')
  Future<void> deleteLesson(@Path('lesson_id') String id);

  @PUT('/lesson/{id}')
  Future<void> updateLesson(
    @Path('lesson_id') String id,
    @Body() Lesson lesson,
  );

  @GET('/lesson/{id}/materials')
  Future<List<Resource>> getLessonMaterials(@Path('lesson_id') String id);

  @GET('/lesson/{id}/tasks')
  Future<List<Task>> getLessonTasks(@Path('lesson_id') String id);

  // Materials (resources) catalog
  @POST('/material/create')
  Future<void> createMaterial(
    @Body() Resource resource,
  );

  @GET('/materials')
  Future<List<Resource>> getMaterials();

  @GET('/material/{id}')
  Future<Resource> getMaterial(@Path('resource_id') String id);

  @DELETE('/material/{id}')
  Future<void> deleteMaterial(@Path('resource_id') String id);

  @PUT('/material/{id}')
  Future<void> updateMaterial(
    @Path('resource_id') String id,
    @Body() Resource resource,
  );

  // Tasks catalog
  @POST('/task/create')
  Future<void> createTask(
    @Body() Task task,
  );

  @GET('/tasks')
  Future<List<Task>> getTasks(@Path('task_id') String id);

  @GET('/task/{id}')
  Future<Task> getTask(@Path('task_id') String id);

  @DELETE('/task/{id}')
  Future<void> deleteTask(@Path('task_id') String id);

  @PUT('/task/{id}')
  Future<void> updateTask(
    @Path('task_id') String id,
    @Body() Task task,
  );

  // Submissions
  @POST('/course/{course_id}/set_inspectors')
  Future<void> setCourseInspectors(
    @Path('course_id') String courseId,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
  );

  @POST(
    '/course/{course_id}/lesson/{lesson_id}/task/{task_id}/student/{student_id}/inspector',
  )
  Future<void> setCourseInspector(
    @Path('course_id') String courseId,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
    @Path('student_id') String studentId,
    @Path('teacher_id') String teacherId,
  );

  @POST('/course/{course_id}/send_solution')
  Future<void> sendSolution(
    @Body() Lesson lesson,
    @Path('course_id') String courseId,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
    @Path('student_id') String studentId,
    @Body() SentSubmission task,
  );
}
