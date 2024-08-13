#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service 
{
struct Lesson {
  std::string lesson_id;
  std::string title;
  std::string description;
  std::string author_id;

  bool empty() {
    return lesson_id.empty() || title.empty() || description.empty() ||
           author_id.empty();
  }
};
  userver::formats::json::Value Serialize(
      const Lesson& lesson,
       userver::formats::serialize::To<userver::formats::json::Value>);


}  // namespace lms_service