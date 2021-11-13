cmake_minimum_required(VERSION 3.16)

# Libraries linked via full path no longer produce linker search paths
cmake_policy (SET CMP0003 NEW)
# link_directories() treats paths relative to the source dir.
cmake_policy (SET CMP0015 NEW)
# MSVC runtime library flags are selected an abstraction
cmake_policy(SET CMP0091 NEW)
# RPATH entries are properly escaped in the intermediary CMake install script.
cmake_policy(SET CMP0095 NEW)

project (VictoryU3D)

set (TARGET_NAME VictoryU3D)

find_package (Urho3D REQUIRED)
include_directories (${URHO3D_INCLUDE_DIRS})

if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
    set(_BUILD_TYPE_ debug)
    add_definitions(-DDEBUG)
elseif(${CMAKE_BUILD_TYPE} STREQUAL Release)
    set(_BUILD_TYPE_ release)
endif()

set(OUT_DIR $ENV{PROJECT_DIR}\\out\\${_BUILD_TYPE_})

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


#if(WIN32)
    add_subdirectory_with_folder("TacticsVictory/local" local/Battler)
    add_subdirectory_with_folder("TacticsVictory/local" local/Client)
    add_subdirectory_with_folder("TacticsVictory/local" local/Editor)
    add_subdirectory_with_folder("TacticsVictory/local" local/Hangar)
    add_subdirectory_with_folder("TacticsVictory/local" local/Updater)

    add_subdirectory_with_folder("TacticsVictory/common" common/Battle)
    add_subdirectory_with_folder("TacticsVictory/common" common/Controller)
    add_subdirectory_with_folder("TacticsVictory/common" common/Monitor)
    add_subdirectory_with_folder("TacticsVictory/common" common/Uploader)

    add_subdirectory_with_folder("TacticsVictory/remote" remote/DataBase)
#endif()

add_subdirectory_with_folder("TacticsVictory/common" common/LivingRoom)
add_subdirectory_with_folder("TacticsVictory/remote" remote/Master)

add_subdirectory_with_folder("TacticsVictory/libs" libs/victory)

# add_subdirectory_with_folder("experimental" experimental/test_libevent)
