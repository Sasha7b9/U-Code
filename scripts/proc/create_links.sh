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

#             *** Pi-Code ***
MakeDir "Pi-Code/out/release"
MakeDir "Pi-Code/out/debug/Plugins"
MakeDir "Pi-Code/out/debug/Plugins/Tools/Editor"
MakeDir "Pi-Code/out/debug/Plugins/Tools/Fonts"
MakeDir "Pi-Code/out/release/Plugins"
MakeDir "Pi-Code/out/release/Plugins/Tools/Editor"
MakeDir "Pi-Code/out/release/Plugins/Tools/Fonts"

LinkDir "Pi-Code/out/release/Data"       "Pi-Code/out/debug/Data"
LinkDir "Pi-Code/out/release/Import"     "Pi-Code/out/debug/Import"


#             *** TacticsVictory ***
MakeDir "TacticsVictory/out/release"
MakeDir "TacticsVictory/out/release/Data"

LinkDir "TacticsVictory/out/debug/Data/C4"                "Pi-Code/out/debug/Data/C4"
LinkDir "TacticsVictory/out/debug/Plugins"                "Pi-Code/out/debug/Plugins"
LinkDir "TacticsVictory/out/release/Data/C4"              "Pi-Code/out/debug/Data/C4"
LinkDir "TacticsVictory/out/release/Plugins"              "Pi-Code/out/release/Plugins"
LinkDir "TacticsVictory/out/release/Data/TacticsVictory"  "TacticsVictory/out/debug/Data/TacticsVictory"

#             *** Tankist ***
MakeDir "Tankist/out/release"
MakeDir "Tankist/out/release/Data"

LinkDir "Tankist/out/debug/Data/C4"           "Pi-Code/out/debug/Data/C4"
LinkDir "Tankist/out/debug/Plugins"           "Pi-Code/out/debug/Plugins"
LinkDir "Tankist/out/release/Data/C4"         "Tankist/out/debug/Data/C4"
LinkDir "Tankist/out/release/Plugins"         "Tankist/out/debug/Plugins"
LinkDir "Tankist/out/release/Data/Tankist"    "Tankist/out/debug/Data/Tankist"

cd $dir
