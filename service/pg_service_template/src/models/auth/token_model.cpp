#include "token_model.hpp"

namespace lms_service {
userver::formats::json::Value Serialize(
    const Token& token,
    userver::formats::serialize::To<userver::formats::json::Value>) {
  userver::formats::json::ValueBuilder item;
  item["id"] = token.data;
  return item.ExtractValue();
}
}  // namespace lms_service