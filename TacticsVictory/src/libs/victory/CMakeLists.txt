project (victory)

set(CMAKE_UNITY_BUILD OFF)

include_directories(.
                    ../../common_files/
                    ../../../../Urho3D/Source/ThirdParty/libevent/include/
                    ../../../../Urho3D/Source/ThirdParty/libevent/compat/
                    ../../../../Urho3D/Source/ThirdParty/sockpp/include/
                    ../../../../generated/${_BUILD_TYPE_}/Source/ThirdParty/libevent/include/
                    )

add_definitions(-DURHO3D_STATIC_DEFINE -DEVENT__HAVE_SA_FAMILY_T -DHAVE_CONFIG_H -DTINYTEST_LOCAL -DU3D -DGRAPHICS)

if(MSVC)

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHs")

    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:CONSOLE /FORCE:MULTIPLE")

    add_compile_options(/wd4100)
    add_compile_options(/wd4101)
    add_compile_options(/wd4115)
    add_compile_options(/wd4127)
    add_compile_options(/wd4131)
    add_compile_options(/wd4133)
    add_compile_options(/wd4152)
    add_compile_options(/wd4242)
    add_compile_options(/wd4244)
    add_compile_options(/wd4255)
    add_compile_options(/wd4295)
    add_compile_options(/wd4365)
    add_compile_options(/wd4456)
    add_compile_options(/wd4514)    # 'function' : unreferenced inline function has been removed
    add_compile_options(/wd4625)    # 'derived class' : copy constructor was implicitly defined as deleted because a
                                    # base class copy constructor is inaccessible or deleted
    add_compile_options(/wd4626)    # 'derived class' : assignment operator was implicitly defined as deleted because a
                                    # base class assignment operator is inaccessible or deleted
    add_compile_options(/wd4668)
    add_compile_options(/wd4702)
    add_compile_options(/wd4706)
    add_compile_options(/wd4710)    # 'function' : function not inlined
    add_compile_options(/wd4711)    # function 'function' selected for inline expansion
    add_compile_options(/wd4820)    # bytes' bytes padding added after construct 'member_name'
    add_compile_options(/wd4996)
    add_compile_options(/wd5026)    # 'xxx': move constructor was implicitly defined as deleted
    add_compile_options(/wd5027)    # 'class': move assignment operator was implicitly defined as deleted
    add_compile_options(/wd5045)    # Compiler will insert Spectre mitigation for memory load if /Qspectre switch
                                    # specified
    add_compile_options(/wd5220)    # 'xxx:yyy': a non-static data member with a volatile qualified type no longer
                                    # implies that compiler generated copy/move constructors and copy/move assignment
                                    # operators are not trivial
    add_compile_options(/wd5246)

else()

endif()

file(GLOB SRC                                  *.h *.cpp
                                               ../../common_files/defines_.h)
file(GLOB CORE                                 Core/*.*)
file(GLOB FILESYSTEM                           FileSystem/*.*)
file(GLOB INPUT                                Input/*.*)
file(GLOB NETWORK                              Network/Other/*.*)
file(GLOB UTILS                                Utils/*.*)

if(MSVC)
file(GLOB LIBEVENT           ../../../../Urho3D/Source/ThirdParty/libevent/evutil.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_sock.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_pair.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_ratelim.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_filter.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/event.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/log.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evutil_time.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evutil_rand.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/buffer.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evmap.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_async.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evthread.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/signal.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/strlcpy.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/epoll.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/wepoll.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/win32select.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/buffer_iocp.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/event_iocp.c
                             )
else()
file(GLOB LIBEVENT           ../../../../Urho3D/Source/ThirdParty/libevent/event.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/select.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/signal.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/log.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evthread.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evmap.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evutil.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evutil_time.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/evutil_rand.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_pair.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_sock.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_filter.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/bufferevent_ratelim.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/buffer.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/strlcpy.c
                             ../../../../Urho3D/Source/ThirdParty/libevent/poll.c
                             )
endif()

file(GLOB SOCKPP_SOURCES     ../../../../Urho3D/Source/ThirdParty/sockpp/src/*.cpp)
file(GLOB SOCKPP_INCLUDE     ../../../../Urho3D/Source/ThirdParty/sockpp/include/sockpp/*.h)

source_group(src                         FILES ${SRC})
source_group(Core                        FILES ${CORE})
source_group(FileSystem                  FILES ${FILESYSTEM})
source_group(Input                       FILES ${INPUT})
source_group(Network                     FILES ${NETWORK})
source_group(Utils                       FILES ${UTILS})

source_group(ThirdParty\\libevent        FILES ${LIBEVENT})
source_group(ThirdParty\\sockpp\\sources FILES ${SOCKPP_SOURCES})
source_group(ThirdParty\\sockpp\\include FILES ${SOCKPP_INCLUDE})

#set_source_files_properties(${SOCKPP_SOURCES} PROPERTIES HEADER_FILE_ONLY TRUE)

file(GLOB FILES_UNITY ${SRC} ${CORE} ${FILESYSTEM} ${INPUT} ${NETWORK} ${UTILS})

add_library(${PROJECT_NAME} ${FILES_UNITY} ${LIBEVENT} ${SOCKPP_SOURCES} ${SOCKPP_INCLUDE})

add_dependencies(${PROJECT_NAME} Urho3D)

#set_target_properties(${PROJECT_NAME}       PROPERTIES UNITY_BUILD_MODE GROUP)
#set_source_files_properties(${FILES_UNITY}  PROPERTIES UNITY_GROUP "victory")

if(MSVC)
    runtime_library()
    set_working_directory()
    target_link_libraries(${PROJECT_NAME} ws2_32 iphlpapi bcrypt)
else()
    target_link_libraries(${PROJECT_NAME} Urho3D pthread)
endif()

install_files_to_dir()
