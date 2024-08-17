#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>
#include "../enums/user_type.hpp"

namespace lms_service {

struct User {
  std::string id;
  UserType type;
  std::optional<std::string> name;
  std::optional<std::string> surname;
  std::optional<std::string> middle_name;
};

void data_pending(
    userver::formats::json::ValueBuilder& item, const User& user);
}  // namespace lms_service