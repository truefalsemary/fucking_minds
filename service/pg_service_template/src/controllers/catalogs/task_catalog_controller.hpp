#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/task/task.hpp"
#include "../../models/task/task_data.hpp"
#include <vector>
#include <optional>

namespace lms_service {

namespace task_catalog_controller{

    Task createTask(const lms_service::TaskData& task_data,
                    userver::storages::postgres::ClusterPtr pg_cluster_);
    
    std::vector<Task> getTasks(userver::storages::postgres::ClusterPtr pg_cluster_);

    std::optional<Task> getTaskByID(userver::storages::postgres::ClusterPtr pg_cluster_, const std::string& task_id);

    std::optional<Task> updateTaskByID(const std::string& task_id, const lms_service::TaskData& task_data, 
                                        userver::storages::postgres::ClusterPtr pg_cluster_);
    
    std::optional<std::string> deleteTaskByID(const std::string& task_id, const std::string& author_id, userver::storages::postgres::ClusterPtr pg_cluster_);

} 
    
}