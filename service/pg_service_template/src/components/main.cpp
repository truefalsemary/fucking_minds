#include <userver/clients/http/component.hpp>
#include <userver/components/minimal_server_component_list.hpp>
#include <userver/server/handlers/ping.hpp>
#include <userver/server/handlers/tests_control.hpp>
#include <userver/testsuite/testsuite_support.hpp>
#include <userver/utils/daemon_run.hpp>

#include "views.hpp"

int main(int argc, char* argv[]) {
  auto component_list = userver::components::MinimalServerComponentList()
                            .Append<userver::server::handlers::Ping>()
                            .Append<userver::components::TestsuiteSupport>()
                            .Append<userver::components::HttpClient>()
                            .Append<userver::server::handlers::TestsControl>();

  lms_service::AppendPostgresComponents(component_list);
  lms_service::AppendCourseCatalogView(component_list);
  lms_service::AppendCreateLessonView(component_list);
  lms_service::AppendLoginUser(component_list);
  lms_service::AppendRegisterUser(component_list);
  lms_service::AppendGetLessonsView(component_list);
  lms_service::AppendLessonByIdView(component_list);
  return userver::utils::DaemonMain(argc, argv, component_list);
}
