project (Demo)

find_package (Urho3D REQUIRED)
include_directories (${URHO3D_INCLUDE_DIRS})

if(CMAKE_BUILD_TYPE STREQUAL Debug)
    set(_BUILD_TYPE_ debug)
endif()

if(CMAKE_BUILD_TYPE STREQUAL Release)
    set(_BUILD_TYPE_ release)
endif()

link_directories("${CMAKE_BINARY_DIR}/lib")

if(MSVC)
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W0")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:WINDOWS  /STACK:100000000")
endif()

file(GLOB SRC    *.cpp *.h *.inl)

source_group(src FILES ${SRC})

file(GLOB FILES_UNITY ${SRC} )

add_executable(${PROJECT_NAME} ${FILES_UNITY})

# ����������, ��� Demo ������ ��������������� ����� Urho3D. ��� ��������� ������ ������ ����� ���������������� ��� �������
add_dependencies(${PROJECT_NAME} Urho3D)

if(MSVC)
    if(CMAKE_BUILD_TYPE STREQUAL Debug)
        target_link_libraries(${PROJECT_NAME} Urho3D_d)
    else()
        target_link_libraries(${PROJECT_NAME} Urho3D)
    endif()
    target_link_libraries(${PROJECT_NAME} user32 gdi32 winmm imm32 ole32 oleaut32 setupapi version uuid opengl32)
else()
     target_link_libraries(${PROJECT_NAME} Urho3D)
endif()
