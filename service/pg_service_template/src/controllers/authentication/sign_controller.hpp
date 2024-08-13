#pragma once

#include <optional>
#include <userver/storages/postgres/cluster.hpp>
#include "../../models/auth/token_model.hpp"
#include "../../models/sign/sign_data.hpp"
#include "../../models/user/user_session.hpp"

namespace lms_service {
namespace sign_controller {
std::optional<Token> login_user(
    const SignData& sign_data,
    userver::storages::postgres::ClusterPtr pg_cluster_);

std::optional<Token> register_user(
    const SignData& sign_data,
    userver::storages::postgres::ClusterPtr pg_cluster_);
}  // namespace sign_controller
}  // namespace lms_service