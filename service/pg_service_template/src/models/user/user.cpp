#include "user.hpp"

namespace lms_service {
userver::formats::json::Value Serialize(
    const User& user,
    userver::formats::serialize::To<userver::formats::json::Value>) {
  userver::formats::json::ValueBuilder item;
  item["id"] = user.id;
  item["name"] = user.name;
  item["surname"] = user.surname;
  item["middle_name"] = user.middle_name;
  return item.ExtractValue();
}
}  // namespace lms_service