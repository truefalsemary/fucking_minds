#include "user_view.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/formats/serialize/common_containers.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>
#include "../../../controllers/authentication/auth_controller.hpp"
#include "../../../controllers/users/user_controller.hpp"
#include "../../../models/auth/token_model.hpp"
#include "../../../models/user/user_data.hpp"

namespace lms_service {
namespace {
class UserTypeChange final : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName = "handler-user-type-update";

  UserTypeChange(
      const userver::components::ComponentConfig& config,
      const userver::components::ComponentContext& component_context)
      : HttpHandlerBase(config, component_context),
        pg_cluster_(component_context
                        .FindComponent<userver::components::Postgres>(
                            "lms_service_db_1")
                        .GetCluster()) {}

  std::string HandleRequestThrow(
      const userver::server::http::HttpRequest& request,
      userver::server::request::RequestContext&) const override 
    {

    auto token_id = authentication::GetSessionInfo(pg_cluster_, request);
    // TODO: replace std::optional to std::exception structure
    if (!token_id.has_value()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
    }
    auto id = request.GetArg("type");
    if (id.empty()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
    }
    auto result =
        user_controller::updateUserTypeById(id, token_id.value(), pg_cluster_);
    return ToString(
        userver::formats::json::ValueBuilder{result}.ExtractValue());
  }

  userver::storages::postgres::ClusterPtr pg_cluster_;
};

}  // namespace

void AppendUserTypeChangeView(
    userver::components::ComponentList& component_list) {
  component_list.Append<UserTypeChange>();
}

}  // namespace lms_service
