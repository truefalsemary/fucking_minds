#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/user/user_data.hpp"
#include "../../models/user/user.hpp"
#include "../../models/enums/user_type.hpp"

#include <optional>
namespace lms_service
{
namespace user_controller
{
std::optional<User> updateUserNameById(
    const UserData& user_data, const std::string id,
    userver::storages::postgres::ClusterPtr pg_cluster_);

std::optional<User> updateUserTypeById( const std::string& type,
    const std::string id, userver::storages::postgres::ClusterPtr pg_cluster_);
}
}