#include "course_catalog_controller.hpp"

#include <vector>

#include <userver/storages/postgres/cluster.hpp>

#include "../../models/courses/course.hpp"
#include "../../models/courses/course_data.hpp"

namespace lms_service {
namespace course_catalog_controller {
Course CreateCourse(const lms_service::CourseData& course_data,
                    userver::storages::postgres::ClusterPtr pg_cluster) {
  auto result = pg_cluster->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO Courses(course_title, course_description, author_id, "
      "start_ts, end_ts) "
      "VALUES($1, $2, $3, $4, $5) "
      "RETURNING *",
      course_data.title, course_data.description, course_data.author_id,
      course_data.start_ts, course_data.end_ts);

  auto created_course = result.AsSingleRow<Course>(userver::storages::postgres::kRowTag);

  pg_cluster->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO User_Course(user_id, course_id, user_role) "
      "VALUES($1, $2, 'admin')",
      created_course.author_id, created_course.course_id);

  return created_course;
}

std::vector<Course> getCourses(
    userver::storages::postgres::ClusterPtr pg_cluster_) 
    {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT * FROM Courses");
  return result.AsContainer<std::vector<Course>>(
      userver::storages::postgres::kRowTag);
}

std::optional<Course> getCourseByID(
    userver::storages::postgres::ClusterPtr pg_cluster_,
    const std::string& id) 
    {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT * FROM Courses "
      "WHERE course_id = $1",
      id);
  return result.AsOptionalSingleRow<Course>(
      userver::storages::postgres::kRowTag);
}

std::optional<Course> updateCourseByID(
    const std::string& id, const lms_service::CourseData& course_data,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  std::ostringstream query;
  query << "UPDATE Courses "
        << "SET course_title = $1, course_description = $2 "
        << (course_data.start_ts.has_value() ? ", start_ts = $3 " : "")
        << (course_data.end_ts.has_value() ? ", end_ts = $4 " : "")
        << "WHERE course_id = $5 AND author_id = $6 "
        << "RETURNING * ";
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      query.str(),
      course_data.title, course_data.description, course_data.start_ts, course_data.end_ts, id, course_data.author_id);

  return result.AsOptionalSingleRow<Course>(
      userver::storages::postgres::kRowTag);
}

std::optional<std::string> deleteCourseByID(
    const std::string& id, const std::string& author_id,
    userver::storages::postgres::ClusterPtr pg_cluster_)
    {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "DELETE FROM Courses "
      "WHERE course_id = $1 AND author_id = $2 "
      "RETURNING course_id",
      id, author_id);

  return result.AsOptionalSingleRow<std::string>();
    }

}  // namespace course_catalog_controller
}  // namespace lms_service
