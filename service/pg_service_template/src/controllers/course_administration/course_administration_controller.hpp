#include <userver/storages/postgres/cluster.hpp>

#include <optional>
#include <vector>
#include "../../models/user/user.hpp"
#include "../../models/user_course/user_course.hpp"
#include "../../models/user_course/user_course_data.hpp"
#include "../../models/enums/user_role.hpp"


namespace lms_service {
namespace course_administration {
std::optional<UserCourse> enroll_in_course(
    const UserCourseData& course_data,
    userver::storages::postgres::ClusterPtr pg_cluster);

std::optional<UserCourse> leave_course(
    const UserCourseData& user_data,
    userver::storages::postgres::ClusterPtr pg_cluster);

std::optional<UserCourse> add_user_to_course(
    const UserCourse& user_data,
    const std::string& author_request,
        userver::storages::postgres::ClusterPtr pg_cluster);

std::vector<User> get_users_by_id_and_role(
    const UserRole& user_role, const std::string& course_id,
    const std::string& author_request,
    userver::storages::postgres::ClusterPtr pg_cluster);
}  // namespace course_administration_controller
}  // namespace lms_service