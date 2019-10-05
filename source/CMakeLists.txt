project(Application)
add_executable(Application main.cpp)
target_link_libraries(Application ${SDL2_LIBRARY})
install(TARGETS Application RUNTIME DESTINATION ${BIN_DIR})