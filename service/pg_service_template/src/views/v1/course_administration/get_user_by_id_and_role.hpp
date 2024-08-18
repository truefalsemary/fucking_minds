#pragma once

#include <userver/components/component_list.hpp>

namespace lms_service {

void AppendGetUserByIdAndRoleView(
    userver::components::ComponentList& component_list);

}  // namespace lms_service