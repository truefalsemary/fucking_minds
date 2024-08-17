#include "status_code.hpp"

namespace lms_service {

std::string parseToString(const StatusCode& status_code) {
    switch (status_code)
    {
    case StatusCode::kNotSent :
        return "not_sent";
    case StatusCode::kSubmitted :
        return "submitted";
    case StatusCode::kInReview :
        return "in_review";
    case StatusCode::kReviewed :
        return "reviewed";
    case StatusCode::kCompleted :
        return "completed";            
    default:
        return "";
    }
} 

StatusCode parseCodeFromString(const std::string& status_code) {
    if(status_code == "not_sent")
        return StatusCode::kNotSent;
    else if(status_code == "submitted") 
        return StatusCode::kSubmitted;
    else if(status_code == "in_review")
        return StatusCode::kInReview;
    else if(status_code == "reviewed")
        return StatusCode::kReviewed;
    else if(status_code == "completed")
        return StatusCode::kCompleted;        
}

}