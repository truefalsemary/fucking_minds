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
  lms_service::AppendCreateCourseView(component_list);
  lms_service::AppendGetCoursesView(component_list);
  lms_service::AppendCreateLessonView(component_list);
  lms_service::AppendLoginUser(component_list);
  lms_service::AppendRegisterUser(component_list);
  lms_service::AppendGetLessonsView(component_list);
  lms_service::AppendLessonByIdView(component_list);
  lms_service::AppendUserView(component_list);
  lms_service::AppendUserTypeChangeView(component_list);
  
  lms_service::AppendEnrollInCourseView(component_list);
  lms_service::AppendLeaveCourseView(component_list);

  lms_service::AppendCreateTaskView(component_list);
  lms_service::AppendGetTasksView(component_list);
  lms_service::AppendTaskByIdView(component_list);
  lms_service::AppendCreateMaterialView(component_list);
  lms_service::AppendGetMaterialsView(component_list);
  lms_service::AppendMaterialByIdView(component_list);
  lms_service::AppendAddUserToCourseView(component_list);

  return userver::utils::DaemonMain(argc, argv, component_list);
}
