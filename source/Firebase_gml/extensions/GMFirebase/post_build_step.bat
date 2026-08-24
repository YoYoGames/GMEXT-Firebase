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
