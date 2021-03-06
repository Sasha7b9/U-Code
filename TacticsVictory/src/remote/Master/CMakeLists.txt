project (TVMaster)

include_directories(.
                    ../../common_files
                    ../../libs/victory
                    ${_ROOT_DIR_}/Urho3D/Source/ThirdParty/libevent/include/
                    ${_ROOT_DIR_}/generated/${_BUILD_TYPE_}/Source/ThirdParty/libevent/include/
                    ${_ROOT_DIR_}/Urho3D/Source/ThirdParty/sockpp/include/
                    )

add_definitions(-DURHO3D_STATIC_DEFINE -DEVENT__HAVE_SA_FAMILY_T -DHAVE_CONFIG_H -DTINYTEST_LOCAL)

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
    add_compile_options(/wd4820)    # bytes' bytes padding added after construct 'member_name'
    add_compile_options(/wd5026)    # 'xxx': move constructor was implicitly defined as deleted
    add_compile_options(/wd5027)    # 'class': move assignment operator was implicitly defined as deleted
    add_compile_options(/wd5045)    # Compiler will insert Spectre mitigation for memory load if /Qspectre switch
                                    # specified
    add_compile_options(/wd5220)    # 'xxx:yyy': a non-static data member with a volatile qualified type no longer
                                    # implies that compiler generated copy/move constructors and copy/move assignment
                                    # operators are not trivial

else()

endif()

file(GLOB SRC                 ../../common_files/defines_.h
                                                *.cpp
                                                *.h)
file(GLOB FILE_SYSTEM         ../../common_files/FileSystem/ConfigurationFile_.*
                              ../../common_files/FileSystem/FileSystem_.*)
file(GLOB NETWORK             ../../common_files/Network/Other/NetworkTypes_.*
                              ../../libs/victory/Network/Other/ServerTCP_v.h
                                                 Network/*.*)
file(GLOB UTILS               ../../common_files/Utils/GlobalFunctions_.*
                              ../../libs/victory/Utils/Log_.h
                              ../../libs/victory/Utils/StringUtils_.h
                              ../../libs/victory/Utils/UtilsOS_.h)

source_group(src                  FILES ${SRC})
source_group(FileSystem           FILES ${FILE_SYSTEM})
source_group(Network              FILES ${NETWORK})
source_group(Utils                FILES ${UTILS})

add_executable(${PROJECT_NAME} ${SRC} ${FILE_SYSTEM} ${NETWORK} ${UTILS})

set_target_properties(${PROJECT_NAME}                                 PROPERTIES UNITY_BUILD_MODE GROUP)
set_source_files_properties(${SRC} ${FILE_SYSTEM} ${NETWORK} ${UTILS} PROPERTIES UNITY_GROUP "master")

if(MSVC)
    runtime_library()
    set_working_directory()
endif()

link_urho3d()

target_link_libraries(${PROJECT_NAME} victory)

copy_exe()

install_files_to_dir()

