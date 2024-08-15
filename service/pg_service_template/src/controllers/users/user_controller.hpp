#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/user/user_data.hpp"
#include "../../models/user/user.hpp"
#include <optional>
namespace lms_service
{
namespace user_controller
{
std::optional<User> updateUserById(
    const UserData& user_data, const std::string id,
    userver::storages::postgres::ClusterPtr pg_cluster_);
}
}