#include "submissions_controller.hpp"

#include <userver/storages/postgres/component.hpp>
#include <userver/storages/postgres/result_set.hpp>

namespace lms_service {

namespace inspection_submissions_controller {
    Inspection setInspector (const lms_service::InspectionData& inspection_data,
                                userver::storages::postgres::ClusterPtr pg_cluster)
    {
        auto result = pg_cluster->Execute(
            userver::storages::postgres::ClusterHostType::kMaster,
            "WITH updated_roles AS ( "
            "    SELECT "
            "        uc_student.user_role AS student_role, "
            "        uc_reviewer.user_role AS reviewer_role "
            "    FROM User_Course uc_student "
            "    LEFT JOIN User_Course uc_reviewer ON uc_reviewer.user_id = $2 AND uc_reviewer.course_id = $3 "
            "    WHERE uc_student.user_id = $1 AND uc_student.course_id = $3 "
            ") "
            "INSERT INTO Sended_Tasks (student_id, student_role, task_id, course_id, lesson_id, status, score, reviewer_id, reviewer_role) "
            "SELECT "
            "    $1, "
            "    COALESCE((SELECT student_role FROM updated_roles), 'student'), "
            "    $4, "
            "    $3, "
            "    $5, "
            "    'not_sent', "
            "    0, "
            "    $2, "
            "    COALESCE((SELECT reviewer_role FROM updated_roles), 'teacher') "
            "    RETURNING *; ",
            inspection_data.student_id, inspection_data.reviewer_id, 
            inspection_data.course_id, inspection_data.task_id, 
            inspection_data.lesson_id);
        return result.AsSingleRow<Inspection>(userver::storages::postgres::kRowTag);
    }                            
}

}