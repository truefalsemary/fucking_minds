add_library(controllers STATIC
    authentication/auth_controller.hpp
    authentication/auth_controller.cpp
    authentication/sign_controller.hpp
    authentication/sign_controller.cpp

    catalogs/course_catalog_controller.hpp
    catalogs/course_catalog_controller.cpp
    catalogs/lesson_catalog_controller.hpp
    catalogs/lesson_catalog_controller.cpp
    catalogs/task_catalog_controller.hpp
    catalogs/task_catalog_controller.cpp
    catalogs/material_catalog_controller.hpp
    catalogs/material_catalog_controller.cpp

    course_administration/course_administration_controller.hpp
    course_administration/course_administration_controller.cpp

    submissions/submissions_controller.hpp
    submissions/submissions_controller.hpp

    users/user_controller.hpp
    users/user_controller.cpp

    submissions/submissions_controller.hpp
    submissions/submissions_controller.cpp

)

target_include_directories(controllers PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(controllers PUBLIC userver::postgresql)