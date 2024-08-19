#include "sign_controller.hpp"
#include <regex>
namespace lms_service {
namespace sign_controller {
bool isValidEmail(const std::string& raw_email) {
  size_t pos = raw_email.find('=');
  std::string encoded_email = raw_email;
  if (pos != std::string::npos)
    encoded_email = std::string(raw_email.substr(pos + 1));
  const std::regex pattern(
      R"((^[a-zA-Z0-9_.+-]+%40[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$))");
  return std::regex_match(encoded_email, pattern);
}

std::optional<Token> login_user(
    const SignData& sign_data,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  auto userResult = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "SELECT (user_id, user_email, user_password) FROM Users "
      "WHERE user_email = $1 ",
      sign_data.email);

  if (userResult.IsEmpty()) return std::nullopt;

  auto user = userResult.AsSingleRow<UserSession>();

  if (sign_data.password != user.password) return std::nullopt;

  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO Auth_sessions(user_id) VALUES($1) "
      "ON CONFLICT DO NOTHING "
      "RETURNING id",
      user.id);

  Token token;
  token.data = result.AsSingleRow<std::string>();
  return token;
}

std::optional<Token> register_user(
    const SignData& sign_data,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO Users(user_email, user_password) VALUES($1, $2) "
      "ON CONFLICT (user_email) DO UPDATE SET "
      "current_user_type = 'general' "
      "WHERE Users.current_user_type = 'anonymous' AND Users.user_password = $2 "
      "RETURNING user_id",
      sign_data.email, sign_data.password);

  if (result.IsEmpty()) return std::nullopt;

  std::string user_id = result.AsSingleRow<std::string>();

  auto result_session = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "INSERT INTO Auth_sessions(user_id) VALUES($1) "
      "ON CONFLICT DO NOTHING "
      "RETURNING id",
      user_id);

  Token token;
  token.data = result_session.AsSingleRow<std::string>();
  return token;
}
}  // namespace sign_controller
}  // namespace lms_service