cd %_ROOT_DIR_%


rem             *** TacticsVictory ***
mkdir "TacticsVictory/out/debug/log/"
mkdir "TacticsVictory/out/release/"
mkdir "TacticsVictory/out/release/log/"

mklink /j "TacticsVictory/out/debug/Autoload/"   "Urho3D/bin/Autoload/"
mklink /j "TacticsVictory/out/debug/CoreData/"   "Urho3D/bin/CoreData/"
mklink /j "TacticsVictory/out/debug/Data/"       "Urho3D/bin/Data/"

mklink /j "TacticsVictory/out/release/Autoload/" "Urho3D/bin/Autoload/"
mklink /j "TacticsVictory/out/release/CoreData/" "Urho3D/bin/CoreData/"
mklink /j "TacticsVictory/out/release/Data/"     "Urho3D/bin/Data/"

mklink /j "TacticsVictory/out/release/TVData/"   "TacticsVictory/out/debug/TVData/"
mklink /j "TacticsVictory/out/release/conf/"     "TacticsVictory/out/debug/conf/"


rem             *** Tankist ***
mkdir "Tankist/out/debug/log/"
mkdir "Tankist/out/release/"
mkdir "Tankist/out/release/log/"

mklink /j "Tankist/out/debug/Autoload/"      "Urho3D/bin/Autoload/"
mklink /j "Tankist/out/debug/CoreData/"      "Urho3D/bin/CoreData/"
mklink /j "Tankist/out/debug/Data/"          "Urho3D/bin/Data/"

mklink /j "Tankist/out/release/Autoload/"    "Urho3D/bin/Autoload/"
mklink /j "Tankist/out/release/CoreData/"    "Urho3D/bin/CoreData/"
mklink /j "Tankist/out/release/Data/"        "Urho3D/bin/Data/"

mklink /j "Tankist/out/release/TankistData/" "Tankist/out/debug/TankistData/"
mklink /j "Tankist/out/release/conf/"        "Tankist/out/debug/Tankist/conf/"
