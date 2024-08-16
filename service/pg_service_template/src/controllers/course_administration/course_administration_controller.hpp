#include <userver/storages/postgres/cluster.hpp>

#include <optional>
#include "../../models/user_course/user_course.hpp"
#include "../../models/user_course/user_course_data.hpp"
#include "../../models/enums/user_role.hpp"

namespace lms_service {
namespace course_administration {
std::optional<UserCourse> enroll_in_course(
    const UserCourseData& course_data,
    userver::storages::postgres::ClusterPtr pg_cluster);
}  // namespace course_administration_controller
}  // namespace lms_service