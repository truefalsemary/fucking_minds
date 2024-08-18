#include "lesson_course.hpp"

namespace lms_service {
void data_pending(userver::formats::json::ValueBuilder& item,
                  const LessonCourse& lesson_course) {
  item["lesson_id"] = lesson_course.lesson_id;
  item["course_id"] = lesson_course.course_id;
}
}  // namespace lms_service