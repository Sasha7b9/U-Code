cmake_minimum_required(VERSION 3.16)

# Libraries linked via full path no longer produce linker search paths
cmake_policy (SET CMP0003 NEW)
# link_directories() treats paths relative to the source dir.
cmake_policy (SET CMP0015 NEW)
# MSVC runtime library flags are selected an abstraction
cmake_policy(SET CMP0091 NEW)
# RPATH entries are properly escaped in the intermediary CMake install script.
cmake_policy(SET CMP0095 NEW)

project (TacticsVictory)

set (TARGET_NAME TacticsVictory)

find_package (Urho3D REQUIRED)
include_directories (${URHO3D_INCLUDE_DIRS})

set(CMAKE_UNITY_BUILD ON)

if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
    set(_BUILD_TYPE_ debug)
    add_definitions(-DDEBUG)
elseif(${CMAKE_BUILD_TYPE} STREQUAL Release)
    set(_BUILD_TYPE_ release)
endif()

get_filename_component(_ROOT_DIR_ ${CMAKE_BINARY_DIR}\\..\\.. ABSOLUTE)
file(TO_NATIVE_PATH ${_ROOT_DIR_} _ROOT_DIR_)
set(_OUT_DIR_ ${_ROOT_DIR_}\\${TARGET_NAME}\\out\\${_BUILD_TYPE_})
if(WIN32)
	file(TO_NATIVE_PATH ${_OUT_DIR_} _OUT_DIR_)
else()
	get_filename_component(_OUT_DIR_ ${_OUT_DIR_} ABSOLUTE)
endif()


if(MSVC)
	file(TO_NATIVE_PATH ${_OUT_DIR_} _OUT_DIR_)
else()
	get_filename_component(_OUT_DIR_ ${_OUT_DIR_} ABSOLUTE)
endif()

link_directories(../../generated/Urho3D/${_BUILD_TYPE_}/lib)

if(WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -MP -Wall")
else()
    add_definitions(-m64 -msse -msse2 -fno-strict-aliasing -fmax-errors=1 -Wall -Werror -ffast-math)

    if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
        add_definitions(-O0)
    else()
        add_definitions(-O3)
    endif()

endif()


include(TacticsVictoryCommon.cmake)


set_property(GLOBAL PROPERTY USE_FOLDERS ON)
define_property(
    TARGET
    PROPERTY FOLDER
    INHERITED
    BRIEF_DOCS "Set the folder name."
    FULL_DOCS "Use to organize targets in an IDE."
)

function(add_subdirectory_with_folder _folder_name _folder)
    add_subdirectory(${_folder} ${ARGN})
    set_property(DIRECTORY "${_folder}" PROPERTY FOLDER "${_folder_name}")
endfunction()


if(MSVC)
    add_subdirectory_with_folder("TacticsVictory/local" local/Battler)
    add_subdirectory_with_folder("TacticsVictory/local" local/Client)
    add_subdirectory_with_folder("TacticsVictory/local" local/Editor)
    add_subdirectory_with_folder("TacticsVictory/local" local/Hangar)
    add_subdirectory_with_folder("TacticsVictory/local" local/Updater)
endif()

add_subdirectory_with_folder("TacticsVictory/common" common/Battle)
add_subdirectory_with_folder("TacticsVictory/common" common/Controller)
add_subdirectory_with_folder("TacticsVictory/common" common/Monitor)
add_subdirectory_with_folder("TacticsVictory/common" common/Uploader)
add_subdirectory_with_folder("TacticsVictory/common" common/LivingRoom)

add_subdirectory_with_folder("TacticsVictory/remote" remote/DataBase)
add_subdirectory_with_folder("TacticsVictory/remote" remote/Master)

add_subdirectory_with_folder("TacticsVictory/libs" libs/victory)
