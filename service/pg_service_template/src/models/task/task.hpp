#pragma once

#include <string>
#include <vector>
#include <userver/formats/json/value_builder.hpp>
#include <userver/formats/serialize/common_containers.hpp>
namespace lms_service {

struct Task {
    std::string task_id;
    std::string task_title;
    std::string content_link;
    std::string author_id;

    bool empty() {
        return task_id.empty() || task_title.empty() || content_link.empty() || author_id.empty();
    }
};

void data_pending(
    userver::formats::json::ValueBuilder& item, const Task& task);

}