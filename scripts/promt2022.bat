@echo off

set _START_DIR_=%CD%

set PATH=%PATH%;C:\Program Files (x86)\farmanager;C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python39_64

cd ..

set _ROOT_DIR_=%CD%

cd %_START_DIR_%

@echo on

%comspec% /k "c:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\VsDevCmd.bat"
