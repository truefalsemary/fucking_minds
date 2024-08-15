#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>
#include "../enums/user_type.hpp"

namespace lms_service {

struct User {
  std::string id;
  UserType type;
  std::string name;
  std::string surname;
  std::string middle_name;
};
userver::formats::json::Value Serialize(
    const User& user_data,
    userver::formats::serialize::To<userver::formats::json::Value>);
}  // namespace lms_service