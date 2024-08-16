add_library(utils STATIC
    utils.hpp
    validation/time.hpp
    validation/time.cpp
)

target_include_directories(utils PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(utils PUBLIC userver::postgresql)