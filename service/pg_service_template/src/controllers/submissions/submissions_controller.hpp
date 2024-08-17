#pragma once

#include <userver/storages/postgres/cluster.hpp>
#include "../../models/inspection/inspection.hpp"
#include "../../models/inspection/inspection_data.hpp"
#include <vector>
#include <optional>

namespace lms_service {

namespace inspection_submissions_controller {
    Inspection setInspector (const lms_service::InspectionData& inspection_data,
                                userver::storages::postgres::ClusterPtr pg_cluster);
} 

}