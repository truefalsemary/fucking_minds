#pragma once

#include <string>

namespace lms_service {

struct SignData {
  std::string email;
  std::string password;

  bool empty() { return email.empty() || password.empty(); }
};

}  // namespace lms_service