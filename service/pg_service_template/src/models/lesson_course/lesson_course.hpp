#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {
struct LessonCourse {
  std::string lesson_id;
  std::string course_id;

};
void data_pending(userver::formats::json::ValueBuilder& item,
                  const LessonCourse& lesson_course);
}  // namespace lms_service