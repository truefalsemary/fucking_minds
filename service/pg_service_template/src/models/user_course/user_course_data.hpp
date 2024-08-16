#pragma once

#include <string>

namespace lms_service {
struct UserCourseData {
  std::string user_id;
  std::string course_id;

  bool empty() 
  {
    return user_id.empty() || course_id.empty();
  }
};
}  // namespace lms_service