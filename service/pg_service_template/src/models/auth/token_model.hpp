#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {
struct Token {
  std::string data;
};
userver::formats::json::Value Serialize(
    const Token& token,
    userver::formats::serialize::To<userver::formats::json::Value>);
}  // namespace lms_service
