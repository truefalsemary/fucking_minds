#include "lesson.hpp"

namespace lms_service 
{

void data_pending(
    userver::formats::json::ValueBuilder& item, const  Lesson& lesson) 
    {
      item["id"] = lesson.lesson_id;
      item["title"] = lesson.title;
      item["description"] = lesson.description;
      item["author_id"] = lesson.author_id;
    }
    
    
userver::formats::json::Value
    Serialize(const Lesson& lesson,
              userver::formats::serialize::To<userver::formats::json::Value>) {
  userver::formats::json::ValueBuilder item;
  data_pending(item, lesson);
  return item.ExtractValue();
}

userver::formats::json::Value Serialize(
    const std::vector<Lesson>& lesson_vec,
    userver::formats::serialize::To<userver::formats::json::Value>)
    {
      userver::formats::json::ValueBuilder item;
      for (auto&& lesson : lesson_vec) 
      {
        userver::formats::json::ValueBuilder current_item;
        data_pending(current_item, lesson);
        item.PushBack(std::move(current_item));
      }

      return item.ExtractValue();
    }
}  // namespace lms_service