#pragma once

#include <string>
#include <vector>
#include <userver/formats/json/value_builder.hpp>
#include <userver/formats/serialize/common_containers.hpp>

    namespace lms_service {
  template <class T>
  userver::formats::json::Value Serialize(
      const T& obj,
      userver::formats::serialize::To<userver::formats::json::Value>) {
    userver::formats::json::ValueBuilder item;
    data_pending(item, obj);

    return item.ExtractValue();
  };

template <class T>
userver::formats::json::Value Serialize(
  const std::vector<T>& objs,
  userver::formats::serialize::To<userver::formats::json::Value>) {
    userver::formats::json::ValueBuilder item;
    for (auto&& obj : objs) 
    {
      userver::formats::json::ValueBuilder current_item;
      data_pending(current_item, obj);
      item.PushBack(std::move(current_item));
    }

    return item.ExtractValue();
  };

}  // namespace lms_service