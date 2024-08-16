#pragma once

#include <string>
#include <optional>
#include <chrono>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {
struct CourseData {
  std::string title;
  std::optional<std::chrono::system_clock::time_point> start_ts;
  std::optional<std::chrono::system_clock::time_point> end_ts;
  std::string description;
  std::string author_id;

  bool empty() {
    return title.empty() || description.empty() || author_id.empty();
  }
};
}  // namespace lms_service
