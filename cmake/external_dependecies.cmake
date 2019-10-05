message("Searching for external dependecies ...")

set(libraries Squirrel Squall Tiny2D)
foreach(library IN LISTS libraries)
	find_package(${library} REQUIRED)
endforeach()

#summarize 

#foreach(library IN LISTS libraries)
#	if(DEFINED ${library}_INCLUDE_PATH)
#		message(STATUS "${library}      [+]")
#	else()
#		message(STATUS "${library}      [-]")
#endif()
#endforeach()

