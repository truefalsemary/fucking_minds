#include "task.hpp"

namespace lms_service {

void data_pending(
    userver::formats::json::ValueBuilder& item, const Task& task) 
    {
      item["id"] = task.task_id;
      item["title"] = task.task_title;
      item["content_link"] = task.content_link;
      item["author_id"] = task.author_id;
    }

}

