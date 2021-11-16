@echo off

set _START_DIR_=%CD%

set PATH=%PATH%;C:\Program Files (x86)\farmanager

cd ..

set _ROOT_DIR_=%CD%

cd %_START_DIR_%

@echo on

%comspec% /k "c:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat"
