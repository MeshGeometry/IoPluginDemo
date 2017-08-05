# Set minimum version
cmake_minimum_required (VERSION 2.8.6)
if (COMMAND cmake_policy)
    cmake_policy (SET CMP0003 NEW)
    if (CMAKE_VERSION VERSION_GREATER 2.8.12 OR CMAKE_VERSION VERSION_EQUAL 2.8.12)
        # INTERFACE_LINK_LIBRARIES defines the link interface
        cmake_policy (SET CMP0022 NEW)
    endif ()
    if (CMAKE_VERSION VERSION_GREATER 3.0.0 OR CMAKE_VERSION VERSION_EQUAL 3.0.0)
        # Disallow use of the LOCATION target property - therefore we set to OLD as we still need it
        cmake_policy (SET CMP0026 OLD)
        # MACOSX_RPATH is enabled by default
        cmake_policy (SET CMP0042 NEW)
    endif ()
endif ()

# Set CMake modules search path
set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)
# Include Urho3D Cmake common module
include (Urho3D-CMake-common)

# Define target name
set (TARGET_NAME IoTest)

# Define source files
define_source_files ()

file(
    GLOB Plugin_SRC
    "../Source/Mesh_Boolean.cpp"
)


list(APPEND SOURCE_FILES ${Plugin_SRC})

#pass console arg
SET(URHO3D_WIN32_CONSOLE 1)
add_definitions(-D__TBB_NO_IMPLICIT_LINKAGE)

# Setup target with resource copying
set(RESOURCE_DIRS "")
setup_main_executable ()

#link the libs
include_directories("./googletest/include" "./googletest")
#define includes

include_directories(../Source)
include_directories(../InstantMeshes/src)
include_directories(../InstantMeshes/ext/tbb/include)
include_directories(${IOGRAM_SDK}/include/ThirdParty/Eigen)
include_directories(${IOGRAM_SDK}/include/ThirdParty/Libigl/include)
include_directories(${IOGRAM_SDK}/include/Core)
include_directories(${IOGRAM_SDK}/include/Geometry)

#link other libraries in
target_link_libraries(${TARGET_NAME} tbb_static)
target_link_libraries(${TARGET_NAME} InstantMeshes)
target_link_libraries(${TARGET_NAME} debug ${IOGRAM_SDK}/lib/Core_d.lib optimized ${IOGRAM_SDK}/lib/Core.lib )
target_link_libraries(${TARGET_NAME} debug ${IOGRAM_SDK}/lib/Geometry_d.lib  optimized ${IOGRAM_SDK}/lib/Geometry.lib )


if (MSVC)
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MD")
    SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MDd")
endif()

#compile flags
if(UNIX)
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=gnu++0x")
endif()