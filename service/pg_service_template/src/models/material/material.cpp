#include "material.hpp"

namespace lms_service {
    void data_pending(
    userver::formats::json::ValueBuilder& item, const Material& material) 
    {
      item["id"] = material.material_id;
      item["title"] = material.material_title;
      item["content_link"] = material.content_link;
      item["author_id"] = material.author_id;
    }
}