echo on
MSBuild.exe ../../generated/%1/U-Code.sln /p:Configuration=%1 /t:build -clp:ErrorsOnly;WarningsOnly -nologo /m
echo off
