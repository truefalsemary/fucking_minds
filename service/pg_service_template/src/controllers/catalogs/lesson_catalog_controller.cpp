#include "lesson_catalog_controller.hpp"

namespace lms_service {
namespace lesson_catalog_controller {
userver::storages::postgres::ResultSet createLesson(
    const lms_service::LessonData& lesson_data,
    userver::storages::postgres::ClusterPtr pg_cluster_)
{
  return pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO Lessons VALUES($1, $2, $3) "
      "RETURNING *",
      lesson_data.title, lesson_data.description, lesson_data.author_id);
}

userver::storages::postgres::ResultSet getLessons(
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  return pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT * FROM Lessons"
      );
}

userver::storages::postgres::ResultSet getLessonByID(
    const std::string& id,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  return pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT * FROM Lessons WHERE lesson_id = $1", id);
}

userver::storages::postgres::ResultSet updateLessonByID(
    const std::string& id, const lms_service::LessonData& lesson_data,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  return pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "UPDATE Lessons "
      " SET title = $1, description = $2 "
      "WHERE id = $3",
      lesson_data.title, lesson_data.description, id);
}
};  // namespace lesson_catalog_controller
}  // namespace lms_service