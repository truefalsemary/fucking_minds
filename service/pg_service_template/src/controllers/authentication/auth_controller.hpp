#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/auth/token_model.hpp"

namespace lms_service {
namespace authentication {
std::optional<std::string> GetUserIdByToken(
    const lms_service::Token& token,
    userver::storages::postgres::ClusterPtr pg_cluster_);
}
}  // namespace lms_service