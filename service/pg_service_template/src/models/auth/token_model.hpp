#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {
struct Token {
  std::string data;
};
void data_pending(
    userver::formats::json::ValueBuilder& item, const Token& token);
}  // namespace lms_service
