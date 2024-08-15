#include <userver/storages/postgres/cluster.hpp>

#include "../../models/courses/course_data.hpp"
#include "../../models/courses/course.hpp"

namespace lms_service {
  namespace course_catalog_controller {
    Course CreateCourse(const lms_service::CourseData& course_data,
                      userver::storages::postgres::ClusterPtr pg_cluster) {
         
    }
  } // namespace course_catalog_controller
}  // namespace lms_server