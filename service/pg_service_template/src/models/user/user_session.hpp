#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {

struct UserSession {
  std::string id;
  std::string email;
  std::string password;
};
void data_pending(userver::formats::json::ValueBuilder& item,
                  const UserSession& user_session);
}  // namespace lms_service