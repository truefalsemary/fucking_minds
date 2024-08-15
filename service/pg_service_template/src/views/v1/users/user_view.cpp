#include "user_view.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>
#include "../../../controllers/authentication/auth_controller.hpp"
#include "../../../controllers/users/user_controller.hpp"
#include "../../../models/auth/token_model.hpp"
#include "../../../models/user/user_data.hpp"
#include "../../../models/serialization/serialization.hpp"

    namespace lms_service {
  namespace {
  class UserView final : public userver::server::handlers::HttpHandlerBase {
   public:
    static constexpr std::string_view kName = "handler-user";

    UserView(const userver::components::ComponentConfig& config,
             const userver::components::ComponentContext& component_context)
        : HttpHandlerBase(config, component_context),
          pg_cluster_(component_context
                          .FindComponent<userver::components::Postgres>(
                              "lms_service_db_1")
                          .GetCluster()) {}

    std::string HandleRequestThrow(
        const userver::server::http::HttpRequest& request,
        userver::server::request::RequestContext&) const override {
      lms_service::UserData data;
      data.name = request.GetArg("name");
      data.middle_name = request.GetArg("middle_name");
      data.surname = request.GetArg("surname");
      auto token_id = authentication::GetSessionInfo(pg_cluster_, request);
      // TODO: replace std::optional to std::exception structure
      if (!token_id.has_value()) {
        auto& response = request.GetHttpResponse();
        response.SetStatus(userver::server::http::HttpStatus::kUnauthorized);
        return {};
      }

      auto result =
          user_controller::updateUserNameById(data, token_id.value(), pg_cluster_);
      if (!result.has_value()) {
        auto& response = request.GetHttpResponse();
        response.SetStatus(userver::server::http::HttpStatus::kNotFound);
        return {};
      }
      return ToString(
          userver::formats::json::ValueBuilder{result.value()}.ExtractValue());
    }

    userver::storages::postgres::ClusterPtr pg_cluster_;
  };

  }  // namespace

  void AppendUserView(userver::components::ComponentList & component_list) {
    component_list.Append<UserView>();
  }

}  // namespace lms_service
