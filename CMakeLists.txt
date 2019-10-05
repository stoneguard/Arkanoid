cmake_minimum_required(VERSION 2.6)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" )
# default configurations postfix
set(CMAKE_DEBUG_POSTFIX   "-debug")
set(CMAKE_RELEASE_POSTFIX "")

set_property(GLOBAL PROPERTY DEBUG_CONFIGURATIONS Debug) 

project(Arkanoid)

SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(compiler_version "vc14")
set(architecture "x64")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${Arkanoid_SOURCE_DIR}/cmake")

#if (${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
#	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -std=c++11")
#	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG} -g")
#	set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE} -O2")
#elseif (${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
#	if (CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
#		string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
#	else()
#		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
#	endif()
#endif()

file(RELATIVE_PATH
    SCRIPT_PATH # Output variable
    "${Arkanoid_SOURCE_DIR}/source/bin/Debug" # Base directory
    "${Arkanoid_SOURCE_DIR}/scripts/" # Absolute path to the file
)

file(RELATIVE_PATH
    RESOURCE_PATH # Output variable
    "${Arkanoid_SOURCE_DIR}/build/bin/Debug" # Base directory
    "${Arkanoid_SOURCE_DIR}/resources/" # Absolute path to the file
)

set(SCRIPT_PATH \"${SCRIPT_PATH}/\")
set(RESOURCE_PATH \"${RESOURCE_PATH}/\")
configure_file( ${Arkanoid_SOURCE_DIR}/include/rmgr.h.in ${CMAKE_BINARY_DIR}/generated/rmgr.h )
set(RMGR_INCLUDE_PATH "${CMAKE_BINARY_DIR}/generated")

set(INCLUDE_DIRECTORY "${Arkanoid_SOURCE_DIR}/include")

include(external_dependecies)

add_subdirectory(source/application)
add_subdirectory(source/engine)

file(
  WRITE ${CMAKE_BINARY_DIR}/Arkanoid.bat
  "@echo off\n"
  "call \"%vs140comntools%/vsvars32.bat\"\n"
  "start devenv.exe Arkanoid.sln\n"
)   