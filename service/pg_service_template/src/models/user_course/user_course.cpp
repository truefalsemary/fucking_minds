#include "user_course.hpp"

namespace lms_service {
void data_pending(userver::formats::json::ValueBuilder& item,
                  const UserCourse& user_course) {
  item["user_id"] = user_course.user_id;
  item["course_id"] = user_course.course_id;
  item["role"] = parseToString(user_course.role);
}
}  // namespace lms_service