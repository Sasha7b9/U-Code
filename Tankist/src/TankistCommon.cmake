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
