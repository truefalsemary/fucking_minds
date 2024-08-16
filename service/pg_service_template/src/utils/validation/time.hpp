#pragma once

#include <optional>
#include <string>
#include <chrono>

namespace lms_service {
  namespace validation {
    std::optional<std::chrono::system_clock::time_point> ValidateTimeStamp(const std::string& ts_string);
  } // namespace validation
} // namespace lms_service
