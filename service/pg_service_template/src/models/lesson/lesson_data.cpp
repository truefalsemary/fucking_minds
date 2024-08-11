#include "lesson_data.hpp"

namespace lms_service {
userver::formats::json::Value Serialize(
    const LessonData& lesson_data,
    userver::formats::serialize::To<userver::formats::json::Value>) {
  userver::formats::json::ValueBuilder item;
  item["title"] = lesson_data.title;
  item["description"] = lesson_data.description;
  item["author_id"] = lesson_data.author_id;
  return item.ExtractValue();
}
}  // namespace lms_service