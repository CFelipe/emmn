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
include passpredict/CMakeFiles/passpredict.dir/depend.make

# Include the progress variables for this target.
include passpredict/CMakeFiles/passpredict.dir/progress.make

# Include the compile flags for this target's objects.
include passpredict/CMakeFiles/passpredict.dir/flags.make

passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj: passpredict/CMakeFiles/passpredict.dir/flags.make
passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj: passpredict/CMakeFiles/passpredict.dir/includes_CXX.rsp
passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj: ../passpredict/passpredict.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Inpe\Documents\FelipeC\sgp4\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\passpredict && C:\Qt\Tools\mingw530_32\bin\g++.exe  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\passpredict.dir\passpredict.cpp.obj -c C:\Users\Inpe\Documents\FelipeC\sgp4\passpredict\passpredict.cpp

passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/passpredict.dir/passpredict.cpp.i"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\passpredict && C:\Qt\Tools\mingw530_32\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Inpe\Documents\FelipeC\sgp4\passpredict\passpredict.cpp > CMakeFiles\passpredict.dir\passpredict.cpp.i

passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/passpredict.dir/passpredict.cpp.s"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\passpredict && C:\Qt\Tools\mingw530_32\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Inpe\Documents\FelipeC\sgp4\passpredict\passpredict.cpp -o CMakeFiles\passpredict.dir\passpredict.cpp.s

passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.requires:

.PHONY : passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.requires

passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.provides: passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.requires
	$(MAKE) -f passpredict\CMakeFiles\passpredict.dir\build.make passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.provides.build
.PHONY : passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.provides

passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.provides.build: passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj


# Object files for target passpredict
passpredict_OBJECTS = \
"CMakeFiles/passpredict.dir/passpredict.cpp.obj"

# External object files for target passpredict
passpredict_EXTERNAL_OBJECTS =

passpredict/passpredict.exe: passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj
passpredict/passpredict.exe: passpredict/CMakeFiles/passpredict.dir/build.make
passpredict/passpredict.exe: libsgp4/libsgp4.a
passpredict/passpredict.exe: passpredict/CMakeFiles/passpredict.dir/linklibs.rsp
passpredict/passpredict.exe: passpredict/CMakeFiles/passpredict.dir/objects1.rsp
passpredict/passpredict.exe: passpredict/CMakeFiles/passpredict.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Inpe\Documents\FelipeC\sgp4\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable passpredict.exe"
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\passpredict && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\passpredict.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
passpredict/CMakeFiles/passpredict.dir/build: passpredict/passpredict.exe

.PHONY : passpredict/CMakeFiles/passpredict.dir/build

passpredict/CMakeFiles/passpredict.dir/requires: passpredict/CMakeFiles/passpredict.dir/passpredict.cpp.obj.requires

.PHONY : passpredict/CMakeFiles/passpredict.dir/requires

passpredict/CMakeFiles/passpredict.dir/clean:
	cd /d C:\Users\Inpe\Documents\FelipeC\sgp4\build\passpredict && $(CMAKE_COMMAND) -P CMakeFiles\passpredict.dir\cmake_clean.cmake
.PHONY : passpredict/CMakeFiles/passpredict.dir/clean

passpredict/CMakeFiles/passpredict.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Inpe\Documents\FelipeC\sgp4 C:\Users\Inpe\Documents\FelipeC\sgp4\passpredict C:\Users\Inpe\Documents\FelipeC\sgp4\build C:\Users\Inpe\Documents\FelipeC\sgp4\build\passpredict C:\Users\Inpe\Documents\FelipeC\sgp4\build\passpredict\CMakeFiles\passpredict.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : passpredict/CMakeFiles/passpredict.dir/depend

