project(Application)
add_executable(Application main.cpp)
target_link_libraries(Application ${TINY2D_LIBRARY_DEBUG} ${TINY2D_LIBRARY_RELEASE})