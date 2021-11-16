cd ..

mklink /j "TacticsVictory/out/debug/Autoload"   "generated/Urho3d/debug/bin/Autoload"
mklink /j "TacticsVictory/out/debug/CoreData"   "generated/Urho3d/debug/bin/CoreData"
mklink /j "TacticsVictory/out/debug/Data"       "generated/Urho3d/debug/bin/Data"

mkdir TacticsVictory/out/release

mklink /j "TacticsVictory/out/release/Autoload"     "TacticsVictory/out/debug/Autoload"
mklink /j "TacticsVictory/out/release/CoreData"     "TacticsVictory/out/debug/CoreData"
mklink /j "TacticsVictory/out/release/Data"         "TacticsVictory/out/debug/Data"
mklink /j "TacticsVictory/out/release/TVData"       "TacticsVictory/out/debug/TVData"
mklink /j "TacticsVictory/out/release/conf"         "TacticsVictory/out/debug/conf"
mklink /j "TacticsVictory/out/release/log"          "TacticsVictory/out/debug/log"

mklink /h "TacticsVictory/out/release/Run.bat"      "TacticsVictory/out/debug/Run.bat"
mklink /h "TacticsVictory/out/release/starter.bat"  "TacticsVictory/out/debug/starter.bat"

cd scripts
