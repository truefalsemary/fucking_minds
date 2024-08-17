add_library(components STATIC
    views.hpp
    postgres_components/postgres_components.hpp
    postgres_components/postgres_components.cpp
)

target_include_directories(components PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(components PUBLIC userver::postgresql)