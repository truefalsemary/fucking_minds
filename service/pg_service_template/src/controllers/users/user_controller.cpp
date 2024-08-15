#include "user_controller.hpp"

namespace lms_service {
namespace user_controller {
std::optional<User> updateUserById(
    const UserData& user_data, const std::string id,
    userver::storages::postgres::ClusterPtr pg_cluster_) {
  auto result = pg_cluster_->Execute(
      userver::storages::postgres::ClusterHostType::kMaster,
      "UPDATE Users "
      " SET user_name = $1, user_surname = $2, user_middle_name = $3 "
      "WHERE user_id = $4 "
      "RETURNING (user_id, current_user_type, user_name, user_surname, "
      "user_middle_name) ",
      user_data.name, user_data.surname, user_data.middle_name, id);

  return result.AsOptionalSingleRow<User>();
}
}  // namespace user_controller
}  // namespace lms_service