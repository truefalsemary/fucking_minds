#include "lesson.hpp"

namespace lms_service 
{

void data_pending(
  userver::formats::json::ValueBuilder& item, const Lesson& lesson) 
  {
    item["id"] = lesson.lesson_id;
    item["title"] = lesson.title;
    item["description"] = lesson.description;
    item["author_id"] = lesson.author_id;
  }
}  // namespace lms_service