@echo off
setlocal EnableExtensions

set Utils="%~dp0\scriptUtils.bat"
call %Utils% scriptInit
if errorlevel 1 exit /b %errorlevel%

:: Mobile/web platforms use their normal Firebase platform configuration.
if /I "%YYPLATFORM_name%"=="Android" exit /b 0
if /I "%YYPLATFORM_name%"=="iOS" exit /b 0
if /I "%YYPLATFORM_name%"=="tvOS" exit /b 0
if /I "%YYPLATFORM_name%"=="HTML5" exit /b 0

echo [GMFirebaseCore] Copying desktop Firebase JSON beside the built executable.

call %Utils% optionGetValue "desktopJsonFile" CREDENTIAL_FILE
if not defined CREDENTIAL_FILE (
    echo [GMFirebaseCore] ERROR: Extension option 'desktopJsonFile' is empty.
    exit /b 1
)

call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FIREBASE_JSON_SOURCE
if errorlevel 1 exit /b 1

if not defined YYoutputFolder (
    echo [GMFirebaseCore] ERROR: GameMaker variable 'YYoutputFolder' is empty.
    exit /b 1
)

if not exist "%YYoutputFolder%" (
    echo [GMFirebaseCore] ERROR: GameMaker output folder does not exist:
    echo [GMFirebaseCore]   %YYoutputFolder%
    exit /b 1
)

:: For Linux exports, inject the Firebase JSON into the GameMaker package ZIP.
:: Firebase C++ desktop searches the process current working directory, so the
:: primary copy must be at ZIP root beside the Linux executable. An assets copy
:: is kept as a fallback/debug convenience.
if /I "%YYPLATFORM_name%"=="Linux" call :packageLinuxFirebaseJson
if errorlevel 1 exit /b %errorlevel%
if /I "%YYPLATFORM_name%"=="Ubuntu" call :packageLinuxFirebaseJson
if errorlevel 1 exit /b %errorlevel%

set "GMFC_SOURCE=%FIREBASE_JSON_SOURCE%"
set "GMFC_OUTPUT=%YYoutputFolder%"
set "GMFC_PROJECT=%YYprojectName%"
set "GMFC_PLATFORM=%YYPLATFORM_name%"

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "$src=$env:GMFC_SOURCE;" ^
  "$out=$env:GMFC_OUTPUT;" ^
  "$project=$env:GMFC_PROJECT;" ^
  "$platform=$env:GMFC_PLATFORM;" ^
  "$copied=$false;" ^
  "function Copy-GMFirebaseCoreJson([string]$dir) {" ^
  "  if ([string]::IsNullOrWhiteSpace($dir)) { return };" ^
  "  New-Item -ItemType Directory -Path $dir -Force | Out-Null;" ^
  "  $dst=Join-Path $dir 'google-services.json';" ^
  "  Copy-Item -LiteralPath $src -Destination $dst -Force;" ^
  "  Write-Host ('[GMFirebaseCore] Desktop Firebase config copied: ' + $dst);" ^
  "};" ^
  "if ($platform -match '^(macOS|Mac|MacOS|OSX)$') {" ^
  "  Get-ChildItem -LiteralPath $out -Directory -Recurse -Filter '*.app' -ErrorAction SilentlyContinue | ForEach-Object {" ^
  "    $dir=Join-Path $_.FullName 'Contents\MacOS';" ^
  "    if (Test-Path -LiteralPath $dir) { Copy-GMFirebaseCoreJson $dir; $copied=$true }" ^
  "  }" ^
  "} else {" ^
  "  if (-not [string]::IsNullOrWhiteSpace($project)) {" ^
  "    Get-ChildItem -LiteralPath $out -File -Recurse -Filter ($project + '.exe') -ErrorAction SilentlyContinue | ForEach-Object {" ^
  "      Copy-GMFirebaseCoreJson $_.DirectoryName; $copied=$true" ^
  "    }" ^
  "  };" ^
  "  if (-not $copied) {" ^
  "    $exe=Get-ChildItem -LiteralPath $out -File -Recurse -Filter '*.exe' -ErrorAction SilentlyContinue | Select-Object -First 1;" ^
  "    if ($null -ne $exe) { Copy-GMFirebaseCoreJson $exe.DirectoryName; $copied=$true }" ^
  "  }" ^
  "};" ^
  "if (-not $copied) { Write-Host '[GMFirebaseCore] Exact desktop executable was not found; using YYoutputFolder.' };" ^
  "Copy-GMFirebaseCoreJson $out;"

if errorlevel 1 (
    echo [GMFirebaseCore] ERROR: Failed to copy desktop Firebase config to the build output.
    exit /b 1
)

set "GMFC_SOURCE="
set "GMFC_OUTPUT="
set "GMFC_PROJECT="
set "GMFC_PLATFORM="

exit /b 0

:: ----------------------------------------------------------------------------------------------------
:packageLinuxFirebaseJson
setlocal EnableDelayedExpansion

set "GMFC_LINUX_PROJECT=%YYprojectName%"
if not defined GMFC_LINUX_PROJECT (
    if defined YYprojectPath (
        for %%A in ("%YYprojectPath%") do set "GMFC_LINUX_PROJECT=%%~nA"
    )
)

if not defined GMFC_LINUX_PROJECT (
    echo [GMFirebaseCore] ERROR: Unable to determine the GameMaker project name for Linux asset ZIP staging.
    endlocal & exit /b 1
)

set "GMFC_LINUX_ZIP=%YYoutputFolder%\!GMFC_LINUX_PROJECT!.zip"
if not exist "!GMFC_LINUX_ZIP!" (
    echo [GMFirebaseCore] ERROR: GameMaker Linux asset ZIP does not exist:
    echo [GMFirebaseCore]   !GMFC_LINUX_ZIP!
    endlocal & exit /b 1
)

set "GMFC_LINUX_TEMP=%YYoutputFolder%\!GMFC_LINUX_PROJECT!___firebase_temp___"
if exist "!GMFC_LINUX_TEMP!" rmdir /S /Q "!GMFC_LINUX_TEMP!"
mkdir "!GMFC_LINUX_TEMP!\assets"
if errorlevel 1 (
    echo [GMFirebaseCore] ERROR: Failed to create temporary Linux package directory.
    endlocal & exit /b 1
)

copy /Y "%FIREBASE_JSON_SOURCE%" "!GMFC_LINUX_TEMP!\google-services.json" >nul
if errorlevel 1 (
    echo [GMFirebaseCore] ERROR: Failed to stage root google-services.json for Linux package ZIP.
    rmdir /S /Q "!GMFC_LINUX_TEMP!" 2>nul
    endlocal & exit /b 1
)

copy /Y "%FIREBASE_JSON_SOURCE%" "!GMFC_LINUX_TEMP!\assets\google-services.json" >nul
if errorlevel 1 (
    echo [GMFirebaseCore] ERROR: Failed to stage fallback assets/google-services.json for Linux package ZIP.
    rmdir /S /Q "!GMFC_LINUX_TEMP!" 2>nul
    endlocal & exit /b 1
)

pushd "%YYoutputFolder%" >nul
call %Utils% zipUpdate "!GMFC_LINUX_PROJECT!___firebase_temp___" "!GMFC_LINUX_PROJECT!.zip"
set "GMFC_ZIP_RESULT=!errorlevel!"
popd >nul

rmdir /S /Q "!GMFC_LINUX_TEMP!" 2>nul

if not "!GMFC_ZIP_RESULT!"=="0" (
    echo [GMFirebaseCore] ERROR: Failed to add Firebase JSON to Linux asset ZIP.
    endlocal & exit /b !GMFC_ZIP_RESULT!
)

echo [GMFirebaseCore] Linux Firebase config added to GameMaker package ZIP:
echo [GMFirebaseCore]   !GMFC_LINUX_ZIP! -^> google-services.json
echo [GMFirebaseCore]   !GMFC_LINUX_ZIP! -^> assets/google-services.json ^(fallback^)

endlocal & exit /b 0
