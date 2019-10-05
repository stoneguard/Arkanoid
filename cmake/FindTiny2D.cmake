set(LIBRARRY_NAME "Tiny2D")

execute_process(COMMAND ${CMAKE_COMMAND} -E echo_append "Searching for ${LIBRARRY_NAME} ... ")

include(util)

#Find Tiny2D includes
find_path(TINY2D_INCLUDE_PATH ${LIBRARRY_NAME}.h PATHS "${CMAKE_SOURCE_DIR}/sdk/tiny2d/include")

#Find Tiny2D Libraries

#Debug
find_library(TINY2D_LIBRARY_DEBUG NAMES "${LIBRARRY_NAME}Debug" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/tiny2d/lib/${compiler_version}_${architecture}" debug)
 
#Release
find_library(TINY2D_LIBRARY_REL NAMES "${LIBRARRY_NAME}Release" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/tiny2d/lib/${compiler_version}_${architecture}" release relwithdebinfo minsizerel)
 
get_filename_component(TINY2D_LIBRARY_PATH ${TINY2D_LIBRARY_DEBUG} DIRECTORY) 

create_alias(TINY2D_LIBRARY)

if(TINY2D_INCLUDE_PATH AND
	TINY2D_LIBRARY_DEBUG AND 
	TINY2D_LIBRARY_REL)
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "DONE")
else()
	execute_process(COMMAND ${CMAKE_COMMAND} -E echo "FAILED")
endif()