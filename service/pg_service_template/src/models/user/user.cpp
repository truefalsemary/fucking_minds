#include "user.hpp"

namespace lms_service {
void data_pending(
    userver::formats::json::ValueBuilder& item, const User& user) 
    {
      item["id"] = user.id;
      item["name"] = user.name;
      item["surname"] = user.surname;
      item["middle_name"] = user.middle_name;
    }
}  // namespace lms_service