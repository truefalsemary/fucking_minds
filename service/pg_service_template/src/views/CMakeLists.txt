add_library(views STATIC
    v1/authentication/login/login.hpp
    v1/authentication/login/login.cpp

    v1/authentication/register/register.hpp
    v1/authentication/register/register.cpp

    v1/catalogs/courses/create_course.hpp
    v1/catalogs/courses/create_course.cpp
    v1/catalogs/courses/get_courses.hpp
    v1/catalogs/courses/get_courses.cpp
    v1/catalogs/courses/course_by_id_view.hpp
    v1/catalogs/courses/course_by_id_view.cpp

    v1/catalogs/lessons/create_lesson.hpp
    v1/catalogs/lessons/create_lesson.cpp
    v1/catalogs/lessons/get_lessons.hpp
    v1/catalogs/lessons/get_lessons.cpp
    v1/catalogs/lessons/lesson_by_id_view.hpp
    v1/catalogs/lessons/lesson_by_id_view.cpp

    v1/catalogs/tasks/create_task.hpp
    v1/catalogs/tasks/create_task.cpp
    v1/catalogs/tasks/get_tasks.hpp
    v1/catalogs/tasks/get_tasks.cpp
    v1/catalogs/tasks/task_by_id.hpp
    v1/catalogs/tasks/task_by_id.cpp

    v1/users/enroll_in_course_view.hpp
    v1/users/enroll_in_course_view.cpp
    v1/users/leave_course_view.hpp
    v1/users/leave_course_view.cpp
    v1/users/user_type_change_view.hpp
    v1/users/user_type_change_view.cpp
    v1/users/user_view.hpp
    v1/users/user_view.cpp

    v1/catalogs/materials/create_material.hpp
    v1/catalogs/materials/create_material.cpp
    v1/catalogs/materials/get_materials.hpp
    v1/catalogs/materials/get_materials.cpp
    v1/catalogs/materials/material_by_id.hpp
    v1/catalogs/materials/material_by_id.cpp


    v1/course_administration/add_user_to_course_view.hpp
    v1/course_administration/add_user_to_course_view.cpp
    v1/course_administration/add_lesson_to_course_view.hpp
    v1/course_administration/add_lesson_to_course_view.cpp
)

target_include_directories(views PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(views PUBLIC userver::postgresql)