@echo off
:: Associate .ows filename extension with the orange application
:: This is only done when installed into root conda environment

if "%PREFIX%" == "" exit 1

IF NOT "%ROOT_PREFIX%" == "%PREFIX%" EXIT 0

set INSTALL_KEY=Software\OrangeCanvas

if exist "%PREFIX%"\.noadmin" (
    set HKEY=HKCU
) else (
    set HKEY=HKLM
)

:: Register .ows extension
REG ADD %HKEY%\Software\Classes\.ows  /F /D OrangeCanvas

:: An icon for .ows files
REG ADD %HKEY%\Software\Classes\OrangeCanvas\DefaultIcon /F ^
    /D "%PREFIX%\share\orange3-app\icons\OrangeOWS.ico"

:: Register a open command for .ows files
REG ADD %HKEY%\Software\Classes\OrangeCanvas\Shell\Open\Command\ /F ^
    /D "\"%PREFIX%\pythonw.exe\" -m Orange.canvas \"%%1\""

:: Store the install prefix
REG ADD %HKEY%\%INSTALL_KEY%\InstallPrefix /F /D "%PREFIX%"
