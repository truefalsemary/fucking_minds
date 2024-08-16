#include "course_catalog_controller.hpp"

#include <sstream>

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
  return result.AsSingleRow<Course>(userver::storages::postgres::kRowTag);
}


}  // namespace course_catalog_controller
}  // namespace lms_service
