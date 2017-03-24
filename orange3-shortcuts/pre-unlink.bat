@echo off

:: Dissasociate .ows filename extension with this application
set INSTALL_KEY=Software\OrangeCanvas

:: Get the (current registered) install location
set INSTALL_PREFIX=""
for /f "tokens=3,* skip=2" %%G in ('reg query HKCU\%INSTALL_KEY%\InstallPrefix') do (
    set INSTALL_PREFIX=%%G
)

:: Do nothing if the registered prefix does not match
if not "%INSTALL_PREFIX%" == "%PREFIX%" exit 0

if exist "%PREFIX%\.nonadmin" (
    set HKEY=HKCU
) else (
    set HKEY=HKLM
)
REG DELETE %HKEY%\Software\Classes\.ows /F
REG DELETE %HKEY%\Software\Classes\OrangeCanvas /F

REG DELETE %HKEY%\%INSTALL_KEY%\InstallPrefix /F
REG DELETE %HKEY%\%INSTALL_KEY% /F
