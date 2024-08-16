#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>
#include "../enums/user_role.hpp"

namespace lms_service {
struct UserCourse {
  std::string user_id;
  std::string course_id;
  UserRole role;

};
void data_pending(userver::formats::json::ValueBuilder& item,
                  const UserCourse& course);
}  // namespace lms_service