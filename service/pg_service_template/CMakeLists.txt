cmake_minimum_required(VERSION 3.12)
project(lms_service CXX)


# Adding userver dependency
find_package(userver COMPONENTS core postgresql QUIET)
if(NOT userver_FOUND)  # Fallback to subdirectory usage
    # Enable userver libraries that are needed in this project
    set(USERVER_FEATURE_POSTGRESQL ON CACHE BOOL "" FORCE)

    # Compatibility mode: some systems don't support these features
    set(USERVER_FEATURE_CRYPTOPP_BLAKE2 OFF CACHE BOOL "" FORCE)
    set(USERVER_FEATURE_GRPC_CHANNELZ OFF CACHE BOOL "" FORCE)
    set(USERVER_FEATURE_REDIS_HI_MALLOC ON CACHE BOOL "" FORCE)

    if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/userver)
        message(STATUS "Using userver framework from third_party/userver")
        add_subdirectory(third_party/userver)
    else()
        message(FATAL_ERROR "Either install the userver or provide a path to it")
    endif()
endif()

userver_setup_environment()


# Common sources
add_library(${PROJECT_NAME}_objs OBJECT

    src/utils/utils.hpp
    src/models/enums/user_type.hpp
    src/models/enums/user_type.cpp
    src/models/enums/user_role.hpp
    src/models/enums/user_type.cpp
    src/models/enums/status_code.hpp

    src/components/postgres_components/postgres_components.hpp
    src/components/postgres_components/postgres_components.cpp

    src/components/views.hpp
    src/models/auth/token_model.hpp
    src/models/auth/token_model.cpp
    src/models/user/user_session.hpp
    src/models/user/user_session.cpp
    src/models/user/user_data.hpp
    src/models/user/user_data.cpp
    src/models/user/user.hpp
    src/models/user/user.cpp
    src/controllers/authentication/auth_controller.hpp
    src/controllers/authentication/auth_controller.cpp
    src/controllers/catalogs/course_catalog_controller.hpp
    src/controllers/catalogs/course_catalog_controller.cpp
    src/views/v1/catalogs/courses/create_course.hpp
    src/views/v1/catalogs/courses/create_course.cpp

    src/models/lesson/lesson.hpp
    src/models/lesson/lesson.cpp
    src/models/lesson/lesson_data.hpp
    src/models/lesson/lesson_data.cpp
    src/controllers/catalogs/lesson_catalog_controller.hpp
    src/controllers/catalogs/lesson_catalog_controller.cpp
    src/views/v1/catalogs/lessons/create_lesson.hpp
    src/views/v1/catalogs/lessons/create_lesson.cpp

    src/models/sign/sign_data.hpp
    src/controllers/authentication/sign_controller.hpp
    src/controllers/authentication/sign_controller.cpp
    src/views/v1/authentication/login/login.hpp
    src/views/v1/authentication/login/login.cpp
    src/views/v1/authentication/register/register.hpp
    src/views/v1/authentication/register/register.cpp

    src/views/v1/catalogs/lessons/get_lessons.hpp
    src/views/v1/catalogs/lessons/get_lessons.cpp
    src/views/v1/catalogs/lessons/lesson_by_id_view.hpp
    src/views/v1/catalogs/lessons/lesson_by_id_view.cpp

    src/controllers/users/user_controller.hpp
    src/controllers/users/user_controller.cpp

    src/views/v1/users/user_view.hpp
    src/views/v1/users/user_view.cpp
)
target_link_libraries(${PROJECT_NAME}_objs PUBLIC userver::postgresql)


# The Service
add_executable(${PROJECT_NAME} src/components/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}_objs)


# Unit Tests
# add_executable(${PROJECT_NAME}_unittest
#     src/hello_test.cpp
# )
# target_link_libraries(${PROJECT_NAME}_unittest PRIVATE ${PROJECT_NAME}_objs userver::utest)
# add_google_tests(${PROJECT_NAME}_unittest)


# Benchmarks
# add_executable(${PROJECT_NAME}_benchmark
#     src/hello_benchmark.cpp
# )
# target_link_libraries(${PROJECT_NAME}_benchmark PRIVATE ${PROJECT_NAME}_objs userver::ubench)
# add_google_benchmark_tests(${PROJECT_NAME}_benchmark)


# Functional Tests
include(UserverTestsuite)

userver_testsuite_add_simple()


# Install
include(GNUInstallDirs)

if(DEFINED ENV{PREFIX})
  message(STATUS "Set install prefix: $ENV{PREFIX}")
  file(TO_CMAKE_PATH "$ENV{PREFIX}" PREFIX_PATH)
  set(CMAKE_INSTALL_PREFIX ${PREFIX_PATH})
endif()

file(GLOB CONFIGS_FILES ${CMAKE_CURRENT_SOURCE_DIR}/configs/*.yaml ${CMAKE_CURRENT_SOURCE_DIR}/configs/*.json)

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT ${PROJECT_NAME})
install(FILES ${CONFIGS_FILES} DESTINATION ${CMAKE_INSTALL_SYSCONFDIR}/${PROJECT_NAME} COMPONENT ${PROJECT_NAME})
