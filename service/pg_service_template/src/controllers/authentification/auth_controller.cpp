#include "auth_controller.hpp"

#include <userver/storages/postgres/cluster.hpp>

#include "../../models/auth/token_model.hpp"

namespace lms_service {
  std::string GetUserIdByToken(const lms_service::Token& token, userver::storages::postgres::ClusterPtr pg_cluster_) {
    auto result =  pg_cluster_->Execute(
        userver::storages::postgres::ClusterHostType::kMaster,
        "SELECT user_id from Auth_sessions "
        "WHERE id = $1 ",
        token);
    return result.AsSingleRow<std::string>(userver::storages::postgres::kRowTag);
  }
}  // namespace lms_service