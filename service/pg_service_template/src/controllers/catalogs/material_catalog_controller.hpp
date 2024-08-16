#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/material/material.hpp"
#include "../../models/material/material_data.hpp"

#include <vector>
#include <optional>

namespace lms_service {

namespace material_catalog_controller {

    Material createMaterial(const lms_service::MaterialData& material_data,
                            userver::storages::postgres::ClusterPtr pg_cluster_);

    std::vector<Material> getMaterials(userver::storages::postgres::ClusterPtr pg_cluster_);

    std::optional<Material> getMaterialByID(userver::storages::postgres::ClusterPtr pg_cluster_, 
                                        const std::string& material_id);

    std::optional<Material> updateMaterialByID(const std::string& material_id, const lms_service::MaterialData& material_data, 
                                           userver::storages::postgres::ClusterPtr pg_cluster_);
    
    std::optional<std::string> deleteMaterialByID(const std::string& material_id, const std::string& author_id, 
                                              userver::storages::postgres::ClusterPtr pg_cluster_);

}

}