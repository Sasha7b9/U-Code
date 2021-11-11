# Libraries linked via full path no longer produce linker search paths
cmake_policy (SET CMP0003 NEW)

# link_directories() treats paths relative to the source dir.
cmake_policy (SET CMP0015 NEW)

# MSVC runtime library flags are selected an abstraction
cmake_policy(SET CMP0091 NEW)


project (TankistU3D)

set (TARGET_NAME TankistU3D)

find_package (Urho3D REQUIRED)
include_directories (${URHO3D_INCLUDE_DIRS})

if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
    set(SUB_DIR debug)
    add_definitions(-DDEBUG)
elseif(${CMAKE_BUILD_TYPE} STREQUAL Release)
    set(SUB_DIR release)
endif()

set(OUT_DIR $ENV{PROJECT_TANKIST_DIR}\\out\\${SUB_DIR})

if(WIN32)
    link_directories($ENV{PROJECT_TANKIST_DIR}/generated/${SUB_DIR}/ThirdParty/sockpp_/sockpp/${CMAKE_BUILD_TYPE}
                     ../../generated/Urho3D/${SUB_DIR}/lib
                     ThirdParty/bass
                     ThirdParty/opus/generated/Release)
else()
    link_directories(../generated/${SUB_DIR}/ThirdParty/bin
                     ../../Urho3D/generated/${SUB_DIR}/lib
                     ThirdParty/opus/generated
                     ../../Urho3D/generated/${SUB_DIR}/Source/ThirdParty/Bullet)
    add_definitions(-g -Og)
endif()


if(WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -MP -Wall /std:c++17")
else()
    add_definitions(-m64 -msse -msse2 -std=c++17 -pthread -ffast-math -fno-strict-aliasing -fmax-errors=1 -Wall)
endif()

include(TankistCommon.cmake)

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

if(WIN32)
   add_subdirectory_with_folder("Tankist/local" local/Battler)
   add_subdirectory_with_folder("Tankist/local" local/Client)
   add_subdirectory_with_folder("Tankist/local" local/Tankist)
   add_subdirectory_with_folder("Tankist/local" local/Updater)
endif()

add_subdirectory_with_folder("Tankist/remote" remote/DataBase)
add_subdirectory_with_folder("Tankist/remote" remote/Master)

add_subdirectory_with_folder("Tankist/common" common/Battle)
add_subdirectory_with_folder("Tankist/common" common/Configurator)
add_subdirectory_with_folder("Tankist/common" common/Hangar)
add_subdirectory_with_folder("Tankist/common" common/Monitor)
add_subdirectory_with_folder("Tankist/common" common/Uploader)
