project (TTMonitor)

if(MSVC)
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:CONSOLE")
endif()


file(GLOB SRC   *.cpp *.h)

source_group(src        FILES ${SRC})

add_executable(${PROJECT_NAME} ${SRC})

runtime_library()

link_third_party()

if(MSVC)
    set_working_directory()
endif()

install_files_to_dir()
