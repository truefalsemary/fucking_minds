#pragma once

#include "../../models/auth/token_model.hpp"

namespace lms_service {
  std::string GetUserIdByToken(const lms_service::Token& token, userver::storages::postgres::ClusterPtr pg_cluster_);
}  // namespace lms_service