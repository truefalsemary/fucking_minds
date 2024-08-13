#pragma once

#include <userver/server/http/http_request.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include "../../models/auth/token_model.hpp"

namespace lms_service {
namespace authentication {

const std::string USER_TICKET_HEADER_NAME = "X-Ya-User-Ticket";

std::optional<std::string> GetSessionInfo(
    userver::storages::postgres::ClusterPtr pg_cluster,
    const userver::server::http::HttpRequest& request);

std::optional<std::string> GetUserIdByToken(
    const lms_service::Token& token,
    userver::storages::postgres::ClusterPtr pg_cluster_);
}  // namespace authentication
}  // namespace lms_service