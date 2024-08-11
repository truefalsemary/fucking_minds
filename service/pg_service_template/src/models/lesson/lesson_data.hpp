#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service
{
struct LessonData
{
    std::string title;
    std::string description;
    std::string author_id;

    bool empty() 
    {
        return title.empty() || description.empty() || author_id.empty();
    }
};
userver::formats::json::Value Serialize(
    const LessonData& lesson_data,
    userver::formats::serialize::To<userver::formats::json::Value>);

}