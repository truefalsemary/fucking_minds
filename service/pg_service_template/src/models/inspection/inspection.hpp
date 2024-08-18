#pragma once 

#include <string>
#include <vector>
#include <userver/formats/json/value_builder.hpp>
#include "../enums/status_code.hpp"
#include "../enums/user_role.hpp"

namespace lms_service {

struct Inspection
{   
    std::string student_id;
    UserRole user_role;
    std::string task_id;
    std::string course_id;
    std::string lesson_id;
    StatusCode status_code;
    int score;    
    std::string reviewer_id;
    UserRole reviewer_role;

    bool empty () {
        return lesson_id.empty() || task_id.empty() || 
               student_id.empty() || reviewer_id.empty() ||
               course_id.empty();
    }

};

void data_pending (userver::formats::json::ValueBuilder& item, const Inspection& inspection);

}