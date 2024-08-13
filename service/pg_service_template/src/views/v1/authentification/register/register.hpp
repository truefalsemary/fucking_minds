#pragma once

#include <userver/components/component_list.hpp>

namespace lms_service {
bool isValidEmail(const std::string& email);
void AppendRegisterUser(userver::components::ComponentList& component_list);

}  // namespace lms_service
