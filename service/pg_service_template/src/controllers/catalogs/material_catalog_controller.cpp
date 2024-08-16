#include "material_catalog_controller.hpp"

#include <userver/storages/postgres/component.hpp>
#include <userver/storages/postgres/result_set.hpp>

namespace lms_service {

namespace material_catalog_controller {

    Material createMaterial(const lms_service::MaterialData& material_data,
                            userver::storages::postgres::ClusterPtr pg_cluster_) {

        auto result = pg_cluster_->Execute(
            userver::storages::postgres::ClusterHostType::kMaster,
            "INSERT INTO Materials(material_title, content_link, author_id) VALUES ($1, $2, $3) "
            "RETURNING *",
            material_data.material_title, material_data.content_link, material_data.author_id);
        return result.AsSingleRow<Material>(userver::storages::postgres::kRowTag);
    }

    std::vector<Material> getMaterials(userver::storages::postgres::ClusterPtr pg_cluster_) {
        auto result = pg_cluster_->Execute(
            userver::storages::postgres::ClusterHostType::kMaster,
            "SELECT * FROM Materials"
        );

        return result.AsContainer<std::vector<Material>>(userver::storages::postgres::kRowTag);
    }

    std::optional<Material> getMaterialByID(userver::storages::postgres::ClusterPtr pg_cluster_, 
                                        const std::string& material_id) {
        auto result = pg_cluster_->Execute(
            userver::storages::postgres::ClusterHostType::kMaster,
            "SELECT * FROM Materials WHERE material_id = $1", material_id);
        return result.AsOptionalSingleRow<Material>(userver::storages::postgres::kRowTag);

    }

    std::optional<Material> updateMaterialByID(const std::string& material_id, const lms_service::MaterialData& material_data, 
                                           userver::storages::postgres::ClusterPtr pg_cluster_) {
        auto result = pg_cluster_->Execute(
            userver::storages::postgres::ClusterHostType::kMaster,
            "UPDATE Materials "
            "SET material_title = $1, content_link = $2 "
            "WHERE material_id = $3 AND author_id = $4 "
            "RETURNING * ",
            material_data.material_title, material_data.content_link, material_id, material_data.author_id
        );

        return result.AsOptionalSingleRow<Material>(userver::storages::postgres::kRowTag);
    }
    
    std::optional<std::string> deleteMaterialByID(const std::string& material_id, const std::string& author_id, 
                                              userver::storages::postgres::ClusterPtr pg_cluster_) {
        auto result = pg_cluster_->Execute(
            userver::storages::postgres::ClusterHostType::kMaster,
            "DELETE FROM Materials "
            "WHERE material_id = $1 AND author_id = $2 "
            "RETURNING material_id ",
            material_id, author_id
        );

        return result.AsOptionalSingleRow<std::string>();
    }

}

}