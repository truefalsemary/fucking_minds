#include "user_data.hpp"

namespace lms_service {
userver::formats::json::Value Serialize(
    const UserData& user_data,
    userver::formats::serialize::To<userver::formats::json::Value>) {
  userver::formats::json::ValueBuilder item;
  item["name"] = user_data.name;
  item["surname"] = user_data.surname;
  item["middle_name"] = user_data.middle_name;
  return item.ExtractValue();
}
}  // namespace lms_service