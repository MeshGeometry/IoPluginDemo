# Set CMake modules search path
set (CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)

# Include Urho3D Cmake common module
include (Urho3D-CMake-common)

set(CMAKE_DEBUG_POSTFIX "_d")

set (TARGET_NAME MyPlugin)

# Find Urho3D library
find_package (Urho3D REQUIRED)
include_directories (${URHO3D_INCLUDE_DIRS})
include_directories("../Core")

define_source_files()

set(RESOURCE_DIRS "")

setup_library(SHARED)

target_link_libraries(${TARGET_NAME} Core)


