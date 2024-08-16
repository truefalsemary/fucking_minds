#include <userver/storages/postgres/component.hpp>
#include <userver/storages/postgres/result_set.hpp>

#include "task_catalog_controller.hpp"

namespace lms_service {

namespace task_catalog_controller {

Task createTask(const lms_service::TaskData& task_data,
                userver::storages::postgres::ClusterPtr pg_cluster_) {
    auto result = pg_cluster_->Execute(
        userver::storages::postgres::ClusterHostType::kMaster,
        "INSERT INTO Tasks(task_title, content_link, author_id) VALUES ($1, $2, $3) "
        "RETURNING *",
        task_data.task_title, task_data.content_link, task_data.author_id);
    return result.AsSingleRow<Task>(userver::storages::postgres::kRowTag);
}

std::vector<Task> getTasks(userver::storages::postgres::ClusterPtr pg_cluster_) {
    auto result = pg_cluster_->Execute(
        userver::storages::postgres::ClusterHostType::kMaster,
        "SELECT * FROM Tasks"
    );

    return result.AsContainer<std::vector<Task>>(userver::storages::postgres::kRowTag);
}

std::optional<Task> getTaskByID(userver::storages::postgres::ClusterPtr pg_cluster_, const std::string& task_id) {
    auto result = pg_cluster_->Execute(
        userver::storages::postgres::ClusterHostType::kMaster,
        "SELECT * FROM Tasks WHERE task_id = $1", task_id);
    return result.AsOptionalSingleRow<Task>(userver::storages::postgres::kRowTag);

}

std::optional<Task> updateTaskByID(const std::string& task_id, const lms_service::TaskData& task_data, 
                                        userver::storages::postgres::ClusterPtr pg_cluster_) {
    auto result = pg_cluster_->Execute(
        userver::storages::postgres::ClusterHostType::kMaster,
        "UPDATE Tasks "
        "SET task_title = $1, content_link = $2 "
        "WHERE task_id = $3 AND author_id = $4 "
        "RETURNING * ",
        task_data.task_title, task_data.content_link, task_id, task_data.author_id
    );

    return result.AsOptionalSingleRow<Task>(userver::storages::postgres::kRowTag);
}

std::optional<std::string> deleteTaskByID(const std::string& task_id, const std::string& author_id, userver::storages::postgres::ClusterPtr pg_cluster_) {
    auto result = pg_cluster_->Execute(
        userver::storages::postgres::ClusterHostType::kMaster,
        "DELETE FROM Tasks "
        "WHERE task_id = $1 AND author_id = $2 "
        "RETURNING task_id ",
        task_id, author_id
    );

    return result.AsOptionalSingleRow<std::string>();
}

}

}