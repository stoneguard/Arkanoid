set(LIBRARRY_NAME "SimpleSquirrel")

execute_process(COMMAND ${CMAKE_COMMAND} -E echo_append "Searching for ${LIBRARRY_NAME} ... ")

include(util)

#Find SimpleSquirrel includes
find_path(SIMPLE_SQUIRREL_INCLUDE_PATH simplesquirrel.hpp PATHS "${CMAKE_SOURCE_DIR}/sdk/simplesquirrel/include")

#Find SimpleSquirrel Libraries

#Debug
find_library(SIMPLE_SQUIRREL_LIBRARY_DEBUG NAMES "simplesquirrel_static" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/simplesquirrel/lib/debug" debug)
 
#find_library(SQUIRREL_LIBRARY_DEBUG NAMES "squirrel_static" PATHS
# "${CMAKE_SOURCE_DIR}/sdk/squirrel/lib/${compiler_version}_${architecture}/debug" debug)
 
#Release
find_library(SIMPLE_SQUIRREL_LIBRARY_REL NAMES "simplesquirrel_static" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/simplesquirrel/lib/release" release relwithdebinfo minsizerel)
 
#find_library(SIMPLE_SQUIRREL_LIBRARY_REL NAMES "squirrel_static" PATHS
# "${CMAKE_SOURCE_DIR}/sdk/squirrel/lib/${compiler_version}_${architecture}/release" release relwithdebinfo minsizerel)
 
get_filename_component(SIMPLE_SQUIRREL_LIBRARY_PATH ${SIMPLE_SQUIRREL_LIBRARY_REL} DIRECTORY) 

create_alias(SIMPLE_SQUIRREL_LIBRARY)

if(SIMPLE_SQUIRREL_INCLUDE_PATH AND	SIMPLE_SQUIRREL_LIBRARY_DEBUG AND SIMPLE_SQUIRREL_LIBRARY_REL)
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "DONE")
else()
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "FAILED")
endif()
