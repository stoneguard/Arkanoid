set(LIBRARRY_NAME "Squall")

execute_process(COMMAND ${CMAKE_COMMAND} -E echo_append "Searching for ${LIBRARRY_NAME} ... ")

#Find Squall includes
find_path(SQUALL_INCLUDE_PATH squall_vm.hpp PATHS "${CMAKE_SOURCE_DIR}/sdk/squall/include")

if(SQUALL_INCLUDE_PATH)
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "DONE")
else()
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "FAILED")
endif()