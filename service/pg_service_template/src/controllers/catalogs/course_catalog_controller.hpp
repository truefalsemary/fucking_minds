#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include <vector>
#include "../../models/courses/course_data.hpp"
#include "../../models/courses/course.hpp"

namespace lms_service {
  namespace course_catalog_controller 
  {
    Course CreateCourse(const lms_service::CourseData& course_data,
    userver::storages::postgres::ClusterPtr pg_cluster);


  std::vector<Course> getCourses(
    userver::storages::postgres::ClusterPtr pg_cluster_);

std::optional<Course> getCourseByID(
        userver::storages::postgres::ClusterPtr pg_cluster_,
    const std::string& id);

std::optional<Course> updateCourseByID(
    const std::string& id, const lms_service::CourseData& course_data,
    userver::storages::postgres::ClusterPtr pg_cluster_);

std::optional<std::string> deleteCourseByID(
    const std::string& id, const std::string& author_id, userver::storages::postgres::ClusterPtr
    pg_cluster_);
  } // namespace course_catalog_controller
}  // namespace lms_server
