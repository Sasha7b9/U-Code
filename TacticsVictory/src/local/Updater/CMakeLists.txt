project (TVUpdater)

include_directories(.
                    ../../common_files
                    ../../libs/victory
                    ${_ROOT_DIR_}/Urho3D/Source/ThirdParty/libevent/include/
                    ${_ROOT_DIR_}/generated/${_BUILD_TYPE_}/Source/ThirdParty/libevent/include/
                    ${_ROOT_DIR_}/Urho3D/Source/ThirdParty/sockpp/include/
                    )

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

file(GLOB SRC                          *.h *.cpp)
#file(GLOB FILESYSTEM ../../common_files/FileSystem/FileSystem_.*)
#file(GLOB NETWORK    ../../libs/victory/Network/Other/ConnectorTCP_v.*)

source_group(src        FILES ${SRC})
#source_group(FileSystem FILES ${FILESYSTEM})
#source_group(Network    FILES ${NETWORK})

#file(GLOB FILES_UNITY ${SRC} ${FILESYSTEM} ${NETWORK})
file(GLOB FILES_UNITY ${SRC})

add_executable( ${PROJECT_NAME} ${FILES_UNITY})

set_target_properties(${PROJECT_NAME}       PROPERTIES UNITY_BUILD_MODE GROUP)
set_source_files_properties(${FILES_UNITY}  PROPERTIES UNITY_GROUP "updater")

runtime_library()

copy_exe()

target_link_libraries(${PROJECT_NAME} ws2_32)
