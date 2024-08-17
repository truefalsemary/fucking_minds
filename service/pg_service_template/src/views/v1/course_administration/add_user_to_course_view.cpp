#include "add_user_to_course_view.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>
#include "../../../controllers/authentication/auth_controller.hpp"
#include "../../../controllers/course_administration/course_administration_controller.hpp"
#include "../../../models/auth/token_model.hpp"
#include "../../../models/serialization/serialization.hpp"

namespace lms_service {
namespace {
class AddUserToCourseView final
    : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName =
      "handler-v1-user-by-id-add-to-course-by-id";

  AddUserToCourseView(
      const userver::components::ComponentConfig& config,
      const userver::components::ComponentContext& component_context)
      : HttpHandlerBase(config, component_context),
        pg_cluster_(component_context
                        .FindComponent<userver::components::Postgres>(
                            "lms_service_db_1")
                        .GetCluster()) {}

  std::string HandleRequestThrow(
      const userver::server::http::HttpRequest& request,
      userver::server::request::RequestContext&) const override {


    auto token_id = authentication::GetSessionInfo(pg_cluster_, request);
    // TODO: replace std::optional to std::exception structure
    if (!token_id.has_value()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kUnauthorized);
      return {};
    }

    std::string target_token = request.GetPathArg("user_id");


    if (target_token.empty()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
    }

    auto role = request.GetArg("role");
    auto course_id = request.GetPathArg("course_id");

    UserCourse user_course;

    if (course_id.empty()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
    }

    if (role.empty()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
    }

    user_course.user_id = target_token;
    user_course.role = parseRoleFromString(role);

    user_course.course_id = course_id;

    auto result = course_administration::add_user_to_course(
       user_course, token_id.value(), pg_cluster_);
    if (!result.has_value()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kForbidden);
      return {};
    }
    return ToString(
        userver::formats::json::ValueBuilder{result.value()}.ExtractValue());
  }

  userver::storages::postgres::ClusterPtr pg_cluster_;
};

}  // namespace

void AppendAddUserToCourseView(
    userver::components::ComponentList& component_list) {
  component_list.Append<AddUserToCourseView>();
}

}  // namespace lms_service
