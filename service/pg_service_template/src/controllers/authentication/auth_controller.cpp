#include "auth_controller.hpp"

#include <userver/storages/postgres/cluster.hpp>

#include "../../models/auth/token_model.hpp"

namespace lms_service {
namespace authentication {
std::optional<std::string> GetUserIdByToken(
    const lms_service::Token& token,
    userver::storages::postgres::ClusterPtr pg_cluster_) 
  {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT user_id from Auth_sessions "
      "WHERE id = $1 ",
      token.data);
  return result.AsSingleRow<std::optional<std::string>>();
}
}
}  // namespace lms_service