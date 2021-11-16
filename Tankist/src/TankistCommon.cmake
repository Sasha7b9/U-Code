macro(link_urho3d)
    if(MSVC)
        if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
            target_link_libraries(${PROJECT_NAME} ../../../../generated/debug/lib/Urho3D_d) 
        else()
            target_link_libraries(${PROJECT_NAME} Urho3D)
        endif()
    else()
        target_link_libraries(${PROJECT_NAME} Urho3D)
    endif()
endmacro()

macro(install_files_to_dir)
    if(${CMAKE_BUILD_TYPE} STREQUAL Debug)
        if(MSVC)
            install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION "${CMAKE_BINARY_DIR}/../out/debug")
        else()
            install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION "${CMAKE_BINARY_DIR}/../../../out/debug")
        endif()
    else()
        if(MSVC)
            install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION "${CMAKE_BINARY_DIR}/../out/release")
        else()
            install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION "${CMAKE_BINARY_DIR}/../../../out/release")
        endif()
    endif()
endmacro()


macro(copy_dll)
    if(MSVC)
        add_custom_command(
            TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND copy "$(OutputPath)${PROJECT_NAME}.dll" ${OUT_DIR} /Y
        )
    endif()
endmacro()


macro(copy_exe)
    if(MSVC)
        add_custom_command(
            TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND copy "$(OutputPath)${PROJECT_NAME}.exe" ${OUT_DIR} /Y
        )
    endif()
endmacro()


macro(link_third_party)
    if(USE_SOCKPP)
        target_link_libraries(${PROJECT_NAME} sockpp-static)
        if(MSVC)
            target_link_libraries(${PROJECT_NAME} ws2_32)
        endif()
    endif()
    
    
    if(USE_CPPFS)
    
        if(${CMAKE_BUILD_TYPE} STREQUAL Release)
            target_link_libraries(${PROJECT_NAME} cppfs)
        elseif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
            target_link_libraries(${PROJECT_NAME} cppfsd)
        endif()
        
    endif()
    
    
    if(UNIX)
    
        target_link_libraries(${PROJECT_NAME} pthread)
        set_target_properties(${PROJECT_NAME} PROPERTIES
            LINKER_LANGUAGE CXX
        )
    
    endif()
endmacro()


macro(runtime_library)
    if(MSVC)
        if(${CMAKE_BUILD_TYPE} STREQUAL Release)        # Для релизной версии
            set_property(TARGET ${PROJECT_NAME} PROPERTY
                MSVC_RUNTIME_LIBRARY "MultiThreaded")   # Устанавливаем статическую линковку рантайм-библиотек
        elseif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
            set_property(TARGET ${PROJECT_NAME} PROPERTY
                MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
        endif()
    endif()
endmacro()


macro(set_working_directory)
    if(MSVC)
        set_target_properties(
            ${PROJECT_NAME} PROPERTIES
            VS_DEBUGGER_WORKING_DIRECTORY ${OUT_DIR})
    endif()
endmacro()