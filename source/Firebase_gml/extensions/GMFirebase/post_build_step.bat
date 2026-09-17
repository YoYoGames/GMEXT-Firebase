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

:: For macOS VM exports, inject the Firebase JSON into the package ZIP the asset
:: compiler wrote (game.zip, or <project>.zip for a run), under assets/ where an
:: Included File goes. The YYC export is handled below: at this point it is an
:: Xcode project, not an .app.
set "GMF_MAC_ZIPPED="
set "GMF_IS_MAC="
for %%P in (macOS Mac MacOS OSX) do if /I "%YYPLATFORM_name%"=="%%P" set "GMF_IS_MAC=1"
if defined GMF_IS_MAC call :packageMacFirebaseJson
if errorlevel 1 exit /b %errorlevel%

set "GMF_SOURCE=%FIREBASE_JSON_SOURCE%"
set "GMF_OUTPUT=%YYoutputFolder%"
set "GMF_PROJECT=%YYprojectName%"
set "GMF_PLATFORM=%YYPLATFORM_name%"

:: Windows/Linux: beside the executable when one is in the output, else the
:: output root. macOS YYC: there is no .app yet, this step runs before
:: xcodebuild; the Xcode project's <Proj>/<Proj>/Supporting Files is what becomes
:: <Game>.app/Contents/Resources, the directory getConfigSearchDir() reads.
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "$src=$env:GMF_SOURCE;" ^
  "$out=$env:GMF_OUTPUT;" ^
  "$project=$env:GMF_PROJECT;" ^
  "$platform=$env:GMF_PLATFORM;" ^
  "$copied=($env:GMF_MAC_ZIPPED -eq '1');" ^
  "function Copy-GMFirebaseJson([string]$dir) {" ^
  "  if ([string]::IsNullOrWhiteSpace($dir)) { return };" ^
  "  New-Item -ItemType Directory -Path $dir -Force | Out-Null;" ^
  "  $dst=Join-Path $dir 'google-services.json';" ^
  "  Copy-Item -LiteralPath $src -Destination $dst -Force;" ^
  "  Write-Host ('[FirebaseSetup] Desktop Firebase config copied: ' + $dst);" ^
  "};" ^
  "if ($platform -match '^(macOS|Mac|MacOS|OSX)$') {" ^
  "  Get-ChildItem -LiteralPath $out -Directory -Recurse -Depth 2 -Filter 'Supporting Files' -ErrorAction SilentlyContinue | ForEach-Object {" ^
  "    Copy-GMFirebaseJson $_.FullName; $copied=$true" ^
  "  };" ^
  "  if (-not $copied) { Write-Host '[FirebaseSetup] WARNING: No Xcode project (<Proj>/<Proj>/Supporting Files) or package ZIP (game.zip, <project>.zip) under YYoutputFolder; the Firebase config was not staged into the macOS bundle.' }" ^
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

:: ----------------------------------------------------------------------------------------------------
:packageMacFirebaseJson
setlocal EnableDelayedExpansion

set "GMF_MAC_PROJECT=%YYprojectName%"
if not defined GMF_MAC_PROJECT (
    if defined YYprojectPath (
        for %%A in ("%YYprojectPath%") do set "GMF_MAC_PROJECT=%%~nA"
    )
)

set "GMF_MAC_ZIPS=game"
if defined GMF_MAC_PROJECT if /I not "!GMF_MAC_PROJECT!"=="game" set "GMF_MAC_ZIPS=game;!GMF_MAC_PROJECT!"

set "GMF_MAC_FOUND="
for %%Z in ("!GMF_MAC_ZIPS:;=" "!") do (
    if exist "%YYoutputFolder%\%%~Z.zip" (
        call :addMacFirebaseJsonToZip "%%~Z"
        if errorlevel 1 (endlocal & exit /b 1)
        set "GMF_MAC_FOUND=1"
    )
)

:: Tell the copy step below whether a package ZIP was staged, so the YYC-only
:: warning stays quiet on a VM export.
if defined GMF_MAC_FOUND (endlocal & set "GMF_MAC_ZIPPED=1") else endlocal
exit /b 0

:: Injects the Firebase JSON into <YYoutputFolder>\<name>.zip under assets/.
:addMacFirebaseJsonToZip
set "GMF_MAC_ZIP=%YYoutputFolder%\%~1.zip"
set "GMF_MAC_TEMP=%YYoutputFolder%\%~1___firebase_temp___"
if exist "%GMF_MAC_TEMP%" rmdir /S /Q "%GMF_MAC_TEMP%"
mkdir "%GMF_MAC_TEMP%\assets"
if errorlevel 1 (
    echo [FirebaseSetup] ERROR: Failed to create temporary macOS package directory.
    exit /b 1
)

copy /Y "%FIREBASE_JSON_SOURCE%" "%GMF_MAC_TEMP%\assets\google-services.json" >nul
if errorlevel 1 (
    echo [FirebaseSetup] ERROR: Failed to stage assets/google-services.json for the macOS package ZIP.
    rmdir /S /Q "%GMF_MAC_TEMP%" 2>nul
    exit /b 1
)

pushd "%YYoutputFolder%" >nul
call %Utils% zipUpdate "%~1___firebase_temp___" "%~1.zip"
set "GMF_MAC_ZIP_RESULT=%errorlevel%"
popd >nul

rmdir /S /Q "%GMF_MAC_TEMP%" 2>nul

if not "%GMF_MAC_ZIP_RESULT%"=="0" (
    echo [FirebaseSetup] ERROR: Failed to add Firebase JSON to the macOS package ZIP.
    exit /b 1
)

echo [FirebaseSetup] Desktop Firebase config added to package ZIP:
echo [FirebaseSetup]   %GMF_MAC_ZIP% -^> assets/google-services.json
exit /b 0
