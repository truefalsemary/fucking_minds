#pragma once

#include <userver/components/component_list.hpp>

namespace lms_service {
void AppendPostgresComponents(
    userver::components::ComponentList& component_list);
}
