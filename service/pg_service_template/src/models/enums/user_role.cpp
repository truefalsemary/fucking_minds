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
} // namespace lms_service

