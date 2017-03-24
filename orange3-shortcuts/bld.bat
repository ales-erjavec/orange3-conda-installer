
if "%PREFIX%" == "" exit 1
if "%RECIPE_DIR%" == "" exit 1

set MENU_DIR=%PREFIX%\Menu
set ORANGE_ICON=%RECIPE_DIR%\orange.ico
set ICON_DIR=%PREFIX%\share\orange3\icons


if not exist "%MENU_DIR%" (
    mkdir "%MENU_DIR%"
    if errorlevel 1 exit 1
)


copy "%ORANGE_ICON%" "%MENU_DIR%\orange.ico"
if errorlevel 1 exit 1

copy "%RECIPE_DIR%\menu-windows.json" "%MENU_DIR%\orange3-shortcuts.json"
if errorlevel 1 exit 1

:: copy (application and .ows file) icon into place
if not exist "%ICON_DIR%" (
    mkdir "%ICON_DIR%"
)

copy "%RECIPE_DIR%\orange.ico" "%ICON_DIR%"
if errorlevel 1 exit 1

copy "%RECIPE_DIR%\OrangeOWS.ico" "%ICON_DIR%"
if errorlevel 1 exit 1