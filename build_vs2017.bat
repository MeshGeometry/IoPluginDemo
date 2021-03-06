@echo off

::run cmake on Urho3D Source
call Urho3D/cmake_vs2017.bat ./Urho3D/Build -DURHO3D_C++11=1 -DURHO3D_SAMPLES=0 -DURHO3D_LUA=0 ^
-DURHO3D_OPENGL=1 -DURHO3D_64BIT=1 -G "Visual Studio 15 2017 Win64"

::build Urho
start /wait "" "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe" .\Urho3D\Build\Urho3D.sln /p:Configuration=Release /maxcpucount:4
start /wait "" "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe" .\Urho3D\Build\Urho3D.sln /p:Configuration=Debug /maxcpucount:4

::run cmake for this project
call cmake_vs2017.bat

::build
start "" "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe" .\Build\PluginDemo.sln /p:Configuration=Release /maxcpucount:4
start "" "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe" .\Build\PluginDemo.sln /p:Configuration=Debug /maxcpucount:4    
@echo on