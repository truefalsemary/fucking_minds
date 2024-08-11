#include "create_course.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>

namespace lms_service {

namespace {

class CourseCatalogView final : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName = "handler-course-create";

  CourseCatalogView(const userver::components::ComponentConfig& config,
        const userver::components::ComponentContext& component_context)
      : HttpHandlerBase(config, component_context),
        pg_cluster_(
            component_context
                .FindComponent<userver::components::Postgres>("postgres-db-1")
                .GetCluster()) {}

  std::string HandleRequestThrow(
      const userver::server::http::HttpRequest& request,
      userver::server::request::RequestContext&) const override {
    const auto& name = request.GetArg("name");

    auto user_type = UserType::kFirstTime;
    if (!name.empty()) {
      auto result = pg_cluster_->Execute(
          userver::storages::postgres::ClusterHostType::kMaster,
          "INSERT INTO hello_schema.users(name, count) VALUES($1, 1) "
          "ON CONFLICT (name) "
          "DO UPDATE SET count = users.count + 1 "
          "RETURNING users.count",
          name);

      if (result.AsSingleRow<int>() > 1) {
        user_type = UserType::kKnown;
      }
    }

    return lms_service::SayHelloTo(name, user_type);
  }

  userver::storages::postgres::ClusterPtr pg_cluster_;
};

}  // namespace

void AppendCourseCatalogView(userver::components::ComponentList& component_list) {
  component_list.Append<CourseCatalogView>();
}

}  // namespace lms_service
