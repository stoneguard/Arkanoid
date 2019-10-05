cmake_minimum_required(VERSION 2.6)
project(Arkanoid)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${Arkanoid_SOURCE_DIR}/cmake")

if (${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -std=c++11")
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG} -g")
	set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE} -O2")
elseif (${CMAKE_CXX_COMPILER_ID} STREQUAL "MSVC")
	if (CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
		string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
	else()
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
	endif()
endif()

find_package(Tiny2D REQUIRED)
include_directories(${Tiny2D_INCLUDE_PATH})

add_subdirectory(source)

file(
  WRITE ${CMAKE_BINARY_DIR}/Arkanoid.bat
  "@echo off\n"
  "call \"%vs140comntools%/vsvars32.bat\"\n"
  "start devenv.exe Arkanoid.sln\n"
)   