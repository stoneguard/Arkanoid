set(compiler_version "vc14")
set(architecture "x64")

message("Searching for Tiny2D ...")

#Find Tiny2D includes
find_path(Tiny2D_INCLUDE_PATH Tiny2D.h PATHS "${CMAKE_SOURCE_DIR}/sdk/tiny2d/include")
if(DEFINED Tiny2D_INCLUDE_PATH)
   message(STATUS "Tiny2D      [+]")
else()
   message(STATUS "Tiny2D      [-]")
endif()

#Find Tiny2D Libraries

#Debug
find_library(TINY2D_LIBRARY_DEBUG NAMES "Tiny2DDebug" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/tiny2d/lib/${compiler_version}_${architecture}" debug)
 
#Release
find_library(TINY2D_LIBRARY_REL NAMES "Tiny2DRelease" PATHS
 "${CMAKE_SOURCE_DIR}/sdk/tiny2d/lib/${compiler_version}_${architecture}" release relwithdebinfo minsizerel)
 
get_filename_component(TINY2D_LIBRARY_PATH ${TINY2D_LIBRARY_DEBUG} DIRECTORY) 