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

echo [FirebaseSetup] Copying desktop Firebase JSON beside the built executable.

call %Utils% optionGetValue "desktopJsonFile" CREDENTIAL_FILE
if not defined CREDENTIAL_FILE (
    echo [FirebaseSetup] ERROR: Extension option 'desktopJsonFile' is empty.
    exit /b 1
)

call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FIREBASE_JSON_SOURCE
if errorlevel 1 exit /b 1

if not defined YYoutputFolder (
    echo [FirebaseSetup] ERROR: GameMaker variable 'YYoutputFolder' is empty.
    exit /b 1
)

if not exist "%YYoutputFolder%" (
    echo [FirebaseSetup] ERROR: GameMaker output folder does not exist:
    echo [FirebaseSetup]   %YYoutputFolder%
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

set "GMF_SOURCE=%FIREBASE_JSON_SOURCE%"
set "GMF_OUTPUT=%YYoutputFolder%"
set "GMF_PROJECT=%YYprojectName%"
set "GMF_PLATFORM=%YYPLATFORM_name%"

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "$src=$env:GMF_SOURCE;" ^
  "$out=$env:GMF_OUTPUT;" ^
  "$project=$env:GMF_PROJECT;" ^
  "$platform=$env:GMF_PLATFORM;" ^
  "$copied=$false;" ^
  "function Copy-GMFirebaseJson([string]$dir) {" ^
  "  if ([string]::IsNullOrWhiteSpace($dir)) { return };" ^
  "  New-Item -ItemType Directory -Path $dir -Force | Out-Null;" ^
  "  $dst=Join-Path $dir 'google-services.json';" ^
  "  Copy-Item -LiteralPath $src -Destination $dst -Force;" ^
  "  Write-Host ('[FirebaseSetup] Desktop Firebase config copied: ' + $dst);" ^
  "};" ^
  "if ($platform -match '^(macOS|Mac|MacOS|OSX)$') {" ^
  "  Get-ChildItem -LiteralPath $out -Directory -Recurse -Filter '*.app' -ErrorAction SilentlyContinue | ForEach-Object {" ^
  "    $dir=Join-Path $_.FullName 'Contents\MacOS';" ^
  "    if (Test-Path -LiteralPath $dir) { Copy-GMFirebaseJson $dir; $copied=$true }" ^
  "  }" ^
  "} else {" ^
  "  if (-not [string]::IsNullOrWhiteSpace($project)) {" ^
  "    Get-ChildItem -LiteralPath $out -File -Recurse -Filter ($project + '.exe') -ErrorAction SilentlyContinue | ForEach-Object {" ^
  "      Copy-GMFirebaseJson $_.DirectoryName; $copied=$true" ^
  "    }" ^
  "  };" ^
  "  if (-not $copied) {" ^
  "    $exe=Get-ChildItem -LiteralPath $out -File -Recurse -Filter '*.exe' -ErrorAction SilentlyContinue | Select-Object -First 1;" ^
  "    if ($null -ne $exe) { Copy-GMFirebaseJson $exe.DirectoryName; $copied=$true }" ^
  "  }" ^
  "};" ^
  "if (-not $copied) { Write-Host '[FirebaseSetup] Exact desktop executable was not found; using YYoutputFolder.' };" ^
  "Copy-GMFirebaseJson $out;"

if errorlevel 1 (
    echo [FirebaseSetup] ERROR: Failed to copy desktop Firebase config to the build output.
    exit /b 1
)

set "GMF_SOURCE="
set "GMF_OUTPUT="
set "GMF_PROJECT="
set "GMF_PLATFORM="

exit /b 0

:: ----------------------------------------------------------------------------------------------------
:packageLinuxFirebaseJson
setlocal EnableDelayedExpansion

set "GMF_LINUX_PROJECT=%YYprojectName%"
if not defined GMF_LINUX_PROJECT (
    if defined YYprojectPath (
        for %%A in ("%YYprojectPath%") do set "GMF_LINUX_PROJECT=%%~nA"
    )
)

if not defined GMF_LINUX_PROJECT (
    echo [FirebaseSetup] ERROR: Unable to determine the GameMaker project name for Linux asset ZIP staging.
    endlocal & exit /b 1
)

set "GMF_LINUX_ZIP=%YYoutputFolder%\!GMF_LINUX_PROJECT!.zip"
if not exist "!GMF_LINUX_ZIP!" (
    echo [FirebaseSetup] ERROR: GameMaker Linux asset ZIP does not exist:
    echo [FirebaseSetup]   !GMF_LINUX_ZIP!
    endlocal & exit /b 1
)

set "GMF_LINUX_TEMP=%YYoutputFolder%\!GMF_LINUX_PROJECT!___firebase_temp___"
if exist "!GMF_LINUX_TEMP!" rmdir /S /Q "!GMF_LINUX_TEMP!"
mkdir "!GMF_LINUX_TEMP!\assets"
if errorlevel 1 (
    echo [FirebaseSetup] ERROR: Failed to create temporary Linux package directory.
    endlocal & exit /b 1
)

copy /Y "%FIREBASE_JSON_SOURCE%" "!GMF_LINUX_TEMP!\google-services.json" >nul
if errorlevel 1 (
    echo [FirebaseSetup] ERROR: Failed to stage root google-services.json for Linux package ZIP.
    rmdir /S /Q "!GMF_LINUX_TEMP!" 2>nul
    endlocal & exit /b 1
)

copy /Y "%FIREBASE_JSON_SOURCE%" "!GMF_LINUX_TEMP!\assets\google-services.json" >nul
if errorlevel 1 (
    echo [FirebaseSetup] ERROR: Failed to stage fallback assets/google-services.json for Linux package ZIP.
    rmdir /S /Q "!GMF_LINUX_TEMP!" 2>nul
    endlocal & exit /b 1
)

pushd "%YYoutputFolder%" >nul
call %Utils% zipUpdate "!GMF_LINUX_PROJECT!___firebase_temp___" "!GMF_LINUX_PROJECT!.zip"
set "GMF_ZIP_RESULT=!errorlevel!"
popd >nul

rmdir /S /Q "!GMF_LINUX_TEMP!" 2>nul

if not "!GMF_ZIP_RESULT!"=="0" (
    echo [FirebaseSetup] ERROR: Failed to add Firebase JSON to Linux asset ZIP.
    endlocal & exit /b !GMF_ZIP_RESULT!
)

echo [FirebaseSetup] Linux Firebase config added to GameMaker package ZIP:
echo [FirebaseSetup]   !GMF_LINUX_ZIP! -^> google-services.json
echo [FirebaseSetup]   !GMF_LINUX_ZIP! -^> assets/google-services.json ^(fallback^)

endlocal & exit /b 0
