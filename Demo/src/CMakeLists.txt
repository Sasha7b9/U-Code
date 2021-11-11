project (Demo)

set(CMAKE_UNITY_BUILD ON)

set(CMAKE_CXX_STANDARD 17)

if(CMAKE_BUILD_TYPE STREQUAL Debug)
    set(_BUILD_TYPE_ debug)
endif()

if(CMAKE_BUILD_TYPE STREQUAL Release)
    set(_BUILD_TYPE_ release)
endif()

include_directories(../../Demo/generated/U-Urho/${_BUILD_TYPE_}/include
                    ../../Demo/generated/U-Urho/${_BUILD_TYPE_}/include/Urho3D/ThirdParty)
link_directories(../../generated/Urho3D/${_BUILD_TYPE_}/lib)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /Wall")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:WINDOWS  /STACK:100000000")

file(GLOB SRC    *.cpp *.h *.inl)

source_group(src FILES ${SRC})

file(GLOB FILES_UNITY ${SRC} )

add_executable(${PROJECT_NAME} ${FILES_UNITY})

# Указывакем, что Demo должна компилироваться после Urho3D. Для ускорения сборки иногда можно закомментировать эту строчку
add_dependencies(${PROJECT_NAME} Urho3D)

if(${CMAKE_BUILD_TYPE} STREQUAL Release)
    target_link_libraries(${PROJECT_NAME} Urho3D)
else()
    target_link_libraries(${PROJECT_NAME} Urho3D_d)
endif()
