#include "user_session.hpp"

namespace lms_service {
userver::formats::json::Value Serialize(
    const UserSession& user_session,
    userver::formats::serialize::To<userver::formats::json::Value>) {
  userver::formats::json::ValueBuilder item;
  item["id"] = user_session.id;
  item["email"] = user_session.email;
  item["password"] = user_session.password;
  return item.ExtractValue();
}
}  // namespace lms_service