# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/esaddogan/edrone_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/esaddogan/edrone_ws/build

# Include any dependencies generated for this target.
include vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/depend.make

# Include the progress variables for this target.
include vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/progress.make

# Include the compile flags for this target's objects.
include vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/flags.make

vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.o: vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/flags.make
vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.o: /home/esaddogan/edrone_ws/src/vitarana_drone/src/gazebo_edrone_propulsion.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/esaddogan/edrone_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.o"
	cd /home/esaddogan/edrone_ws/build/vitarana_drone && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.o -c /home/esaddogan/edrone_ws/src/vitarana_drone/src/gazebo_edrone_propulsion.cpp

vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.i"
	cd /home/esaddogan/edrone_ws/build/vitarana_drone && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/esaddogan/edrone_ws/src/vitarana_drone/src/gazebo_edrone_propulsion.cpp > CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.i

vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.s"
	cd /home/esaddogan/edrone_ws/build/vitarana_drone && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/esaddogan/edrone_ws/src/vitarana_drone/src/gazebo_edrone_propulsion.cpp -o CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.s

# Object files for target gazebo_edrone_propulsion
gazebo_edrone_propulsion_OBJECTS = \
"CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.o"

# External object files for target gazebo_edrone_propulsion
gazebo_edrone_propulsion_EXTERNAL_OBJECTS =

/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/src/gazebo_edrone_propulsion.cpp.o
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/build.make
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libgazebo_ros_api_plugin.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libgazebo_ros_paths_plugin.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libroslib.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/librospack.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libpython3.8.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libtf.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libtf2_ros.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libactionlib.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libmessage_filters.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libroscpp.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libtf2.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/librosconsole.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/librostime.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /opt/ros/noetic/lib/libcpp_common.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libSimTKsimbody.so.3.6
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libdart.so.6.9.2
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_client.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_gui.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_sensors.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_rendering.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_physics.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_ode.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_transport.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_msgs.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_util.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_common.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_gimpact.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_opcode.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libgazebo_opende_ou.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libsdformat9.so.9.10.1
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libOgreMain.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libOgreTerrain.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libOgrePaging.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libignition-common3-graphics.so.3.17.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libSimTKmath.so.3.6
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libSimTKcommon.so.3.6
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libblas.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/liblapack.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libblas.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/liblapack.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libdart-external-odelcpsolver.so.6.9.2
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libccd.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libfcl.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libassimp.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/liboctomap.so.1.9.3
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/liboctomath.so.1.9.3
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libboost_atomic.so.1.71.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libignition-transport8.so.8.5.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libignition-fuel_tools4.so.4.9.1
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libignition-msgs5.so.5.11.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libignition-math6.so.6.15.1
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libignition-common3.so.3.17.0
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libuuid.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: /usr/lib/x86_64-linux-gnu/libuuid.so
/home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so: vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/esaddogan/edrone_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so"
	cd /home/esaddogan/edrone_ws/build/vitarana_drone && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gazebo_edrone_propulsion.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/build: /home/esaddogan/edrone_ws/devel/lib/libgazebo_edrone_propulsion.so

.PHONY : vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/build

vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/clean:
	cd /home/esaddogan/edrone_ws/build/vitarana_drone && $(CMAKE_COMMAND) -P CMakeFiles/gazebo_edrone_propulsion.dir/cmake_clean.cmake
.PHONY : vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/clean

vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/depend:
	cd /home/esaddogan/edrone_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/esaddogan/edrone_ws/src /home/esaddogan/edrone_ws/src/vitarana_drone /home/esaddogan/edrone_ws/build /home/esaddogan/edrone_ws/build/vitarana_drone /home/esaddogan/edrone_ws/build/vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vitarana_drone/CMakeFiles/gazebo_edrone_propulsion.dir/depend

