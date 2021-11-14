macro(set_working_directory)

    if(MSVC)
        set_target_properties(
            ${PROJECT_NAME} PROPERTIES
            VS_DEBUGGER_WORKING_DIRECTORY ${_OUT_DIR_})
    endif()

endmacro()


macro(copy_exe)

    if(MSVC)
        add_custom_command(
            TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND copy "$(OutputPath)${PROJECT_NAME}.exe" ${_OUT_DIR_} /Y
        )
    else()
        add_custom_command(
            TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND cp "${CMAKE_BINARY_DIR}/bin/${PROJECT_NAME}" ${_OUT_DIR_}
        )
    endif()

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
