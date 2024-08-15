#include "token_model.hpp"

namespace lms_service {
void data_pending(
    userver::formats::json::ValueBuilder& item, const Token& token) 
    {
      item["id"] = token.data;
    }
}  // namespace lms_service