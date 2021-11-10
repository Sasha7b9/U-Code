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

if (NOT URHO3D_SAMPLES)
    return ()
endif ()

# Set project name
project (Urho3D-Samples)

# Find Urho3D library
find_package (Urho3D REQUIRED)
include_directories (${URHO3D_INCLUDE_DIRS})

if (MSVC)

    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /bigobj /Wall")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /bigobj /Wall")
    
    # W2
    add_compile_options(/wd4244)
    add_compile_options(/wd4305)
    
    # W3
    add_compile_options(/wd4018)
    
    # W4
    add_compile_options(/wd4100)
    add_compile_options(/wd4189)
    add_compile_options(/wd4456)
    
    # Wall
    add_compile_options(/wd4062)
    add_compile_options(/wd4242)
    add_compile_options(/wd4263)
    add_compile_options(/wd4264)
    add_compile_options(/wd4266)
    add_compile_options(/wd4365)
    add_compile_options(/wd4464)
    add_compile_options(/wd4514)
    add_compile_options(/wd4582)
    add_compile_options(/wd4583)
    add_compile_options(/wd4623)
    add_compile_options(/wd4625)
    add_compile_options(/wd4626)
    add_compile_options(/wd4668)
    add_compile_options(/wd4820)
    add_compile_options(/wd5026)
    add_compile_options(/wd5027)
    add_compile_options(/wd5039)
    add_compile_options(/wd5045)
    add_compile_options(/wd5219)
    
    if(CMAKE_BUILD_TYPE STREQUAL Release)
        add_compile_options(/wd4701)
        add_compile_options(/wd4710)
        add_compile_options(/wd4711)
    endif()

endif()

# Include common to all samples
set (COMMON_SAMPLE_H_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Sample.h" "${CMAKE_CURRENT_SOURCE_DIR}/Sample.inl")

# Define dependency libs
set (INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR})

# Macro for adding sample subdirectory
macro (add_sample_subdirectory SOURCE_DIR)
    add_subdirectory (${SOURCE_DIR} ${ARGN})
endmacro ()

# Add samples
file (GLOB_RECURSE DIRS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} CMakeLists.txt)
list (SORT DIRS)

add_subdirectory(Project_HelloWorld)
