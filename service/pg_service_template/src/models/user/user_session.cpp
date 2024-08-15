#include "user_session.hpp"

namespace lms_service {
void data_pending(
    userver::formats::json::ValueBuilder& item, const UserSession& user_session) 
    {
      item["id"] = user_session.id;
      item["email"] = user_session.email;
      item["password"] = user_session.password;
    }
}  // namespace lms_service