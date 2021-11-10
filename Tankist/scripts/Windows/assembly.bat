@echo off

if "%1" equ "" goto HINT
if "%2" equ "" goto HINT
if "%3" neq "" goto HINT

set isMake=0
set isBuild=0
set isDebug=0
set isRelease=0

:START
if %1==make  set isMake=1  & goto LABEL1
if %1==build set isBuild=1 & goto LABEL1
if %1==full  set isMake=1 & set isBuild=1 & goto LABEL1

goto HINT

:LABEL1
if %2==debug   set isDebug=1 & goto LABEL2
if %2==release set isRelease=1 & goto LABEL2
if %2==all     set isDebug=1 & set isRelease=1 & goto LABEL2

goto HINT

:LABEL2
if %isMake% equ 0 goto BUILD

:MAKE
if %isDebug%   equ 1 call make.bat debug
if %isRelease% equ 1 call make.bat release

:BUILD
if %isBuild%   equ 0 goto EXIT
if %isDebug%   equ 1 call build.bat debug
if %isRelease% equ 1 call build.bat release
goto EXIT

:HINT
echo.
echo Using assembly.bat:
echo                    assembly.bat [make^|build^|full] [debug^|release^|all]
echo.
goto EXIT

:EXIT
