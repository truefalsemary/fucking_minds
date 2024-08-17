#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>
#include <userver/formats/serialize/common_containers.hpp>

namespace lms_service {

struct Material {
    std::string material_id;
    std::string material_title;
    std::string content_link;
    std::string author_id;

    bool empty() {
        return material_id.empty() || material_title.empty() || content_link.empty() || author_id.empty();
    }
};

void data_pending(
    userver::formats::json::ValueBuilder& item, const Material& material);
}