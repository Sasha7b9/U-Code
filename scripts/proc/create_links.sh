#!/usr/bin/env bash


# Functions <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

function MakeDir {
    mkdir -p $1
}


function LinkDir {
    if [ ! -e $1 ]
    then
        echo "Not exist directory " $1 ". Create it"
        ln -rs $2 $1
    else
        echo "Directory " $1 " already exist"
    fi
}


function CopyFiles {
    cp -rfu $1 $2
}


# Start here <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

dir=$PWD

cd ../..

#             *** TacticsVictory ***
MakeDir "TacticsVictory/out/debug/log"
MakeDir "TacticsVictory/out/release"
MakeDir "TacticsVictory/out/release/log"

LinkDir "TacticsVictory/out/debug/Autoload"   "Urho3D/bin/Autoload"
LinkDir "TacticsVictory/out/debug/CoreData"   "Urho3D/bin/CoreData"
LinkDir "TacticsVictory/out/debug/Data"       "Urho3D/bin/Data"

LinkDir "TacticsVictory/out/release/Autoload" "Urho3D/bin/Autoload"
LinkDir "TacticsVictory/out/release/CoreData" "Urho3D/bin/CoreData"
LinkDir "TacticsVictory/out/release/Data"     "Urho3D/bin/Data"

LinkDir "TacticsVictory/out/release/TVData"   "TacticsVictory/out/debug/TVData"
LinkDir "TacticsVictory/out/release/conf"     "TacticsVictory/out/debug/conf"

#             *** Tankist ***
MakeDir "Tankist/out/debug/log"
MakeDir "Tankist/out/release"
MakeDir "Tankist/out/release/log"

LinkDir "Tankist/out/debug/Autoload"      "Urho3D/bin/Autoload"
LinkDir "Tankist/out/debug/CoreData"      "Urho3D/bin/CoreData"
LinkDir "Tankist/out/debug/Data"          "Urho3D/bin/Data"

LinkDir "Tankist/out/release/Autoload"    "Urho3D/bin/Autoload"
LinkDir "Tankist/out/release/CoreData"    "Urho3D/bin/CoreData"
LinkDir "Tankist/out/release/Data"        "Urho3D/bin/Data"

LinkDir "Tankist/out/release/TankistData" "Tankist/out/debug/TankistData"
LinkDir "Tankist/out/release/conf"        "Tankist/out/debug/Tankist/conf"

cd $dir
