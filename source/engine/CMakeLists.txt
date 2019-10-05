cmake_minimum_required(VERSION 2.6)

set(project_name "engine")
project( ${project_name})			

include_directories(${RMGR_INCLUDE_PATH}) 
include_directories(${SQUALL_INCLUDE_PATH})
include_directories(${SQUIRREL_INCLUDE_PATH})
include_directories(${TINY2D_INCLUDE_PATH})
include_directories(${INCLUDE_DIRECTORY})

set( SOURCE engine.cpp ${INCLUDE_DIRECTORY}/engine.h)		
set ( CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON )

add_library( ${project_name} SHARED ${SOURCE} )	

target_link_libraries(${project_name} ${SQUIRREL_LIBRARY} ${SQSTD_LIBRARY} ${TINY2D_LIBRARY})

