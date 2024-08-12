#include "create_course.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>

#include "../../../../controllers/authentification/auth_controller.hpp"
#include "../../../../controllers/catalogs/course_catalog_controller.hpp"
#include "../../../../models/auth/token_model.hpp"
#include "../../../../models/courses/course_data.hpp"

namespace lms_service {

namespace {

class CourseCatalogView final
    : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName = "handler-v1-course-create";

  CourseCatalogView(
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
    const auto& title = request.GetArg("title");
    const auto& start_ts = request.GetArg("start_ts");
    const auto& end_ts = request.GetArg("end_ts");
    const auto& description = request.GetArg("description");

    lms_service::CourseData course_data{title, start_ts, end_ts, description};

    // auto course_model =
    // lms_service::CourseCatalogController::CreateCourse(course_data,
    // pg_cluster_);
    return "123";
  }

  userver::storages::postgres::ClusterPtr pg_cluster_;
};

}  // namespace

void AppendCourseCatalogView(
    userver::components::ComponentList& component_list) {
  component_list.Append<CourseCatalogView>();
}

}  // namespace lms_service
