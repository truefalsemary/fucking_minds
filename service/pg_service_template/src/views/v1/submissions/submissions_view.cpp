#include "submissions_view.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>

#include "../../../controllers/authentication/auth_controller.hpp"
#include "../../../controllers/submissions/submissions_controller.hpp"
#include "../../../models/auth/token_model.hpp"
#include "../../../models/inspection/inspection.hpp"
#include "../../../models/inspection/inspection_data.hpp"
#include "../../../models/serialization/serialization.hpp"

namespace lms_service {
namespace {
    class SetInspector final 
        : public userver::server::handlers::HttpHandlerBase {
            public:
                static constexpr std::string_view kName = "handler-v1-set-inspector";

                SetInspector (const userver::components::ComponentConfig& config,
                            const userver::components::ComponentContext& component_context)
                            : HttpHandlerBase(config, component_context),
                                pg_cluster_(
                                    component_context
                                        .FindComponent<userver::components::Postgres>("lms_service_db_1")
                                        .GetCluster()) {}

                std::string HandleRequestThrow(const userver::server::http::HttpRequest& request,
                                                userver::server::request::RequestContext&) const override {
                                    
                    lms_service::InspectionData data;
                    data.lesson_id = request.GetArg("lesson_id");
                    data.task_id = request.GetArg("task_id");
                    data.course_id = request.GetPathArg("course_id");
                    data.student_id = request.GetArg("student_id");
                    data.reviewer_id = request.GetArg("teacher_id");
                    auto token_id = authentication::GetSessionInfo(pg_cluster_, request);

                    if(!token_id.has_value()) {
                        auto& response = request.GetHttpResponse();
                        response.SetStatus(userver::server::http::HttpStatus::kUnauthorized);
                        return std::string("User isnt authorized");
                    }

                    if(!data.empty()) {
                        auto result = inspection_submissions_controller::setInspector(data, pg_cluster_);
                        return ToString(
                            userver::formats::json::ValueBuilder{result}.ExtractValue());
                    }
                    auto& response = request.GetHttpResponse();
                    response.SetStatus(userver::server::http::HttpStatus::kBadRequest);
                    return std::string("All params required");
                }
                userver::storages::postgres::ClusterPtr pg_cluster_;
        };
}    

    void AppendSetInspectorView(userver::components::ComponentList& component_list) {
        component_list.Append<SetInspector>();
    }
}