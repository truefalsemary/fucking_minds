#include "user_type.hpp"

namespace lms_service {
std::string parseToString(const UserType& user) {
  switch (user) {
    case UserType::kAnonymous:
      return "anonymous";
    case UserType::kGeneral:
      return "general";
    case UserType::kSuper:
      return "super";
    default:
      return "";
  }
}

UserType parseTypeFromString(const std::string& user_role) {
  if (user_role == "anonymous")
    return UserType::kAnonymous;
  else if (user_role == "general")
    return UserType::kGeneral;
  else if (user_role == "super")
    return UserType::kSuper;
  else
    return UserType::kAnonymous;
}

}  // namespace lms_service