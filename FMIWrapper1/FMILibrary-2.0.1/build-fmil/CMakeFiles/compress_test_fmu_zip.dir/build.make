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
include CMakeFiles/compress_test_fmu_zip.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/compress_test_fmu_zip.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/compress_test_fmu_zip.dir/flags.make

CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o: CMakeFiles/compress_test_fmu_zip.dir/flags.make
CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o: ../Test/compress_test_fmu_zip.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o   -c /home/robbr48/h/Dependencies/FMILibrary-2.0.1/Test/compress_test_fmu_zip.c

CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/robbr48/h/Dependencies/FMILibrary-2.0.1/Test/compress_test_fmu_zip.c > CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.i

CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/robbr48/h/Dependencies/FMILibrary-2.0.1/Test/compress_test_fmu_zip.c -o CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.s

CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.requires:
.PHONY : CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.requires

CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.provides: CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.requires
	$(MAKE) -f CMakeFiles/compress_test_fmu_zip.dir/build.make CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.provides.build
.PHONY : CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.provides

CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.provides.build: CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o

# Object files for target compress_test_fmu_zip
compress_test_fmu_zip_OBJECTS = \
"CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o"

# External object files for target compress_test_fmu_zip
compress_test_fmu_zip_EXTERNAL_OBJECTS =

compress_test_fmu_zip: CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o
compress_test_fmu_zip: CMakeFiles/compress_test_fmu_zip.dir/build.make
compress_test_fmu_zip: libfmizip.a
compress_test_fmu_zip: Config.cmake/Minizip/libminizip.a
compress_test_fmu_zip: zlib/libz.a
compress_test_fmu_zip: libjmutils.a
compress_test_fmu_zip: ThirdParty/c99_snprintf/libc99snprintf.a
compress_test_fmu_zip: CMakeFiles/compress_test_fmu_zip.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable compress_test_fmu_zip"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/compress_test_fmu_zip.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/compress_test_fmu_zip.dir/build: compress_test_fmu_zip
.PHONY : CMakeFiles/compress_test_fmu_zip.dir/build

CMakeFiles/compress_test_fmu_zip.dir/requires: CMakeFiles/compress_test_fmu_zip.dir/Test/compress_test_fmu_zip.c.o.requires
.PHONY : CMakeFiles/compress_test_fmu_zip.dir/requires

CMakeFiles/compress_test_fmu_zip.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/compress_test_fmu_zip.dir/cmake_clean.cmake
.PHONY : CMakeFiles/compress_test_fmu_zip.dir/clean

CMakeFiles/compress_test_fmu_zip.dir/depend:
	cd /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/robbr48/h/Dependencies/FMILibrary-2.0.1 /home/robbr48/h/Dependencies/FMILibrary-2.0.1 /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil /home/robbr48/h/Dependencies/FMILibrary-2.0.1/build-fmil/CMakeFiles/compress_test_fmu_zip.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/compress_test_fmu_zip.dir/depend

