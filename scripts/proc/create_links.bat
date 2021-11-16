cd %_ROOT_DIR_%

rem             *** TacticsVictory ***
mkdir "TacticsVictory/out/debug/log/"
mkdir "TacticsVictory/out/release/"
mkdir "TacticsVictory/out/release/log/"

mklink /j "TacticsVictory/out/debug/Autoload/" "Urho3D/bin/Autoload/"
mklink /j "TacticsVictory/out/debug/CoreData/" "Urho3D/bin/CoreData/"
mklink /j "TacticsVictory/out/debug/Data/"     "Urho3D/bin/Data/"

mklink /j "TacticsVictory/out/release/Autoload/" "Urho3D/bin/Autoload/"
mklink /j "TacticsVictory/out/release/CoreData/" "Urho3D/bin/CoreData/"
mklink /j "TacticsVictory/out/release/Data/"     "Urho3D/bin/Data/"

