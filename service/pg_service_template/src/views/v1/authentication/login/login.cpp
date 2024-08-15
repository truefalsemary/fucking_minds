#include "login.hpp"

#include <fmt/format.h>

#include <userver/components/component_context.hpp>
#include <userver/crypto/hash.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/server/http/http_status.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>

#include "../../../../controllers/authentication/sign_controller.hpp"

namespace lms_service {

namespace {

class LoginUser final : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName = "handler-login-user";

  LoginUser(const userver::components::ComponentConfig& config,
            const userver::components::ComponentContext& component_context)
      : HttpHandlerBase(config, component_context),
        pg_cluster_(
            component_context
                .FindComponent<userver::components::Postgres>("postgres-db-1")
                .GetCluster()) {}

  std::string HandleRequestThrow(
      const userver::server::http::HttpRequest& request,
      userver::server::request::RequestContext&) const override {
    SignData session;
    // check GetFormDataArg in docs _______________________________
    session.email = request.GetArg("email");
    session.password =
        userver::crypto::hash::Sha256(request.GetArg("password"));
    //____________________________________________________________
    if (session.empty()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return "empty fields";
    }
    auto token = sign_controller::login_user(session, pg_cluster_);

    if (!token.has_value()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kNotFound);
      return "login is bad";
    }

    return ToString(
        userver::formats::json::ValueBuilder{token.value()}.ExtractValue());
  }

 private:
  userver::storages::postgres::ClusterPtr pg_cluster_;
};

}  // namespace

void AppendLoginUser(userver::components::ComponentList& component_list) {
  component_list.Append<LoginUser>();
}

}  // namespace lms_service
