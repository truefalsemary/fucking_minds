#include "user.hpp"
namespace lms_service {
void data_pending(
    userver::formats::json::ValueBuilder& item, const User& user) 
    {
      item["id"] = user.id;
      item["type"] = parseToString(user.type);
      item["name"] = user.name.value_or("");
      item["surname"] = user.surname.value_or("");
      item["middle_name"] = user.middle_name.value_or("");
    }
}  // namespace lms_service