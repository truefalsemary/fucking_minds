add_library(models STATIC
    auth/token_model.hpp
    auth/token_model.cpp

    courses/course_data.hpp
    courses/course_data.cpp
    courses/course.hpp
    courses/course.cpp

    enums/user_type.hpp
    enums/user_type.cpp
    enums/user_role.hpp
    enums/user_role.cpp
    enums/status_code.hpp

    lesson/lesson_data.hpp
    lesson/lesson_data.cpp
    lesson/lesson.hpp
    lesson/lesson.cpp

    serialization/serialization.hpp
    serialization/serialization.cpp

    sign/sign_data.hpp

    task/task_data.hpp
    task/task_data.cpp
    task/task.hpp
    task/task.cpp

    user/user_session.hpp
    user/user_session.cpp
    user/user_data.hpp
    user/user_data.cpp
    user/user.hpp
    user/user.cpp

    user_course/user_course_data.hpp
    user_course/user_course.hpp
    user_course/user_course.cpp

    lesson_course/lesson_course_data.hpp
    lesson_course/lesson_course.hpp
    lesson_course/lesson_course.cpp

    material/material.hpp
    material/material.cpp
    material/material_data.hpp
    material/material_data.cpp
)

target_include_directories(models PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(models PUBLIC userver::postgresql)