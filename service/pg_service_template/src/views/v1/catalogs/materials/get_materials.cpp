#include "get_materials.hpp"

#include <fmt/format.h>

#include <userver/components/component.hpp>
#include <userver/server/handlers/http_handler_base.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>
#include <userver/utils/assert.hpp>
#include "../../../../controllers/authentication/auth_controller.hpp"
#include "../../../../controllers/catalogs/material_catalog_controller.hpp"
#include "../../../../models/auth/token_model.hpp"
#include "../../../../models/material/material.hpp"
#include "../../../../models/material/material_data.hpp"
#include "../../../../models/serialization/serialization.hpp"

namespace lms_service {
namespace {
    class GetMaterialsView final : public userver::server::handlers::HttpHandlerBase {
        public:
        static constexpr std::string_view kName = "handler-v1-get-materials";

        GetMaterialsView(const userver::components::ComponentConfig& config,
                 const userver::components::ComponentContext& component_context)
            : HttpHandlerBase(config, component_context),
            pg_cluster_(
                component_context
                    .FindComponent<userver::components::Postgres>("lms_service_db_1")
                    .GetCluster()) {}

        std::string HandleRequestThrow(
            const userver::server::http::HttpRequest& request,
            userver::server::request::RequestContext&) const override {
                auto token_id =authentication::GetSessionInfo(pg_cluster_, request);
                if(!token_id.has_value()) {
                    auto& response = request.GetHttpResponse();
                    response.SetStatus(userver::server::http::HttpStatus::kUnauthorized);
                    return std::string("User isnt authorized");
                }
                auto result = material_catalog_controller::getMaterials(pg_cluster_);
                return ToString(userver::formats::json::ValueBuilder{result}.ExtractValue());
            }

        userver::storages::postgres::ClusterPtr pg_cluster_;            
    };

}    

    void AppendGetMaterialsView(userver::components::ComponentList& component_list) {
        component_list.Append<GetMaterialsView>();
    }
}