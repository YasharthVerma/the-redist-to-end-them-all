@echo off
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges. Please run as Administrator. And don't worry I already know where you live ;)
    pause
    exit /b
)

:: Set console color to blue text
color 1F

echo Installing the commmon redist(s)... ARE YOU READY????? woohoo.

set "REDIST_FOLDER=%~dp0bin-redist-req770X124"

:: Install OpenAL
echo Installing OpenAL... Ah shit, here we go again...
start /wait "" "%REDIST_FOLDER%\oalinst.exe" /silent

:: Install .NET SDK 8.0.412
echo Installing dotnet-sdk-8.0.412...  its magical how computers work.
start /wait "" "%REDIST_FOLDER%\dotnet-sdk-8.0.412-win-x64.exe" /quiet /norestart

:: Install .NET SDK 9.0.303
echo Installing dotnet-sdk-9.0.303... ever played CoD MW, my personal fav. 
start /wait "" "%REDIST_FOLDER%\dotnet-sdk-9.0.303-win-x64.exe" /quiet /norestart

:: Install .NET Framework 3.5
echo Installing dotnetfx35... I like GTA SA and IV too ^<3
start /wait "" "%REDIST_FOLDER%\dotnetfx35.exe" /q /norestart

:: Install .NET Framework 4.8
echo Installing NDP48... Skibidi Rizz? hell nah bro. you don't deserve free games...
start /wait "" "%REDIST_FOLDER%\NDP48-x86-x64-AllOS-ENU.exe" /q /norestart

:: Install PhysX 9.19.0218 (first file)
echo Installing PhysX-9.19.0218... Mafia is noice. ^& you are fine. 
start /wait "" "%REDIST_FOLDER%\PhysX-9.19.0218-SystemSoftware.exe" /quiet /norestart

:: Install PhysX 9.19.0218 (second file)
echo Installing PhysX-9.19.0218 (secondary)... another one of these files ugrhh
start /wait "" "%REDIST_FOLDER%\PhysX-9.19.0218-SystemSoftware_1.exe" /quiet /norestart

:: Install Visual C++ Build Tools
echo Installing Visual C++ Build Tools... patience my a$$
start /wait "" "%REDIST_FOLDER%\visualcppbuildtools_full.exe" /quiet /norestart

:: Install Windows Media Feature Pack (x32)
echo Installing Windows Media Feature Pack x32...meh.
start /wait wusa "%REDIST_FOLDER%\Windows_MediaFeaturePack_x32_1809Oct.msu" /quiet /norestart

:: Install Windows Media Feature Pack (x64)
echo Installing Windows Media Feature Pack x64...meh raised to the power of 2.
start /wait wusa "%REDIST_FOLDER%\Windows_MediaFeaturePack_x64_1809Oct.msu" /quiet /norestart

:: Install XNA Framework 4.0
echo Installing XNA Framework 4.0... :yawning_emoji:
start /wait msiexec /i "%REDIST_FOLDER%\xnafx40_redist_1.msi" /quiet /norestart

:: Run existing vcredist batch
echo Running install_all-vcred2000s... This shit is boring af.
call "%REDIST_FOLDER%\install_all-vcred2000s.bat"

:: Install Visual C++ Redistributable x86 LAST
echo Installing vcredist_x86... ooo, its about time...
start /wait "" "%REDIST_FOLDER%\vcredist_x86.exe" /install /quiet /norestart

echo All redistributables installed successfully, son go ahead and conquer the world!
pause
endlocal