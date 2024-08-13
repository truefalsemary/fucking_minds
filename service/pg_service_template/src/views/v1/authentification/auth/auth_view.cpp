#include "auth_view.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>
#include "../../../../controllers/catalogs/lesson_catalog_controller.hpp"
#include "../../../../models/lesson/lesson.hpp"
#include "../../../../models/lesson/lesson_data.hpp"

namespace lms_service {

namespace {

class AuthView final
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
    data.author_id = "12";
    if (!data.empty()) {
      // auto result =
      // lesson_catalog_controller::createLesson(data,pg_cluster_);
      // return ToString(
      //   userver::formats::json::ValueBuilder{result}.ExtractValue());
      return "123";
    }
    auto& response = request.GetHttpResponse();
    response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
    return {};
  }

  userver::storages::postgres::ClusterPtr pg_cluster_;
};

}  // namespace

void AppendAuthView(userver::components::ComponentList& component_list) {
  component_list.Append<AuthView>();
}

}  // namespace lms_service
