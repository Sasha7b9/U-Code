set current_dir=%CD%
cd ../../../src/ThirdParty/opus/
rmdir generated /S /Q
cmake . -B../../../generated/opus -DCMAKE_GENERATOR_PLATFORM=x64 -DCMAKE_GENERATOR="Visual Studio 16 2019" -DCMAKE_BUILD_TYPE=Release
MSBuild.exe ../../../generated/opus/Opus.sln /p:Configuration=release /t:build -clp:ErrorsOnly -nologo /m
cd %current_dir%
