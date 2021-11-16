@echo off

if "%~1"=="" goto HINT
if "%~2" NEQ "" goto HINT

@echo .
@echo %TIME%   Making U-Code %1 ...

set _START_DIR_=%CD%

cd %_ROOT_DIR_%

set BUILDING=debug
set CMAKE_BUILD=Debug

if %1==release set BUILDING=release
if %1==release set CMAKE_BUILD=Release

rem Путь к каталогу с U-Code.sln
set CMAKE_PROJECT_DIR="generated/%BUILDING%"

rmdir %CMAKE_PROJECT_DIR% /S /Q

mkdir %CMAKE_PROJECT_DIR%

@echo on

cmake Urho3D -B%CMAKE_PROJECT_DIR% -DCMAKE_GENERATOR_PLATFORM=x64 -DCMAKE_GENERATOR="Visual Studio 16 2019" -DCMAKE_BUILD_TYPE=%CMAKE_BUILD%

@echo off

cd %_START_DIR_%

@echo %TIME%   Complete

goto EXIT

:HINT

echo.
echo Using make.bat:  make [debug^|release]
echo.
    
    
:EXIT