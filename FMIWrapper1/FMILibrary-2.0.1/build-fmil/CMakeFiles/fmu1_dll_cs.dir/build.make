# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/robbr48/h/Dependencies/FMILibrary-2.0.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil

# Include any dependencies generated for this target.
include CMakeFiles/fmu1_dll_cs.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/fmu1_dll_cs.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fmu1_dll_cs.dir/flags.make

CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o: CMakeFiles/fmu1_dll_cs.dir/flags.make
CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o: ../Test/FMI1/fmu_dummy/fmu1_model_cs.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o   -c /home/robbr48/h/Dependencies/FMILibrary-2.0.1/Test/FMI1/fmu_dummy/fmu1_model_cs.c

CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/robbr48/h/Dependencies/FMILibrary-2.0.1/Test/FMI1/fmu_dummy/fmu1_model_cs.c > CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.i

CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/robbr48/h/Dependencies/FMILibrary-2.0.1/Test/FMI1/fmu_dummy/fmu1_model_cs.c -o CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.s

CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.requires:
.PHONY : CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.requires

CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.provides: CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.requires
	$(MAKE) -f CMakeFiles/fmu1_dll_cs.dir/build.make CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.provides.build
.PHONY : CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.provides

CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.provides.build: CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o

# Object files for target fmu1_dll_cs
fmu1_dll_cs_OBJECTS = \
"CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o"

# External object files for target fmu1_dll_cs
fmu1_dll_cs_EXTERNAL_OBJECTS =

libfmu1_dll_cs.so: CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o
libfmu1_dll_cs.so: CMakeFiles/fmu1_dll_cs.dir/build.make
libfmu1_dll_cs.so: CMakeFiles/fmu1_dll_cs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library libfmu1_dll_cs.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fmu1_dll_cs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fmu1_dll_cs.dir/build: libfmu1_dll_cs.so
.PHONY : CMakeFiles/fmu1_dll_cs.dir/build

CMakeFiles/fmu1_dll_cs.dir/requires: CMakeFiles/fmu1_dll_cs.dir/Test/FMI1/fmu_dummy/fmu1_model_cs.c.o.requires
.PHONY : CMakeFiles/fmu1_dll_cs.dir/requires

CMakeFiles/fmu1_dll_cs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fmu1_dll_cs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fmu1_dll_cs.dir/clean

CMakeFiles/fmu1_dll_cs.dir/depend:
	cd /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robbr48/h/Dependencies/FMILibrary-2.0.1 /home/robbr48/h/Dependencies/FMILibrary-2.0.1 /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil/CMakeFiles/fmu1_dll_cs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fmu1_dll_cs.dir/depend

