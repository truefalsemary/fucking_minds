#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>
#include <userver/formats/serialize/common_containers.hpp>
namespace lms_service {

struct TaskData {
    std::string task_title;
    std::string content_link;
    std::string author_id;

    bool empty() {
        return task_title.empty() || content_link.empty() || author_id.empty();
    }
};

}