#pragma once

#include <string>
#include <vector>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {
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
void data_pending(
  userver::formats::json::ValueBuilder& item, const Lesson& lesson);
}  // namespace lms_service