#pragma once

#include <string>

namespace lms_service {
struct LessonCourseData {
  std::string lesson_id;
  std::string course_id;
  std::string author_id;

  bool empty() 
  {
    return lesson_id.empty() || course_id.empty();
  }
};
}  // namespace lms_service