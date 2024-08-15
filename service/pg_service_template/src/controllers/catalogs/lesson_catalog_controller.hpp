#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/lesson/lesson.hpp"
#include "../../models/lesson/lesson_data.hpp"

namespace lms_service {
namespace lesson_catalog_controller {
Lesson createLesson(const lms_service::LessonData& lesson_data,
                    userver::storages::postgres::ClusterPtr pg_cluster_);

// userver::storages::postgres::ResultSet getLessons(
//     userver::storages::postgres::ClusterPtr pg_cluster_);

// userver::storages::postgres::ResultSet getLessonByID(
//     const std::string& id, userver::storages::postgres::ClusterPtr
//     pg_cluster_);

// userver::storages::postgres::ResultSet updateLessonByID(
//     const lms_service::LessonData& lesson_data,
//     userver::storages::postgres::ClusterPtr pg_cluster_);

// userver::storages::postgres::ResultSet deleteLessonByID(
//     const std::string& id, userver::storages::postgres::ClusterPtr
//     pg_cluster_);
}  // namespace lesson_catalog_controller
}  // namespace lms_service
