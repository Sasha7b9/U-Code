project (TVDataBase)

include_directories(.
                    ../../common_files
                    ../../libs/victory
                    ../../../../Urho3D/Source/ThirdParty/SQLite/src/
                    ../../../../Urho3D/Source/ThirdParty
                    )

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

else()

#    add_compile_options(-Wclobbered)
#    add_compile_options(-Wempty-body)
#    add_compile_options(-Wignored-qualifiers)
#    add_compile_options(-Wmissing-field-initializers)
#    add_compile_options(-Wsign-compare)
#    add_compile_options(-Wtype-limits)
#    add_compile_options(-Wuninitialized)
#    add_compile_options(-Wunused-parameter)

endif()

file(GLOB SRC                 ../../common_files/*.h
                                                 *.h *.cpp)
file(GLOB FILESYSTEM          ../../common_files/FileSystem/ConfigurationFile_.*
                              ../../common_files/FileSystem/FileSystem_.*)
file(GLOB UTILS               ../../common_files/Utils/GlobalFunctions_.*
                              ../../libs/victory/Utils/Log_v.h
                              ../../libs/victory/Utils/StringUtils_v.h
                              ../../libs/victory/Utils/UtilsOS_v.h)

source_group(src                FILES ${SRC})
source_group(FileSystem         FILES ${FILESYSTEM})
source_group(Utils              FILES ${UTILS})

set_source_files_properties(${SOCKPP_SOURCES} PROPERTIES HEADER_FILE_ONLY TRUE)

file(GLOB FILES_UNITY ${SRC} ${FILESYSTEM} ${UTILS})

if(MSVC)
    link_directories(../../../generated/${_BUILD_TYPE_}/ThirdParty/sqlite/${CMAKE_BUILD_TYPE})
else()
    link_directories(../../../generated/${_BUILD_TYPE_}/ThirdParty/sqlite)
endif()

add_executable( ${PROJECT_NAME} ${FILES_UNITY})

set_target_properties(${PROJECT_NAME}       PROPERTIES UNITY_BUILD_MODE GROUP)
set_source_files_properties(${FILES_UNITY}  PROPERTIES UNITY_GROUP "database")

if(MSVC)
    runtime_library()
    set_working_directory()
    target_link_libraries(${PROJECT_NAME} ws2_32 sqlite)
else()
    target_link_libraries(${PROJECT_NAME} sqlite dl pthread)
endif()

link_urho3d()

target_link_libraries(${PROJECT_NAME} victory)

copy_exe()
