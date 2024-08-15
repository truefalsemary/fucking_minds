#pragma once

#include <userver/storages/postgres/cluster.hpp>

#include "../../models/courses/course_data.hpp"

namespace lms_service {
  namespace course_catalog_controller {
    void CreateCourse(userver::storages::postgres::ClusterPtr pg_cluster,
                      const lms_service::CourseData& course_data);
  } // namespace course_catalog_controller
}  // namespace lms_server