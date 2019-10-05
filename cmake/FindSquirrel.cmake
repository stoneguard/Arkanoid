set(LIBRARRY_NAME "Squirrel")

execute_process(COMMAND ${CMAKE_COMMAND} -E echo_append "Searching for ${LIBRARRY_NAME} ... ")

include(util)

set(LIBRARRY_NAME "Squirrel")

#Find Squirrel includes
find_path(SQUIRREL_INCLUDE_PATH squirrel.h PATHS "${CMAKE_SOURCE_DIR}/sdk/squirrel/include")

#Find Squirrel Libraries

#Debug
find_library(SQSTD_LIBRARY_DEBUG NAMES "sqstdlib_static" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/squirrel/lib/${compiler_version}_${architecture}/debug" debug)
 
find_library(SQUIRREL_LIBRARY_DEBUG NAMES "squirrel_static" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/squirrel/lib/${compiler_version}_${architecture}/debug" debug)
 
#Release
find_library(SQSTD_LIBRARY_REL NAMES "sqstdlib_static" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/squirrel/lib/${compiler_version}_${architecture}/release" release relwithdebinfo minsizerel)
 
find_library(SQUIRREL_LIBRARY_REL NAMES "squirrel_static" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/squirrel/lib/${compiler_version}_${architecture}/release" release relwithdebinfo minsizerel)
 
get_filename_component(SQUIRREL_LIBRARY_PATH ${SQSTD_LIBRARY_DEBUG} DIRECTORY) 

create_alias(SQUIRREL_LIBRARY)
create_alias(SQSTD_LIBRARY)

if(SQUIRREL_INCLUDE_PATH AND
	SQSTD_LIBRARY_DEBUG AND
	SQUIRREL_LIBRARY_DEBUG AND
	SQSTD_LIBRARY_REL AND
	SQUIRREL_LIBRARY_REL
	)
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "DONE")
else()
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "FAILED")
endif()
