import 'package:dio/dio.dart';
import 'package:lms_front/core/networking/const/base_url.dart';
import 'package:lms_front/features/shared/data/models/course_related/cource/course.dart';
import 'package:lms_front/features/shared/data/models/course_related/lesson/lesson.dart';
import 'package:lms_front/features/shared/data/models/course_related/resource/resource.dart';
import 'package:lms_front/features/shared/data/models/course_related/task/task.dart';
import 'package:lms_front/features/shared/data/models/submissions/sent/sent_submission.dart';
import 'package:lms_front/features/shared/data/models/user/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Course catalog
  @POST('/v1/course/create')
  Future<void> createCourse(@Body() Course course);

  @GET('/v1/courses')
  Future<List<Course>> getCourses();

  @GET('/v1/course/{id}')
  Future<Course> getCourse(@Path('course_id') String id);

  @DELETE('/v1/course/{id}')
  Future<void> deleteCourse(@Path('course_id') String id);

  // Course administration
  @PUT('/v1/course/{id}')
  Future<void> updateCourse(
    @Path('course_id') String id,
    @Body() Course course,
  );

  @GET('/v1/course/{id}/students')
  Future<List<User>> getCourseStudents(@Path('course_id') String id);

  @GET('/v1/course/{id}/teachers')
  Future<List<User>> getCourseTeachers(@Path('course_id') String id);

  @GET('/v1/course/{id}/admins')
  Future<List<User>> getCourseAdmins(@Path('course_id') String id);

  @GET('/v1/course/{id}/lessons')
  Future<List<Lesson>> getCourseLessons(@Path('course_id') String id);

  @GET('/v1/course/{id}/lessons_ids')
  Future<List<int>> getCourseLessonsIds(@Path('course_id') String id);

  @GET('/v1/course/{id}/materials')
  Future<List<Resource>> getCourseMaterials(@Path('course_id') String id);

  @GET('/v1/course/{id}/tasks')
  Future<List<Task>> getCourseTasks(@Path('course_id') String id);

  @POST('/v1/course/{id}/add_lesson')
  Future<void> addCourseLesson(
    @Path('course_id') String id,
    @Body() Lesson lesson,
  );

  @DELETE('/v1/course/{id}/lesson/{lesson_id}')
  Future<void> deleteCourseLesson(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
  );

  @POST('/v1/course/{id}/lesson/{lesson_id}')
  Future<void> addCourseLessonMaterial(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Body() Resource resource,
  );

  @POST('/v1/course/{id}/add_task')
  Future<void> addCourseLessonTask(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Body() Task task,
  );

  @PUT('/v1/course/{id}/change_task')
  Future<void> changeCourseLessonTask(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Body() Task task,
  );

  @DELETE(
    '/v1/course/{id}/lesson/{lesson_id}/task/{task_id}/student/{student_id}/inspector',
  )
  Future<void> deleteCourseLessonTaskStudentInspector(
    @Path('course_id') String id,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
    @Path('student_id') String studentId,
  );

  // Lesson catalog
  @POST('/v1/lesson/create')
  Future<void> createLesson(
    @Body() Lesson lesson,
  );

  @GET('/v1/lessons')
  Future<List<Lesson>> getLessons();

  @GET('/v1/lesson/{id}')
  Future<Lesson> getLesson(@Path('lesson_id') String id);

  @DELETE('/v1/lesson/{id}')
  Future<void> deleteLesson(@Path('lesson_id') String id);

  @PUT('/v1/lesson/{id}')
  Future<void> updateLesson(
    @Path('lesson_id') String id,
    @Body() Lesson lesson,
  );

  @GET('/v1/lesson/{id}/materials')
  Future<List<Resource>> getLessonMaterials(@Path('lesson_id') String id);

  @GET('/v1/lesson/{id}/tasks')
  Future<List<Task>> getLessonTasks(@Path('lesson_id') String id);

  // Materials (resources) catalog
  @POST('/v1/material/create')
  Future<void> createMaterial(
    @Body() Resource resource,
  );

  @GET('/v1/materials')
  Future<List<Resource>> getMaterials();

  @GET('/v1/material/{id}')
  Future<Resource> getMaterial(@Path('resource_id') String id);

  @DELETE('/v1/material/{id}')
  Future<void> deleteMaterial(@Path('resource_id') String id);

  @PUT('/v1/material/{id}')
  Future<void> updateMaterial(
    @Path('resource_id') String id,
    @Body() Resource resource,
  );

  // Tasks catalog
  @POST('/v1/task/create')
  Future<void> createTask(
    @Body() Task task,
  );

  @GET('/v1/tasks')
  Future<List<Task>> getTasks(@Path('task_id') String id);

  @GET('/v1/task/{id}')
  Future<Task> getTask(@Path('task_id') String id);

  @DELETE('/v1/task/{id}')
  Future<void> deleteTask(@Path('task_id') String id);

  @PUT('/v1/task/{id}')
  Future<void> updateTask(
    @Path('task_id') String id,
    @Body() Task task,
  );

  // Submissions
  @POST('/v1/course/{course_id}/set_inspectors')
  Future<void> setCourseInspectors(
    @Path('course_id') String courseId,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
  );

  @POST(
    '/v1/course/{course_id}/lesson/{lesson_id}/task/{task_id}/student/{student_id}/inspector',
  )
  Future<void> setCourseInspector(
    @Path('course_id') String courseId,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
    @Path('student_id') String studentId,
    @Path('teacher_id') String teacherId,
  );

  @POST('/v1/course/{course_id}/send_solution')
  Future<void> sendSolution(
    @Body() Lesson lesson,
    @Path('course_id') String courseId,
    @Path('lesson_id') String lessonId,
    @Path('task_id') String taskId,
    @Path('student_id') String studentId,
    @Body() SentSubmission task,
  );
}
