# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/2.8.8/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/2.8.8/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/local/Cellar/cmake/2.8.8/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/bradleymeck/Documents/clean/winston-tee/curl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/bradleymeck/Documents/clean/winston-tee/curl

# Include any dependencies generated for this target.
include tests/libtest/CMakeFiles/lib552.dir/depend.make

# Include the progress variables for this target.
include tests/libtest/CMakeFiles/lib552.dir/progress.make

# Include the compile flags for this target's objects.
include tests/libtest/CMakeFiles/lib552.dir/flags.make

tests/libtest/CMakeFiles/lib552.dir/lib552.c.o: tests/libtest/CMakeFiles/lib552.dir/flags.make
tests/libtest/CMakeFiles/lib552.dir/lib552.c.o: tests/libtest/lib552.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/bradleymeck/Documents/clean/winston-tee/curl/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/libtest/CMakeFiles/lib552.dir/lib552.c.o"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lib552.dir/lib552.c.o   -c /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest/lib552.c

tests/libtest/CMakeFiles/lib552.dir/lib552.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lib552.dir/lib552.c.i"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest/lib552.c > CMakeFiles/lib552.dir/lib552.c.i

tests/libtest/CMakeFiles/lib552.dir/lib552.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lib552.dir/lib552.c.s"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest/lib552.c -o CMakeFiles/lib552.dir/lib552.c.s

tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.requires:
.PHONY : tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.requires

tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.provides: tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.requires
	$(MAKE) -f tests/libtest/CMakeFiles/lib552.dir/build.make tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.provides.build
.PHONY : tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.provides

tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.provides.build: tests/libtest/CMakeFiles/lib552.dir/lib552.c.o

tests/libtest/CMakeFiles/lib552.dir/first.c.o: tests/libtest/CMakeFiles/lib552.dir/flags.make
tests/libtest/CMakeFiles/lib552.dir/first.c.o: tests/libtest/first.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/bradleymeck/Documents/clean/winston-tee/curl/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/libtest/CMakeFiles/lib552.dir/first.c.o"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lib552.dir/first.c.o   -c /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest/first.c

tests/libtest/CMakeFiles/lib552.dir/first.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lib552.dir/first.c.i"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest/first.c > CMakeFiles/lib552.dir/first.c.i

tests/libtest/CMakeFiles/lib552.dir/first.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lib552.dir/first.c.s"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest/first.c -o CMakeFiles/lib552.dir/first.c.s

tests/libtest/CMakeFiles/lib552.dir/first.c.o.requires:
.PHONY : tests/libtest/CMakeFiles/lib552.dir/first.c.o.requires

tests/libtest/CMakeFiles/lib552.dir/first.c.o.provides: tests/libtest/CMakeFiles/lib552.dir/first.c.o.requires
	$(MAKE) -f tests/libtest/CMakeFiles/lib552.dir/build.make tests/libtest/CMakeFiles/lib552.dir/first.c.o.provides.build
.PHONY : tests/libtest/CMakeFiles/lib552.dir/first.c.o.provides

tests/libtest/CMakeFiles/lib552.dir/first.c.o.provides.build: tests/libtest/CMakeFiles/lib552.dir/first.c.o

tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o: tests/libtest/CMakeFiles/lib552.dir/flags.make
tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o: lib/warnless.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/bradleymeck/Documents/clean/winston-tee/curl/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lib552.dir/__/__/lib/warnless.c.o   -c /Users/bradleymeck/Documents/clean/winston-tee/curl/lib/warnless.c

tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lib552.dir/__/__/lib/warnless.c.i"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /Users/bradleymeck/Documents/clean/winston-tee/curl/lib/warnless.c > CMakeFiles/lib552.dir/__/__/lib/warnless.c.i

tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lib552.dir/__/__/lib/warnless.c.s"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /Users/bradleymeck/Documents/clean/winston-tee/curl/lib/warnless.c -o CMakeFiles/lib552.dir/__/__/lib/warnless.c.s

tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.requires:
.PHONY : tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.requires

tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.provides: tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.requires
	$(MAKE) -f tests/libtest/CMakeFiles/lib552.dir/build.make tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.provides.build
.PHONY : tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.provides

tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.provides.build: tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o

# Object files for target lib552
lib552_OBJECTS = \
"CMakeFiles/lib552.dir/lib552.c.o" \
"CMakeFiles/lib552.dir/first.c.o" \
"CMakeFiles/lib552.dir/__/__/lib/warnless.c.o"

# External object files for target lib552
lib552_EXTERNAL_OBJECTS =

tests/libtest/lib552: tests/libtest/CMakeFiles/lib552.dir/lib552.c.o
tests/libtest/lib552: tests/libtest/CMakeFiles/lib552.dir/first.c.o
tests/libtest/lib552: tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o
tests/libtest/lib552: tests/libtest/CMakeFiles/lib552.dir/build.make
tests/libtest/lib552: /usr/lib/libz.dylib
tests/libtest/lib552: /opt/local/lib/libssl.dylib
tests/libtest/lib552: /opt/local/lib/libcrypto.dylib
tests/libtest/lib552: lib/libcurl.dylib
tests/libtest/lib552: /usr/lib/libz.dylib
tests/libtest/lib552: /opt/local/lib/libssl.dylib
tests/libtest/lib552: /opt/local/lib/libcrypto.dylib
tests/libtest/lib552: tests/libtest/CMakeFiles/lib552.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable lib552"
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lib552.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/libtest/CMakeFiles/lib552.dir/build: tests/libtest/lib552
.PHONY : tests/libtest/CMakeFiles/lib552.dir/build

tests/libtest/CMakeFiles/lib552.dir/requires: tests/libtest/CMakeFiles/lib552.dir/lib552.c.o.requires
tests/libtest/CMakeFiles/lib552.dir/requires: tests/libtest/CMakeFiles/lib552.dir/first.c.o.requires
tests/libtest/CMakeFiles/lib552.dir/requires: tests/libtest/CMakeFiles/lib552.dir/__/__/lib/warnless.c.o.requires
.PHONY : tests/libtest/CMakeFiles/lib552.dir/requires

tests/libtest/CMakeFiles/lib552.dir/clean:
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest && $(CMAKE_COMMAND) -P CMakeFiles/lib552.dir/cmake_clean.cmake
.PHONY : tests/libtest/CMakeFiles/lib552.dir/clean

tests/libtest/CMakeFiles/lib552.dir/depend:
	cd /Users/bradleymeck/Documents/clean/winston-tee/curl && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/bradleymeck/Documents/clean/winston-tee/curl /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest /Users/bradleymeck/Documents/clean/winston-tee/curl /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest /Users/bradleymeck/Documents/clean/winston-tee/curl/tests/libtest/CMakeFiles/lib552.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/libtest/CMakeFiles/lib552.dir/depend

