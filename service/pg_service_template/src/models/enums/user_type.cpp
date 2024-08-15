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
}  // namespace lms_service