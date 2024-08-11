#pragma once

#include "../../models/courses/course_data.hpp"

namespace lms_server {
    class CourseCatalogController {
        void CreateCourse(userver::storages::postgres::ClusterPtr pg_cluster, const lms_service::CourseData& course_data) {

        }
    };
}