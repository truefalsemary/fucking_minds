#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/storages/postgres/result_set.hpp>
#include "../../models/lesson/lesson.hpp"
#include "../../models/lesson/lesson_data.hpp"
#include "lesson_catalog_controller.hpp"

namespace lms_service {
namespace lesson_catalog_controller {
Lesson createLesson(const lms_service::LessonData& lesson_data,
                  userver::storages::postgres::ClusterPtr pg_cluster_);

userver::storages::postgres::ResultSet getLessons(
    userver::storages::postgres::ClusterPtr pg_cluster_);

userver::storages::postgres::ResultSet getLessonByID(
    const std::string& id, userver::storages::postgres::ClusterPtr pg_cluster_);

userver::storages::postgres::ResultSet updateLessonByID(
    const lms_service::LessonData& lesson_data,
    userver::storages::postgres::ClusterPtr pg_cluster_);

// namespace lesson_catalog_controller

userver::storages::postgres::ResultSet deleteLessonByID(
    const std::string& id, userver::storages::postgres::ClusterPtr pg_cluster_);
}  // namespace lesson_catalog_controller
}  // namespace lms_service
   // namespace lms_service
