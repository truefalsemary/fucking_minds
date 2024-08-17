#include "user_role.hpp"


namespace lms_service
{
std::string parseToString(const UserRole& user) {
  switch (user) {
    case UserRole::kStudent:
      return "student";
    case UserRole::kTeacher:
      return "teacher";
    case UserRole::kAdmin:
      return "admin";
    default:
      return "";
  }
}
UserRole parseRoleFromString(const std::string& user_role) {
  if(user_role == "student")
    return UserRole::kStudent;
  else if(user_role == "teacher")
    return UserRole::kTeacher;
  else if(user_role == "admin")
    return UserRole::kAdmin;
  else
    return UserRole::kStudent;
}
} // namespace lms_service

