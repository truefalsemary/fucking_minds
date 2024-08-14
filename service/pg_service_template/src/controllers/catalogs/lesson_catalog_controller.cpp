#include <userver/storages/postgres/component.hpp>
#include <userver/storages/postgres/result_set.hpp>

#include "lesson_catalog_controller.hpp"

namespace lms_service {
namespace lesson_catalog_controller {
Lesson createLesson(const lms_service::LessonData& lesson_data,
                    userver::storages::postgres::ClusterPtr pg_cluster_) {
  //TODO: add author status validation
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO Lessons(lesson_title, lesson_description, author_id) "
      "VALUES($1, $2, "
      "$3) "
      "RETURNING *",
      lesson_data.title, lesson_data.description, lesson_data.author_id);
  return result.AsSingleRow<Lesson>(userver::storages::postgres::kRowTag);
}

std::vector<Lesson> getLessons(
    userver::storages::postgres::ClusterPtr pg_cluster_) 
    {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT * FROM Lessons");
  return result.AsContainer<std::vector<Lesson>>(
      userver::storages::postgres::kRowTag);
}

std::optional<Lesson> getLessonByID(
    const std::string& id,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT * FROM Lessons WHERE lesson_id = $1", id);

  return result.AsOptionalSingleRow<Lesson>(
      userver::storages::postgres::kRowTag);
}

//TODO: is it necessary to check author?
// std::optional<Lesson> updateLessonByID(
//     const std::string& id, const lms_service::LessonData& lesson_data,
//     userver::storages::postgres::ClusterPtr pg_cluster_) {
//   auto result = pg_cluster_->Execute(
//       userver::storages::postgres::ClusterHostType::kMaster,
//       "UPDATE Lessons "
//       " SET title = $1, description = $2 "
//       "WHERE lesson_id = $3",
//       lesson_data.title, lesson_data.description, id);

//   return result.AsOptionalSingleRow<Lesson>(
//       userver::storages::postgres::kRowTag);
// }
};  // namespace lesson_catalog_controller
}  // namespace lms_service