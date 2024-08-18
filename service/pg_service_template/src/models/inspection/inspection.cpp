#include "inspection.hpp"

namespace lms_service {

void data_pending (userver::formats::json::ValueBuilder& item, const Inspection& inspection) {
    item["lesson_id"] = inspection.lesson_id;
    item["reviewer_id"] = inspection.reviewer_id;
    item["student_id"] = inspection.student_id;
    item["task_id"] = inspection.task_id;
    item["score"] = inspection.score;
    item["student_role"] = parseToString(inspection.user_role);
    item["reviewer_role"] = parseToString(inspection.reviewer_role);
    item["course_id"] = inspection.course_id;
    item["status_code"] = parseToString(inspection.status_code);
}

}