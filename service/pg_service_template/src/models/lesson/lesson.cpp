#include "lesson.hpp"

namespace lms_service {
userver::formats::json::Value Serialize(
    const Lesson& lesson,
    userver::formats::serialize::To<userver::formats::json::Value>) {
  userver::formats::json::ValueBuilder item;
  item["id"] = lesson.lesson_id;
  item["title"] = lesson.title;
  item["description"] = lesson.description;
  item["author_id"] = lesson.author_id;
  return item.ExtractValue();
}
}  // namespace lms_service