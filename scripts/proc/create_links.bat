cd %_ROOT_DIR_%

rem             *** Pi-Code ***
mkdir "Pi-Code/out/release"
mkdir "Pi-Code/out/debug/Plugins"
mkdir "Pi-Code/out/debug/Plugins/Tools/Editor"
mkdir "Pi-Code/out/debug/Plugins/Tools/Fonts"
mkdir "Pi-Code/out/release/Plugins"
mkdir "Pi-Code/out/release/Plugins/Tools/Editor"
mkdir "Pi-Code/out/release/Plugins/Tools/Fonts"

mklink /j "Pi-Code/out/release/Data"       "Pi-Code/out/debug/Data"
mklink /j "Pi-Code/out/release/Import"     "Pi-Code/out/debug/Import"


rem             *** TacticsVictory ***
mkdir "TacticsVictory/out/release"
mkdir "TacticsVictory/out/release/Data"

mklink /j "TacticsVictory/out/debug/Data/C4"                "Pi-Code/out/debug/Data/C4"
mklink /j "TacticsVictory/out/debug/Plugins"                "Pi-Code/out/debug/Plugins"
mklink /j "TacticsVictory/out/release/Data/C4"              "Pi-Code/out/debug/Data/C4"
mklink /j "TacticsVictory/out/release/Plugins"              "Pi-Code/out/release/Plugins"
mklink /j "TacticsVictory/out/release/Data/TacticsVictory"  "TacticsVictory/out/debug/Data/TacticsVictory"

rem             *** Tankist ***
mkdir "Tankist/out/release"
mkdir "Tankist/out/release/Data"

mklink /j "Tankist/out/debug/Data/C4"           "Pi-Code/out/debug/Data/C4"
mklink /j "Tankist/out/debug/Plugins"           "Pi-Code/out/debug/Plugins"
mklink /j "Tankist/out/release/Data/C4"         "Tankist/out/debug/Data/C4"
mklink /j "Tankist/out/release/Plugins"         "Tankist/out/debug/Plugins"
mklink /j "Tankist/out/release/Data/Tankist"    "Tankist/out/debug/Data/Tankist"
