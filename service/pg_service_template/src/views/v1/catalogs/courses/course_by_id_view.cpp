#include "course_by_id_view.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>
#include "../../../../controllers/authentication/auth_controller.hpp"
#include "../../../../controllers/catalogs/course_catalog_controller.hpp"
#include "../../../../models/auth/token_model.hpp"
#include "../../../../models/courses/course.hpp"
#include "../../../../models/courses/course_data.hpp"
#include "../../../../models/serialization/serialization.hpp"
#include "../../../../utils/validation/time.hpp"

namespace lms_service {
namespace {

std::string get_handler(userver::storages::postgres::ClusterPtr pg_cluster,
    const userver::server::http::HttpRequest& request) 
    {
  auto id = request.GetPathArg("id");
  if (id.empty()) {
    auto& response = request.GetHttpResponse();
    response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
    return {};
  }
  auto result = course_catalog_controller::getCourseByID(pg_cluster, id);
  if (!result.has_value()) 
  {
    auto& response = request.GetHttpResponse();
    response.SetStatus(userver::server::http::HttpStatus::kNotFound);
    return {};
  }
  return ToString(
      userver::formats::json::ValueBuilder{result.value()}.ExtractValue());
}

std::string delete_handler(userver::storages::postgres::ClusterPtr pg_cluster,
                            const userver::server::http::HttpRequest& request,
                            const std::string& token_id) {
  std::string id = request.GetPathArg("id");
  if(id.empty())
  {
    auto& response = request.GetHttpResponse();
    response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
    return {};
  }
  auto result = course_catalog_controller::deleteCourseByID(id, token_id, pg_cluster);
  if (!result.has_value()) 
  {
    auto& response = request.GetHttpResponse();
    response.SetStatus(userver::server::http::HttpStatus::kNotFound);
    return {};
  }
  return ToString(
      userver::formats::json::ValueBuilder{result.value()}.ExtractValue());
}

std::string update_handler(userver::storages::postgres::ClusterPtr pg_cluster,
                            const userver::server::http::HttpRequest& request,
                            const std::string& token_id) {
  lms_service::CourseData data;
  data.title = request.GetArg("title");
  data.description = request.GetArg("description");
  data.author_id = token_id;
  if (request.HasArg("start_ts"))
    data.start_ts = lms_service::validation::ValidateTimeStamp(
        request.GetArg("start_ts"));
  if (request.HasArg("end_ts"))
    data.end_ts =
        lms_service::validation::ValidateTimeStamp(request.GetArg("end_ts"));
  if(data.empty())
  {
    auto& response = request.GetHttpResponse();
    response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
    return {};
  }

  auto id = request.GetPathArg("id");
  auto result = course_catalog_controller::updateCourseByID(id, data, pg_cluster);

  if (!result.has_value()) {
    auto& response = request.GetHttpResponse();
    response.SetStatus(userver::server::http::HttpStatus::kNotFound);
    return {};
  }
  return ToString(
      userver::formats::json::ValueBuilder{result.value()}.ExtractValue());
}

std::string execute_handler(userver::storages::postgres::ClusterPtr pg_cluster,
                            const userver::server::http::HttpRequest& request,
                            const std::string& token_id) {
  userver::server::http::HttpMethod k_type = request.GetMethod();
  switch (k_type) {
    case userver::server::http::HttpMethod::kGet:
      return get_handler(pg_cluster, request);
    case userver::server::http::HttpMethod::kDelete:
      return delete_handler(pg_cluster, request, token_id);
    case userver::server::http::HttpMethod::kPut:
      return update_handler(pg_cluster, request, token_id);
    default:
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
      return {};
      break;
  }
}

class CourseByIdView final : public userver::server::handlers::HttpHandlerBase {
 public:
  static constexpr std::string_view kName = "handler-v1-course";

  CourseByIdView(const userver::components::ComponentConfig& config,
             const userver::components::ComponentContext& component_context)
      : HttpHandlerBase(config, component_context),
        pg_cluster_(
            component_context
                .FindComponent<userver::components::Postgres>("lms_service_db_1")
                .GetCluster()) {}

  std::string HandleRequestThrow(
      const userver::server::http::HttpRequest& request,
      userver::server::request::RequestContext&) const override 
    {
    auto token_id = authentication::GetSessionInfo(pg_cluster_, request);
    // TODO: replace std::optional to std::exception structure
    if (!token_id.has_value()) {
      auto& response = request.GetHttpResponse();
      response.SetStatus(userver::server::http::HttpStatus::kUnauthorized);
      return {};
    }
    return execute_handler(pg_cluster_, request, token_id.value());
  }

  userver::storages::postgres::ClusterPtr pg_cluster_;
    };

}  // namespace

void AppendCourseByIdView(userver::components::ComponentList& component_list) {
  component_list.Append<CourseByIdView>();
}

}  // namespace lms_service
