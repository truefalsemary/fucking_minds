#include "postgres_components.hpp"

#include <userver/clients/dns/component.hpp>
#include <userver/clients/http/component.hpp>
#include <userver/components/component.hpp>
#include <userver/components/component_list.hpp>
#include <userver/storages/postgres/cluster.hpp>
#include <userver/storages/postgres/component.hpp>

namespace lms_service {
void AppendPostgresComponents(
    userver::components::ComponentList& component_list) {
  component_list.Append<userver::components::Postgres>("lms_service_db_1");
  component_list.Append<userver::clients::dns::Component>();
}
}  // namespace lms_service