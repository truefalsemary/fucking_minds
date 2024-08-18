#include "add_user_by_email_to_course_view.hpp"

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
#include "../../../models/user_course/user_course.hpp"
#include "../../../models/user_course/user_course_data.hpp"

namespace lms_service {
namespace {
class AddUserByEmailToCourseView final
    : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName =
      "handler-v1-user-by-email-add-to-course-by-id";

  AddUserByEmailToCourseView(
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

    auto email = request.GetPathArg("email");


    if (email.empty()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
    }

    auto role = request.GetArg("role");
    auto course_id = request.GetPathArg("course_id");

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

    auto result = course_administration::add_user_by_email_to_course(
       parseRoleFromString(role), email, course_id, token_id.value(), pg_cluster_);
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

void AppendAddUserByEmailToCourseView(
    userver::components::ComponentList& component_list) {
  component_list.Append<AddUserByEmailToCourseView>();
}

}  // namespace lms_service
