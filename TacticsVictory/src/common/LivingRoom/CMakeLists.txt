project (TVLivingRoom)

set(CMAKE_UNITY_BUILD ON)

include_directories(.
                    ../../common_files
                    ../../libs/victory
                    ${_ROOT_DIR_}/Urho3D/Source/ThirdParty/libevent/include/
                    ${_ROOT_DIR_}/generated/${_BUILD_TYPE_}/Source/ThirdParty/libevent/include/
                    ${_ROOT_DIR_}/Urho3D/Source/ThirdParty/sockpp/include/)

add_definitions(-DURHO3D_STATIC_DEFINE)

if(MSVC)

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHs")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:CONSOLE")

    add_compile_options(/wd4514)    # 'function' : unreferenced inline function has been removed
    add_compile_options(/wd4625)    # 'derived class' : copy constructor was implicitly defined as deleted because a
                                    # base class copy constructor is inaccessible or deleted
    add_compile_options(/wd4626)    # 'derived class' : assignment operator was implicitly defined as deleted because a
                                    # base class assignment operator is inaccessible or deleted
    add_compile_options(/wd4710)    # 'function' : function not inlined
    add_compile_options(/wd4711)    # function 'function' selected for inline expansion
    add_compile_options(/wd4820)    # 'bytes' bytes padding added after construct 'member_name'
    add_compile_options(/wd5026)    # 'type': move constructor was implicitly defined as deleted
    add_compile_options(/wd5027)    # 'type': move assignment operator was implicitly defined as deleted
    add_compile_options(/wd5045)    # Compiler will insert Spectre mitigation for memory load if /Qspectre switch
                                    # specified
    add_compile_options(/wd26812)   # Prefer 'enum class' over 'enum'

else()

endif()

file(GLOB SRC                 ../../common_files/*.h
                                                 *.h *.cpp)
file(GLOB FILESYSTEM          ../../common_files/FileSystem/ConfigurationFile_.*
                              ../../common_files/FileSystem/FileSystem_.*)
file(GLOB NETWORK             ../../libs/victory/Network/Other/ConnectorTCP_v.h
                              ../../common_files/Network/Other/NetworkTypes_.*
                              ../../libs/victory/Network/Other/ServerUDP_v.h
                                                 Network/*.*)
file(GLOB UTILS               ../../common_files/Utils/GlobalFunctions_.*
                              ../../libs/victory/Utils/Log_.h
                              ../../common_files/Utils/StringUtils_.*
                              ../../common_files/Utils/UtilsOS_.*)

source_group(src                  FILES ${SRC})
source_group(FileSystem           FILES ${FILESYSTEM})
source_group(Network              FILES ${NETWORK})
source_group(Utils                FILES ${UTILS})

file(GLOB FILES_UNITY ${SRC} ${FILESYSTEM} ${NETWORK} ${UTILS})

add_executable( ${PROJECT_NAME} ${FILES_UNITY})

set_target_properties(${PROJECT_NAME}       PROPERTIES UNITY_BUILD_MODE GROUP)
set_source_files_properties(${FILES_UNITY}  PROPERTIES UNITY_GROUP "livingroom")

set_target_properties(${PROJECT_NAME} PROPERTIES VS_DEBUGGER_COMMAND_ARGUMENTS "127.0.0.1")

runtime_library()

link_urho3d()

if(MSVC)
    set_working_directory()
    target_link_libraries(${PROJECT_NAME} ws2_32 iphlpapi bcrypt)
else()
    target_link_libraries(${PROJECT_NAME} pthread)
endif()

target_link_libraries(${PROJECT_NAME} victory)

copy_exe()
