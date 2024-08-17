#include "time.hpp"

#include <chrono>
#include <cstring>
#include <optional>

namespace lms_service {
namespace validation {
namespace {
std::optional<time_t> ParseTimestamp(const std::string& ts_string,
                                     const std::string& format) {
  struct tm tmStruct;
  memset(&tmStruct, 0, sizeof(struct tm));
  auto end_ptr = strptime(ts_string.c_str(), format.c_str(), &tmStruct);

  if (end_ptr != nullptr) return std::optional<time_t>();

  return mktime(&tmStruct);
}
}  // namespace

std::optional<std::chrono::system_clock::time_point> ValidateTimeStamp(
    const std::string& ts_string) {
  auto parsed_time = ParseTimestamp(ts_string, "%FT%T%z");
  if (parsed_time.has_value())
    return std::chrono::system_clock::from_time_t(parsed_time.value());

  return std::optional<std::chrono::system_clock::time_point>();
}
}  // namespace validation
}  // namespace lms_service
