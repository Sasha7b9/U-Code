macro(install_files)
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
    if(WIN32)
        add_custom_command(
            TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND copy "$(OutputPath)${PROJECT_NAME}.dll" ${OUT_DIR} /Y
        )
    endif()
endmacro()


macro(copy_exe)
    if(WIN32)
        add_custom_command(
            TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND copy "$(OutputPath)${PROJECT_NAME}.exe" ${OUT_DIR} /Y
        )
    endif()
endmacro()


macro(link_third_party)
    if(USE_SOCKPP)
    
        target_link_libraries(${PROJECT_NAME} sockpp)
        
        if(WIN32)
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
