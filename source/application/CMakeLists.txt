project(Application)

include_directories(${INCLUDE_DIRECTORY})

add_executable(Application main.cpp)
target_link_libraries(Application engine)	