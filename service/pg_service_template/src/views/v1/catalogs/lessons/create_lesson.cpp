#include "create_lesson.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>
#include "../../../../controllers/catalogs/lesson_catalog_controller.hpp"
#include "../../../../controllers/authentication/auth_controller.hpp"
#include "../../../../models/auth/token_model.hpp"
#include "../../../../models/lesson/lesson.hpp"
#include "../../../../models/lesson/lesson_data.hpp"

namespace lms_service {

const std::string USER_TICKET_HEADER_NAME = "X-Ya-User-Ticket";

namespace {

std::optional<std::string> GetSessionInfo(
    userver::storages::postgres::ClusterPtr pg_cluster,
    const userver::server::http::HttpRequest& request) 
    {

  if (!request.HasHeader(USER_TICKET_HEADER_NAME)) {
    return std::nullopt;
  }

  Token token;
  token.data = request.GetHeader(USER_TICKET_HEADER_NAME);
  return authentication::GetUserIdByToken(token, pg_cluster);
}

class LessonCatalogView final
    : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName = "handler-v1-lesson-create";

  LessonCatalogView(
      const userver::components::ComponentConfig& config,
      const userver::components::ComponentContext& component_context)
      : HttpHandlerBase(config, component_context),
        pg_cluster_(
            component_context
                .FindComponent<userver::components::Postgres>("postgres-db-1")
                .GetCluster()) {}

  std::string HandleRequestThrow(
      const userver::server::http::HttpRequest& request,
      userver::server::request::RequestContext&) const override {
    lms_service::LessonData data;
    data.title = request.GetArg("title");
    data.description = request.GetArg("description");
    auto token_id = GetSessionInfo(pg_cluster_, request);

    if (!token_id.has_value()) 
    {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
    }
    data.author_id = token_id.value();
    if (!data.empty()) {
      auto result =
      lesson_catalog_controller::createLesson(data,pg_cluster_);
      return ToString(
        userver::formats::json::ValueBuilder{result}.ExtractValue());
    }
    auto &response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
  }

  userver::storages::postgres::ClusterPtr pg_cluster_;
};

}  // namespace

void AppendLessonCatalogView(
    userver::components::ComponentList& component_list) {
  component_list.Append<LessonCatalogView>();
}

}  // namespace lms_service
