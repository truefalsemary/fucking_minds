#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {

struct UserData {
  std::string name;
  std::string surname;
  std::string middle_name;
};
userver::formats::json::Value Serialize(
    const UserData& user_data,
    userver::formats::serialize::To<userver::formats::json::Value>);
}  // namespace lms_service