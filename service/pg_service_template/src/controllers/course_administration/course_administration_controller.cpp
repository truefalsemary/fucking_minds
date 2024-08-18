#include "course_administration_controller.hpp"

namespace lms_service {
namespace course_administration {
std::optional<UserCourse> enroll_in_course(const UserCourseData& course_data,
                    userver::storages::postgres::ClusterPtr pg_cluster_)
{
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO User_Course "
      "(user_id, course_id, user_role) VALUES ($1, $2, $3) "
      "ON CONFLICT DO NOTHING "
      "RETURNING * ",
      course_data.user_id, course_data.course_id, UserRole::kStudent);
  return result.AsOptionalSingleRow<UserCourse>(
      userver::storages::postgres::kRowTag);
}

std::optional<UserCourse> leave_course(
    const UserCourseData& user_data, userver::storages::postgres::ClusterPtr pg_cluster_) {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "DELETE FROM User_Course "
      "WHERE user_id =$1 AND course_id = $2 "
      "RETURNING * ",
      user_data.user_id, user_data.course_id);
  return result.AsOptionalSingleRow<UserCourse>(
      userver::storages::postgres::kRowTag);
}

std::optional<UserCourse> add_user_to_course(
    const UserCourse& user_data, const std::string& author_request_id,
    userver::storages::postgres::ClusterPtr pg_cluster_)
    {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "WITH author AS ("
      "  SELECT user_role "
      "  FROM User_Course "
      "  WHERE user_id = $4"
      "), "
      "role_check AS ("
      "  SELECT ($1 < user_role) AS is_lower "
      "  FROM author "
      ") "
      "INSERT INTO User_Course "
      "(user_id, course_id, user_role) "
      "SELECT $2, $3, $1 "
      "WHERE EXISTS (SELECT 1 FROM role_check WHERE is_lower = TRUE) "
      "ON CONFLICT DO NOTHING "
      "RETURNING *",
      user_data.role, user_data.user_id, user_data.course_id,
      author_request_id);

  return result.AsOptionalSingleRow<UserCourse>(
      userver::storages::postgres::kRowTag);
    }

std::optional<LessonCourse> add_lesson_to_course(
    const LessonCourseData& lesson_course_data,
        userver::storages::postgres::ClusterPtr pg_cluster) {
    auto result = pg_cluster->Execute(
        userver::storages::postgres::ClusterHostType::kMaster,
        "WITH author AS ("
        "  SELECT user_role "
        "  FROM User_Course "
        "  WHERE user_id = $1"
        "), "
        "role_check AS ("
        "  SELECT (user_role = 'admin') AS is_admin "
        "  FROM author "
        ") "
        "INSERT INTO Course_Lesson "
        "(course_id, lesson_id) "
        "SELECT $2, $3 "
        "WHERE EXISTS (SELECT 1 FROM role_check WHERE is_admin = TRUE) "
        "ON CONFLICT DO NOTHING "
        "RETURNING *",
        lesson_course_data.author_id, lesson_course_data.course_id, lesson_course_data.lesson_id);

      return result.AsOptionalSingleRow<LessonCourse>(
      userver::storages::postgres::kRowTag);
    }
}  // namespace course_administration
}  // namespace lms_service