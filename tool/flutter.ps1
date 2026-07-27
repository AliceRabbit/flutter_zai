$FlutterArguments = @($args)

$projectRoot = Split-Path -Parent $PSScriptRoot
$flutterCommand = Join-Path $projectRoot ".tooling\flutter\bin\flutter.bat"
$flutterRoot = Join-Path $projectRoot ".tooling\flutter"
$localAppDataRoot = Join-Path $projectRoot ".tooling\localappdata"
$roamingAppDataRoot = Join-Path $projectRoot ".tooling\appdata"
New-Item -ItemType Directory -Force -Path $localAppDataRoot, $roamingAppDataRoot |
    Out-Null
$env:LOCALAPPDATA = $localAppDataRoot
$env:APPDATA = $roamingAppDataRoot
$env:PUB_CACHE = Join-Path $projectRoot ".tooling\pub-cache"
$env:DART_SUPPRESS_ANALYTICS = "true"
$env:FLUTTER_SUPPRESS_ANALYTICS = "true"
$env:Path = "$(Join-Path $flutterRoot 'bin');$env:Path"
$localJdkRoot = Join-Path $projectRoot ".tooling\jdk-17"
$localAndroidSdkRoot = Join-Path $projectRoot ".tooling\android-sdk"
$localAndroidUserHome = Join-Path $projectRoot ".tooling\android-user"
$env:GRADLE_USER_HOME = Join-Path $projectRoot ".tooling\gradle"
$env:FLUTTER_SKIP_UPDATE_CHECK = "true"
if (Test-Path -LiteralPath (Join-Path $localJdkRoot "bin\java.exe")) {
    $env:JAVA_HOME = $localJdkRoot
    $env:Path = "$(Join-Path $localJdkRoot 'bin');$env:Path"
}
if (Test-Path -LiteralPath $localAndroidSdkRoot) {
    $env:ANDROID_HOME = $localAndroidSdkRoot
    $env:ANDROID_SDK_ROOT = $localAndroidSdkRoot
    $env:ANDROID_USER_HOME = $localAndroidUserHome
    $env:Path = (
        (Join-Path $localAndroidUserHome "bin"),
        (Join-Path $localAndroidSdkRoot "cmdline-tools\latest\bin"),
        (Join-Path $localAndroidSdkRoot "platform-tools"),
        $env:Path
    ) -join ";"
}
$gitConfigCount = 0
[int]::TryParse($env:GIT_CONFIG_COUNT, [ref]$gitConfigCount) | Out-Null
[Environment]::SetEnvironmentVariable(
    "GIT_CONFIG_KEY_$gitConfigCount",
    "safe.directory",
    "Process"
)
[Environment]::SetEnvironmentVariable(
    "GIT_CONFIG_VALUE_$gitConfigCount",
    $flutterRoot.Replace("\", "/"),
    "Process"
)
$env:GIT_CONFIG_COUNT = ($gitConfigCount + 1).ToString()
if (-not (Get-Command git.exe -ErrorAction SilentlyContinue)) {
    $gitLocations = @(
        "C:\Program Files\Git\cmd",
        "D:\Program Files\Git\cmd"
    )
    $gitLocation = $gitLocations |
        Where-Object { Test-Path -LiteralPath (Join-Path $_ "git.exe") } |
        Select-Object -First 1
    if (-not $gitLocation) {
        throw "Git for Windows is required but was not found."
    }
    $env:Path = "$gitLocation;$env:Path"
}
if (-not $env:PUB_HOSTED_URL) {
    $env:PUB_HOSTED_URL = "https://pub.dev"
}
if (-not $env:FLUTTER_STORAGE_BASE_URL) {
    $env:FLUTTER_STORAGE_BASE_URL = "https://storage.flutter-io.cn"
}

if (-not (Test-Path -LiteralPath $flutterCommand)) {
    & (Join-Path $PSScriptRoot "bootstrap.ps1") -SkipPubGet
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

Push-Location $projectRoot
try {
    & $flutterCommand @FlutterArguments
    exit $LASTEXITCODE
} finally {
    Pop-Location
}
