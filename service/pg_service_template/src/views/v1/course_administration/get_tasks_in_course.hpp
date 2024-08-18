#pragma once

#include <userver/components/component_list.hpp>

namespace lms_service {

void AppendGetTasksInCourseView(
    userver::components::ComponentList& component_list);

}  // namespace lms_service