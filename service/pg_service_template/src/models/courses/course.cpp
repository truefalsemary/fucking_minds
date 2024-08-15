#include "course.hpp"

namespace lms_service 
{

void data_pending(
    userver::formats::json::ValueBuilder& item, const Course& course) 
    {
      item["id"] = course.course_id;
      item["title"] = course.title;
      item["description"] = course.description;
      item["author_id"] = course.author_id;
    }
}  // namespace lms_service