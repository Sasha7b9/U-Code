#
# Copyright (c) 2008-2021 the Urho3D project.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

# Check existence of various header files and their functions required by some of the third-party libraries and Urho3D library
# Set the CMake variables in this scope but only add the compiler defines in the respective library's scope

message("------------------------------------------------------------------------------------------------------- Source")

set(CMAKE_UNITY_BUILD ON)

include (CheckIncludeFile)
foreach (HEADER stdint.h inttypes.h malloc.h)
    string (TOUPPER HAVE_${HEADER} HAVE_HEADER)
    string (REPLACE . _ HAVE_HEADER ${HAVE_HEADER})
    check_include_file (${HEADER} ${HAVE_HEADER})
endforeach ()
include (CheckFunctionExists)
foreach (FUNCT __sincosf malloc_usable_size)
    string (TOUPPER HAVE_${FUNCT} HAVE_FUNCT)
    check_function_exists (${FUNCT} ${HAVE_FUNCT})
endforeach ()
include (CheckLibraryExists)
check_library_exists (m sincosf "" HAVE_SINCOSF)
if (MINGW)
    include (CheckStructHasMember)
    check_struct_has_member (RTL_OSVERSIONINFOW dwOSVersionInfoSize minwindef.h\;winnt.h HAVE_RTL_OSVERSIONINFOW)
endif ()

get_filename_component(_ROOT_DIR_ ${CMAKE_BINARY_DIR}\\..\\..\\.. ABSOLUTE)
file(TO_NATIVE_PATH ${_ROOT_DIR_} _ROOT_DIR_)

if (MSVC)
#    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Wall")
#    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /Wall")
    add_compile_options(/wd4710)
    add_compile_options(/wd4711)
elseif(UNIX)
    add_definitions(-fmax-errors=1 -Werror)
endif()

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

# Setup RPATH settings
if (URHO3D_LIB_TYPE STREQUAL SHARED AND NOT WIN32 AND NOT ANDROID AND NOT IOS AND NOT TVOS AND NOT WEB)
    # Add RPATH entries when building
    set (CMAKE_SKIP_BUILD_RPATH FALSE)
    # And set the RPATH entries so that the executable works both in the build tree and install destination
    set (CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
    if (APPLE)
        set (CMAKE_MACOSX_RPATH TRUE)
        set (ORIGIN @loader_path)
    else ()
        set (ORIGIN $ORIGIN)
    endif ()
    # Library location relative to the executable in the build tree
    set (CMAKE_INSTALL_RPATH ${ORIGIN}/../lib)
    # Library location relative to the executable in the tool directory in the build tree
    list (APPEND CMAKE_INSTALL_RPATH ${ORIGIN}/../../lib)                               # The tools are installed one directory further down from normal executable
    # Library location relative to the executable in the install destination
    list (APPEND CMAKE_INSTALL_RPATH ${ORIGIN}/../lib${LIB_SUFFIX}/${PATH_SUFFIX})      # The library location is based on SDK install destination
    # Library location relative to the executable in the tool directory in the install destination
    list (APPEND CMAKE_INSTALL_RPATH ${ORIGIN}/../../lib${LIB_SUFFIX}/${PATH_SUFFIX})
    # The last entry to the install destination of the library, if the destination location is not in the system default search path, e.g. /usr/local/lib
    list (FIND CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES ${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX} isSystemDir)
    if (isSystemDir STREQUAL -1)
        list (APPEND CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_PREFIX}/${DEST_LIBRARY_DIR})
    endif ()
endif ()

# Add targets
add_subdirectory_with_folder("ThirdParty" ThirdParty/STB)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} STB)

add_subdirectory_with_folder("ThirdParty" ThirdParty/ETCPACK)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} ETCPACK)

add_subdirectory_with_folder("ThirdParty" ThirdParty/FreeType)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} FreeType)

add_subdirectory_with_folder("ThirdParty" ThirdParty/LZ4)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} LZ4)

add_subdirectory_with_folder("ThirdParty" ThirdParty/PugiXml)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} PugiXml)

add_subdirectory_with_folder("ThirdParty" ThirdParty/rapidjson)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} rapidjson)

add_subdirectory_with_folder("ThirdParty" ThirdParty/SDL)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} SDL)

add_subdirectory_with_folder("ThirdParty" ThirdParty/StanHull)
# \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} StanHull)

if (URHO3D_ANGELSCRIPT)
    add_subdirectory_with_folder("ThirdParty" ThirdParty/AngelScript)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} AngelScript)

    if (WEB OR (ARM AND URHO3D_64BIT) OR URHO3D_FORCE_AS_MAX_PORTABILITY)
        add_subdirectory (ThirdParty/boost)
    endif ()
endif ()

if (URHO3D_LUA)
    add_subdirectory (ThirdParty/Lua${JIT})
    add_subdirectory (ThirdParty/toluapp/src/lib)
endif ()

if (URHO3D_NETWORK)
    add_subdirectory_with_folder ("ThirdParty" ThirdParty/Civetweb)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} Civetweb)
    
    add_subdirectory_with_folder ("ThirdParty" ThirdParty/SLikeNet)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} SLikeNet)
endif ()

if (URHO3D_DATABASE_ODBC)
    add_subdirectory (ThirdParty/nanodbc)
endif ()
if (URHO3D_DATABASE_SQLITE)
    add_subdirectory_with_folder("ThirdParty" ThirdParty/SQLite)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} sqlite)
endif ()

if (URHO3D_IK)
    add_subdirectory (ThirdParty/ik)
endif ()

if (URHO3D_NAVIGATION)
    add_subdirectory_with_folder("ThirdParty" ThirdParty/Detour)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} Detour)

    add_subdirectory_with_folder("ThirdParty" ThirdParty/DetourCrowd)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} DetourCrowd)
    
    add_subdirectory_with_folder("ThirdParty" ThirdParty/DetourTileCache)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} DetourTileCache)
    
    add_subdirectory_with_folder("ThirdParty" ThirdParty/Recast)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} Recast)
endif ()

if (URHO3D_URHO2D)
    add_subdirectory_with_folder ("ThirdParty" ThirdParty/Box2D)
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} Box2D)

    if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/ThirdParty/spine)
        add_subdirectory (ThirdParty/spine)
        # Add definition for Spine
        add_definitions (-DURHO3D_SPINE)
    endif ()
endif ()

if (URHO3D_WEBP)
    add_subdirectory (ThirdParty/WebP)
endif ()

if (URHO3D_PHYSICS)
    add_subdirectory_with_folder("ThirdParty" ThirdParty/Bullet)
    
    # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
    set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} Bullet)
endif ()

if (URHO3D_TRACY_PROFILING)
    add_subdirectory (ThirdParty/Tracy)
endif ()

if (NOT ANDROID AND NOT ARM AND NOT WEB)
    if (URHO3D_OPENGL)
        add_subdirectory_with_folder ("ThirdParty" ThirdParty/GLEW)
        # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
        set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} GLEW)
    elseif (NOT URHO3D_D3D11)
        add_subdirectory (ThirdParty/MojoShader)
    endif ()
    if (NOT CMAKE_SYSTEM_NAME STREQUAL Linux)
        add_subdirectory_with_folder ("ThirdParty" ThirdParty/LibCpuId)
        # \todo Временаня затычка, чтобы держать библиотеки в отедльном каталоге.
        set (STATIC_LIBRARY_TARGETS ${STATIC_LIBRARY_TARGETS} LibCpuId)
    endif ()
endif ()

add_subdirectory (Urho3D)

if (URHO3D_CLANG_TOOLS)
    add_subdirectory (Clang-Tools)
endif ()

# In order to get clean module segregation, always exclude player/samples from AAR
if (NOT ANDROID)
    add_subdirectory (Tools)
    add_subdirectory (Samples)
endif ()

if (URHO3D_EXTRAS)
    add_subdirectory (Extras)
endif ()

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
define_property(
    TARGET
    PROPERTY FOLDER
    INHERITED
    BRIEF_DOCS "Set the folder name."
    FULL_DOCS "Use to organize targets in an IDE."
)

function(add_superdirectory_with_folder _folder_name _folder _binary_folder)
    add_subdirectory(${_folder} ${_binary_folder})
    set_property(DIRECTORY "${_folder}" PROPERTY FOLDER "${_folder_name}")
endfunction()

add_superdirectory_with_folder("Projects" ../../Projects/Demo/src Projects_Demo_src)

add_subdirectory(../../Tankist/src/       Tankist_src)
add_subdirectory(../../TacticsVictory/src TacticsVictory_src)

add_subdirectory_with_folder("ThirdParty/libevent" ThirdParty/libevent)
add_subdirectory_with_folder("ThirdParty/sockpp"   ThirdParty/sockpp)
