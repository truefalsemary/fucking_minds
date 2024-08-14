#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/lesson/lesson.hpp"
#include "../../models/lesson/lesson_data.hpp"
#include <vector>
#include <optional>

namespace lms_service {
namespace lesson_catalog_controller {
Lesson createLesson(const lms_service::LessonData& lesson_data,
                    userver::storages::postgres::ClusterPtr pg_cluster_);

std::vector<Lesson> getLessons(
    userver::storages::postgres::ClusterPtr pg_cluster_);

std::optional<Lesson> getLessonByID(
    const std::string& id, userver::storages::postgres::ClusterPtr
    pg_cluster_);

std::optional<Lesson> updateLessonByID(
    const lms_service::LessonData& lesson_data,
    userver::storages::postgres::ClusterPtr pg_cluster_);

std::optional<std::string> deleteLessonByID(
    const std::string& id, userver::storages::postgres::ClusterPtr
    pg_cluster_);
}  // namespace lesson_catalog_controller
}  // namespace lms_service
