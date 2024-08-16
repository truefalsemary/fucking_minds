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
    const UserCourseData& user_data,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "DELETE FROM User_Course "
      "WHERE user_id =$1 AND course_id = $2 "
      "RETURNING * ",
      user_data.user_id, user_data.course_id);
  return result.AsOptionalSingleRow<UserCourse>(
      userver::storages::postgres::kRowTag);
}
}  // namespace course_administration
}  // namespace lms_service