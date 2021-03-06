project (TVBattler)

include_directories(.
                    ../../common_files
                    ../../libs/victory
                    )

add_definitions(-DURHO3D_LOGGING -DLOG_U3D -DU3D -DGRAPHICS -DUSE_MOUSE)

if(MSVC)
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:WINDOWS  /STACK:100000000")
    
    add_compile_options(/wd4625)    # 'derived class' : copy constructor was implicitly defined as deleted because a
                                    # base class copy constructor is inaccessible or deleted
    add_compile_options(/wd4626)    # 'derived class' : assignment operator was implicitly defined as deleted because a
                                    # base class assignment operator is inaccessible or deleted
    add_compile_options(/wd4514)    # 'function' : unreferenced inline function has been removed
    add_compile_options(/wd4701)
    add_compile_options(/wd4710)    # 'function' : function not inlined
    add_compile_options(/wd4711)    # function 'function' selected for inline expansion
    add_compile_options(/wd4820)    # 'bytes' bytes padding added after construct 'member_name'
    add_compile_options(/wd5026)    # 'type': move constructor was implicitly defined as deleted
    add_compile_options(/wd5027)    # 'type': move assignment operator was implicitly defined as deleted
    add_compile_options(/wd5045)    # Compiler will insert Spectre mitigation for memory load if /Qspectre switch
                                    # specified
    add_compile_options(/wd5219)    # implicit conversion from 'type-1' to 'type-2', possible loss of data
    add_compile_options(/wd26812)   # Prefer 'enum class' over 'enum' (Enum.3)
    add_compile_options(/wd28251)   # Inconsistent annotation for function: this instance has an error
else()
endif()

file(GLOB SRC                                    ../../common_files/*.*
                                                                    *.h *.cpp)
file(GLOB AUDIO                                                     Audio/*.*)
file(GLOB CORE                                   ../../common_files/Core/*.*)
file(GLOB EDITOR                                                    Editor/*.*)
file(GLOB FILESYSTEM                             ../../common_files/FileSystem/ConfigurationFile_.*
                                                 ../../common_files/FileSystem/FileSystem_.*)
file(GLOB GAME                                                      Game/*.*)
file(GLOB GAME_LOGIC                             ../../common_files/Game/Logic/*.*)
file(GLOB GAME_PATH                              ../../common_files/Game/Path/*.*
                                                                    Game/Path/*.*)
file(GLOB GRAPHICS                               ../../common_files/Graphics/*.*)
file(GLOB GRAPHICS_2D                            ../../common_files/Graphics/2D/*.*)
file(GLOB GRAPHICS_3D                                               Graphics/3D/*.*)
file(GLOB GUI                                    ../../common_files/GUI/Cursor_.*
                                                 ../../common_files/GUI/GUI_.*
                                                                    GUI/*.*)
file(GLOB GUI_CONTROLS                           ../../common_files/GUI/Controls/Control_.*
                                                 ../../common_files/GUI/Controls/DropDownListWithTextAndButton_.*
                                                 ../../common_files/GUI/Controls/GovernorFloat_.*
                                                 ../../common_files/GUI/Controls/Hint_.*
                                                 ../../common_files/GUI/Controls/Label_.*
                                                 ../../common_files/GUI/Controls/Tab_.*)
file(GLOB GUI_CONTROLS_BUTTONS                   ../../common_files/GUI/Controls/Buttons/*.*)
file(GLOB GUI_CONTROLS_SLIDERS                   ../../common_files/GUI/Controls/Sliders/*.*)
file(GLOB GUI_GUIEDITOR                                             GUI/GuiEditor/*.*)
file(GLOB GUI_GAME                                                  GUI/GuiGame/*.*)
file(GLOB GUI_LOGIC                              ../../common_files/GUI/Logic/*.*)
file(GLOB GUI_MENU                               ../../common_files/GUI/Menu/Menu_.*
                                                 ../../common_files/GUI/Menu/MenuConfirmExit_.*
                                                 ../../common_files/GUI/Menu/MenuEvents_.*
                                                 ../../common_files/GUI/Menu/MenuPage_.*
                                                                    GUI/Menu/*.*)
file(GLOB GUI_PANELS                                                GUI/Panels/*.*)
file(GLOB GUI_WINDOWS                            ../../common_files/GUI/Windows/Console_.*
                                                 ../../common_files/GUI/Windows/ConsoleParserFunctions_.*
                                                 ../../common_files/GUI/Windows/WindowVariables_.*
                                                 ../../common_files/GUI/Windows/Window_.*)
file(GLOB INPUT                                  ../../libs/victory/Input/Mouse_v.h)
file(GLOB NETWORK                                ../../common_files/Network/Game/*.*
                                                                    Network/*.*)
file(GLOB NETWORK_MESSAGES                       ../../common_files/Network/Game/Messages/*.*
                                                                    Network/Messages/*.*)
file(GLOB SCENE                                  ../../common_files/Scene/*.*
                                                                    Scene/*.*)
file(GLOB SCENE_CAMERAS                          ../../common_files/Scene/Cameras/Camera_.*)
file(GLOB SCENE_OBJECTS                          ../../common_files/Scene/Objects/*.*
                                                                    Scene/Objects/*.*)
file(GLOB SCENE_OBJECTS_AMMO                     ../../common_files/Scene/Objects/Ammo/*.*)
file(GLOB SCENE_OBJECTS_AMMO_ROCKET                                 Scene/Objects/Ammo/Rocket/*.*
                                                 ../../common_files/Scene/Objects/Ammo/Rocket/*.*)
file(GLOB SCENE_OBJECTS_BUILDINGS                ../../common_files/Scene/Objects/Buildings/*.*)
file(GLOB SCENE_OBJECTS_UNITS                    ../../common_files/Scene/Objects/Units/*.*
                                                                    Scene/Objects/Units/*.*)
file(GLOB SCENE_OBJECTS_UNITS_ACCESSORIES        ../../common_files/Scene/Objects/Units/Accessories/*.*)
file(GLOB SCENE_OBJECTS_UNITS_ACCESSORIES_ENGINE ../../common_files/Scene/Objects/Units/Accessories/Engine/*.*)
file(GLOB SCENE_OBJECTS_UNITS_AIR                ../../common_files/Scene/Objects/Units/Air/*.*)
file(GLOB SCENE_OBJECTS_UNITS_AIR_AIRPLANE       ../../common_files/Scene/Objects/Units/Air/AirPlane/*.*
                                                                    Scene/Objects/Units/Air/AirPlane/*.*)
file(GLOB SCENE_OBJECTS_UNITS_GROUND             ../../common_files/Scene/Objects/Units/Ground/*.*)
file(GLOB SCENE_OBJECTS_UNITS_GROUND_TANK        ../../common_files/Scene/Objects/Units/Ground/Tank/*.*
                                                                    Scene/Objects/Units/Ground/Tank/*.*)
file(GLOB SCENE_OBJECTS_WEAPONS                  ../../common_files/Scene/Objects/Weapons/*.*)
file(GLOB SCENE_PRIMITIVES                       ../../common_files/Scene/Primitives/*.*)
file(GLOB SCENE_TERRAIN                          ../../common_files/Scene/Terrain/*.*
                                                    ../common_files/Scene/Terrain/LayerTerrainC_.cpp
                                                                    Scene/Terrain/*.*)
file(GLOB UTILS                                  ../../common_files/Utils/GlobalFunctions_.*
                                                 ../../libs/victory/Utils/Log_.h
                                                 ../../common_files/Utils/LogU3D_.*
                                                 ../../common_files/Utils/StringUtils_.*
                                                 ../../common_files/Utils/UtilsOS_.*
                                                                    Utils/*.*)

source_group(src                                        FILES ${SRC})
source_group(Audio                                      FILES ${AUDIO})
source_group(Core                                       FILES ${CORE})
source_group(Editor                                     FILES ${EDITOR})
source_group(FileSystem                                 FILES ${FILESYSTEM})
source_group(Game                                       FILES ${GAME})
source_group(Game\\Logic                                FILES ${GAME_LOGIC})
source_group(Game\\Path                                 FILES ${GAME_PATH})
source_group(Graphics                                   FILES ${GRAPHICS})
source_group(Graphics\\2D                               FILES ${GRAPHICS_2D})
source_group(Graphics\\3D                               FILES ${GRAPHICS_3D})
source_group(GUI                                        FILES ${GUI})
source_group(GUI\\Controls                              FILES ${GUI_CONTROLS})
source_group(GUI\\Controls\\Buttons                     FILES ${GUI_CONTROLS_BUTTONS})
source_group(GUI\\Controls\\Sliders                     FILES ${GUI_CONTROLS_SLIDERS})
source_group(GUI\\GuiEditor                             FILES ${GUI_GUIEDITOR})
source_group(GUI\\Game                                  FILES ${GUI_GAME})
source_group(GUI\\Logic                                 FILES ${GUI_LOGIC})
source_group(GUI\\Menu                                  FILES ${GUI_MENU})
source_group(GUI\\Panels                                FILES ${GUI_PANELS})
source_group(GUI\\Windows                               FILES ${GUI_WINDOWS})
source_group(Input                                      FILES ${INPUT})
source_group(Network                                    FILES ${NETWORK})
source_group(Network\\Messages                          FILES ${NETWORK_MESSAGES})
source_group(Scene                                      FILES ${SCENE})
source_group(Scene\\Cameras                             FILES ${SCENE_CAMERAS})
source_group(Scene\\Objects                             FILES ${SCENE_OBJECTS})
source_group(Scene\\Objects\\Ammo                       FILES ${SCENE_OBJECTS_AMMO})
source_group(Scene\\Objects\\Ammo\\Rocket               FILES ${SCENE_OBJECTS_AMMO_ROCKET})
source_group(Scene\\Objects\\Buildings                  FILES ${SCENE_OBJECTS_BUILDINGS})
source_group(Scene\\Objects\\Units                      FILES ${SCENE_OBJECTS_UNITS})
source_group(Scene\\Objects\\Units\\Accessories         FILES ${SCENE_OBJECTS_UNITS_ACCESSORIES})
source_group(Scene\\Objects\\Units\\Accessories\\Engine FILES ${SCENE_OBJECTS_UNITS_ACCESSORIES_ENGINE})
source_group(Scene\\Objects\\Units\\Air                 FILES ${SCENE_OBJECTS_UNITS_AIR})
source_group(Scene\\Objects\\Units\\Air\\Ariplane       FILES ${SCENE_OBJECTS_UNITS_AIR_AIRPLANE})
source_group(Scene\\Objects\\Units\\Ground              FILES ${SCENE_OBJECTS_UNITS_GROUND})
source_group(Scene\\Objects\\Units\\Ground\\Tank        FILES ${SCENE_OBJECTS_UNITS_GROUND_TANK})
source_group(Scene\\Objects\\Weapons                    FILES ${SCENE_OBJECTS_WEAPONS})
source_group(Scene\\Primitives                          FILES ${SCENE_PRIMITIVES})
source_group(Scene\\Terrain                             FILES ${SCENE_TERRAIN})
source_group(Utils                                      FILES ${UTILS})


file(GLOB FILES_UNITY ${SRC} ${AUDIO} ${CORE} ${EDITOR} ${FILESYSTEM} ${GAME} ${GAME_LOGIC} ${GAME_PATH}
    ${GRAPHICS} ${GRAPHICS_2D} ${GRAPHICS_3D}
    ${GRAPHICS_OBJECTS} ${GUI} ${GUI_CONTROLS} ${GUI_CONTROLS_BUTTONS} ${GUI_CONTROLS_SLIDERS} ${GUI_GUIEDITOR}
    ${GUI_GAME} ${GUI_LOGIC}
    ${GUI_MENU} ${GUI_PANELS}
    ${GUI_WINDOWS} ${INPUT} ${NETWORK} ${NETWORK_MESSAGES} ${SCENE} ${SCENE_CAMERAS} ${SCENE_OBJECTS}
    ${SCENE_OBJECTS_AMMO} ${SCENE_OBJECTS_AMMO_ROCKET}
    ${SCENE_OBJECTS_BUILDINGS}
    ${SCENE_OBJECTS_UNITS} ${SCENE_OBJECTS_UNITS_ACCESSORIES} ${SCENE_OBJECTS_UNITS_ACCESSORIES_ENGINE}
    ${SCENE_OBJECTS_UNITS_AIR} ${SCENE_OBJECTS_UNITS_AIR_AIRPLANE}
    ${SCENE_OBJECTS_UNITS_GROUND} ${SCENE_OBJECTS_UNITS_GROUND_TANK}
    ${SCENE_OBJECTS_WEAPONS} ${SCENE_PRIMITIVES} ${SCENE_TERRAIN} ${UTILS})

add_executable( ${PROJECT_NAME} ${FILES_UNITY})

set_target_properties(${PROJECT_NAME}       PROPERTIES UNITY_BUILD_MODE GROUP)
set_source_files_properties(${FILES_UNITY}  PROPERTIES UNITY_GROUP "battler")

runtime_library()

link_urho3d()

target_link_libraries(${PROJECT_NAME} victory)

set_working_directory()

install_files_to_dir()

copy_exe()
