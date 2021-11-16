@echo off

cd proc

set isMake=0
set isBuild=0

set isDebug=0
set isRelease=0

if "%1" EQU "" goto PROC_HINT
if %1==make  set isMake=1  & goto LABEL1
if %1==build set isBuild=1 & goto LABEL1
if %1==full  set isMake=1  & set isBuild=1 & goto LABEL1

goto PROC_HINT

:LABEL1

if "%2" EQU "" goto PROC_HINT
if %2==debug   set isDebug=1   & goto LABEL2
if %2==release set isRelease=1 & goto LABEL2
if %2==all     set isDebug=1   & set isRelease=1 & goto LABEL2

:PROC_HINT
echo.
echo Using assembly.bat:
echo                     assembly [make^|build^|full] [debug^|release^|all]
echo.
goto EXIT

:LABEL2
if %isMake% equ 1 goto PROC_MAKE

:PROC_BUILD
if %isDebug% equ 1 call build.bat debug
if %isRelease% equ 1 call build.bat release
goto EXIT

:PROC_MAKE
if %isDebug% equ 1 call make.bat debug
if %isRelease% equ 1 call make.bat release
if %isBuild% equ 1 goto PROC_BUILD

:EXIT
cd ..
