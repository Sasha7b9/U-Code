@echo off

if "%1"=="" goto EXIT
if %1==release start devenv.exe ../generated/%1/Urho3D.sln /projectconfig Release
if %1==debug start devenv.exe ../generated/%1/Urho3D.sln

:EXIT
