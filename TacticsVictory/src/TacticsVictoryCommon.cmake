macro(set_working_directory)

    if(MSVC)
        set_target_properties(
            ${PROJECT_NAME} PROPERTIES
            VS_DEBUGGER_WORKING_DIRECTORY ${OUT_DIR})
    endif()

endmacro()


macro(copy_exe)

#    if(MSVC)
#        add_custom_command(
#            TARGET ${PROJECT_NAME} POST_BUILD
#            COMMAND copy "$(OutputPath)${PROJECT_NAME}.exe" ${OUT_DIR} /Y
#        )
#    else()
#    endif()

#    if(MSVC)
#        add_custom_command(
#            TARGET ${PROJECT_NAME} POST_BUILD
#            COMMAND copy "$(OutputPath)${PROJECT_NAME}.exe" ${OUT_DIR} /Y
#        )
#    else()
#        add_custom_command(
#            TARGET ${PROJECT_NAME} POST_BUILD
#            COMMAND cp "$(OutputPath)${PROJECT_NAME}" ${OUT_DIR}
#        )
#    endif()

endmacro()


macro(install_files_to_dir)
#    if(MSVC)
#        install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION "${CMAKE_BINARY_DIR}/../out/${_BUILD_TYPE_}")
#    else()
#        set(INSTALL_RPATH ".")
#        install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION "${CMAKE_BINARY_DIR}/../../../out/${_BUILD_TYPE_}")
#        set(INSTALL_RPATH ".")
#    endif()
endmacro()
