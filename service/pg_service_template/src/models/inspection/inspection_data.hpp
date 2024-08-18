#pragma once

#include <string>
#include <userver/formats/json/value_builder.hpp>

namespace lms_service {
struct InspectionData
{   
    std::string course_id;
    std::string lesson_id;
    std::string task_id;
    std::string student_id;
    std::string reviewer_id;

    bool empty () {
        return lesson_id.empty() || task_id.empty() || 
               student_id.empty() || reviewer_id.empty();
    }
};


}