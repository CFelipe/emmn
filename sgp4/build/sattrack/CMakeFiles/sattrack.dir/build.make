# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Inpe\Documents\FelipeC\sgp4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Inpe\Documents\FelipeC\sgp4\build

# Include any dependencies generated for this target.
include sattrack/CMakeFiles/sattrack.dir/depend.make

# Include the progress variables for this target.
include sattrack/CMakeFiles/sattrack.dir/progress.make

# Include the compile flags for this target's objects.
include sattrack/CMakeFiles/sattrack.dir/flags.make

sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj: sattrack/CMakeFiles/sattrack.dir/flags.make
sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj: sattrack/CMakeFiles/sattrack.dir/includes_CXX.rsp
sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj: ../sattrack/sattrack.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Inpe\Documents\FelipeC\sgp4\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\sattrack && C:\Qt\Tools\mingw530_32\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\sattrack.dir\sattrack.cpp.obj -c C:\Users\Inpe\Documents\FelipeC\sgp4\sattrack\sattrack.cpp

sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sattrack.dir/sattrack.cpp.i"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\sattrack && C:\Qt\Tools\mingw530_32\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Inpe\Documents\FelipeC\sgp4\sattrack\sattrack.cpp > CMakeFiles\sattrack.dir\sattrack.cpp.i

sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sattrack.dir/sattrack.cpp.s"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\sattrack && C:\Qt\Tools\mingw530_32\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Inpe\Documents\FelipeC\sgp4\sattrack\sattrack.cpp -o CMakeFiles\sattrack.dir\sattrack.cpp.s

sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.requires:

.PHONY : sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.requires

sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.provides: sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.requires
	$(MAKE) -f sattrack\CMakeFiles\sattrack.dir\build.make sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.provides.build
.PHONY : sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.provides

sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.provides.build: sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj


# Object files for target sattrack
sattrack_OBJECTS = \
"CMakeFiles/sattrack.dir/sattrack.cpp.obj"

# External object files for target sattrack
sattrack_EXTERNAL_OBJECTS =

sattrack/sattrack.exe: sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj
sattrack/sattrack.exe: sattrack/CMakeFiles/sattrack.dir/build.make
sattrack/sattrack.exe: libsgp4/libsgp4.a
sattrack/sattrack.exe: sattrack/CMakeFiles/sattrack.dir/linklibs.rsp
sattrack/sattrack.exe: sattrack/CMakeFiles/sattrack.dir/objects1.rsp
sattrack/sattrack.exe: sattrack/CMakeFiles/sattrack.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Inpe\Documents\FelipeC\sgp4\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sattrack.exe"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\sattrack && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\sattrack.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sattrack/CMakeFiles/sattrack.dir/build: sattrack/sattrack.exe

.PHONY : sattrack/CMakeFiles/sattrack.dir/build

sattrack/CMakeFiles/sattrack.dir/requires: sattrack/CMakeFiles/sattrack.dir/sattrack.cpp.obj.requires

.PHONY : sattrack/CMakeFiles/sattrack.dir/requires

sattrack/CMakeFiles/sattrack.dir/clean:
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\sattrack && $(CMAKE_COMMAND) -P CMakeFiles\sattrack.dir\cmake_clean.cmake
.PHONY : sattrack/CMakeFiles/sattrack.dir/clean

sattrack/CMakeFiles/sattrack.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Inpe\Documents\FelipeC\sgp4 C:\Users\Inpe\Documents\FelipeC\sgp4\sattrack C:\Users\Inpe\Documents\FelipeC\sgp4\build C:\Users\Inpe\Documents\FelipeC\sgp4\build\sattrack C:\Users\Inpe\Documents\FelipeC\sgp4\build\sattrack\CMakeFiles\sattrack.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : sattrack/CMakeFiles/sattrack.dir/depend
