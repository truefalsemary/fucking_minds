#include "user_controller.hpp"

namespace lms_service {
namespace user_controller {
std::optional<User> updateUserNameById(
    const UserData& user_data, const std::string id,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "UPDATE Users "
      " SET user_name = $1, user_surname = $2, user_middle_name = $3 "
      "WHERE user_id = $4 "
      "RETURNING user_id, current_user_type, user_name, user_surname, "
      "user_middle_name ",
      user_data.name, user_data.surname, user_data.middle_name, id);

  return result.AsOptionalSingleRow<User>(userver::storages::postgres::kRowTag);
}

std::optional<User> updateUserTypeById(
    const std::string& type, const std::string& id, const std::string& author_request,
    userver::storages::postgres::ClusterPtr pg_cluster_)
{
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "WITH author_check AS ("
      "  SELECT 1 "
      "  FROM Users "
      "  WHERE user_id = $3 AND current_user_type = 'super' "
      ") "
      "UPDATE Users "
      "SET current_user_type = $1 "
      "WHERE user_id = $2 "
      "AND EXISTS (SELECT 1 FROM author_check ) "
      "RETURNING user_id, current_user_type, user_name, user_surname, "
      "user_middle_name",
      parseTypeFromString(type), id, author_request);

  return result.AsOptionalSingleRow<User>(userver::storages::postgres::kRowTag);
}

}  // namespace user_controller
}  // namespace lms_service