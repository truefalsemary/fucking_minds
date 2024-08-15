#include "create_task.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>

#include "../../../../controllers/authentication/auth_controller.hpp"
#include "../../../../controllers/catalogs/task_catalog_controller.hpp"
#include "../../../../models/auth/token_model.hpp"
#include "../../../../models/task/task.hpp"
#include "../../../../models/task/task_data.hpp"

namespace lms_service {

namespace {

class CreateTaskView final : public userver::server::handlers::HttpHandlerBase {
    public:
        static constexpr std::string_view kName = "handler-v1-task-create";

        CreateTaskView(
            const userver::components::ComponentConfig& config,
            const userver::components::ComponentContext& component_context)
            : HttpHandlerBase(config, component_context),
                pg_cluster_(
                    component_context
                        .FindComponent<userver::components::Postgres>("lms_service_db_1")
                        .GetCluster()) {}

        std::string HandleRequestThrow(
            const userver::server::http::HttpRequest& request,
            userver::server::request::RequestContext&) const override {
                lms_service::TaskData data;
                data.task_title = request.GetArg("title");
                data.content_link = request.GetArg("content_link");
                auto token_id = authentication::GetSessionInfo(pg_cluster_, request);

                if(!token_id.has_value()) {
                    auto& response = request.GetHttpResponse();
                    response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
                    return {};
                }
                data.author_id = token_id.value();
                if(!data.empty()) {
                    auto result = task_catalog_controller::createTask(data, pg_cluster_);
                    return ToString(userver::formats::json::ValueBuilder{result}.ExtractValue());
                }
                auto& response =request.GetHttpResponse();
                response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
                return {};
            } 


        userver::storages::postgres::ClusterPtr pg_cluster_;                 
    };

}

void AppendCreateTaskView(userver::components::ComponentList& component_list) {
    component_list.Append<CreateTaskView>();
}

}