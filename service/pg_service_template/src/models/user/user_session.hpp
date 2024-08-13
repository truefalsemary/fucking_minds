#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {

struct UserSession {
  std::string id;
  std::string email;
  std::string password;
};
userver::formats::json::Value Serialize(
    const UserSession& user_session,
    userver::formats::serialize::To<userver::formats::json::Value>);
}  // namespace lms_service