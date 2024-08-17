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

      if (course.start_ts.has_value())
        item["start_ts"] = course.start_ts.value();
      if (course.end_ts.has_value())
        item["end_ts"] = course.end_ts.value();
    }
}  // namespace lms_service