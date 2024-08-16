#pragma once

#include <userver/formats/json/value_builder.hpp>
#include <userver/formats/serialize/common_containers.hpp>

namespace lms_service {

struct MaterialData {
    std::string material_title;
    std::string content_link;
    std::string author_id;
    
    bool empty() {
        return material_title.empty() || content_link.empty() || author_id.empty();
    }
};

}