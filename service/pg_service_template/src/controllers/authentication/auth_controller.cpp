#include "auth_controller.hpp"

#include "../../models/auth/token_model.hpp"

namespace lms_service {
namespace authentication {

std::optional<std::string> GetSessionInfo(
    userver::storages::postgres::ClusterPtr pg_cluster,
    const userver::server::http::HttpRequest& request) {
  if (!request.HasHeader(USER_TICKET_HEADER_NAME)) {
    return std::nullopt;
  }

  Token token;
  token.data = request.GetHeader(USER_TICKET_HEADER_NAME);
  return authentication::GetUserIdByToken(token, pg_cluster);
}


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