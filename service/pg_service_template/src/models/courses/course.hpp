#pragma once

#include <string>
#include <optional>
#include <vector>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {
struct Course {
  std::string course_id;
  std::string title;
  std::string description;
  std::string author_id;
  std::optional<std::string> start_ts;
  std::optional<std::string> end_ts;

  bool empty() {
    return course_id.empty() || title.empty() || description.empty() ||
           author_id.empty();
  }
};
void data_pending(
    userver::formats::json::ValueBuilder& item, const Course& course);
}  // namespace lms_service