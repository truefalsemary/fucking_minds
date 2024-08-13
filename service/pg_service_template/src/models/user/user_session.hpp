#include <string>

namespace lms_service {

struct UserSession {
  std::string id;
  std::string email;
  std::string password;
};

}  // namespace lms_service