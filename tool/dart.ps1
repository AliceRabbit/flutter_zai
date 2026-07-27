$DartArguments = @($args)

$projectRoot = Split-Path -Parent $PSScriptRoot
$dartCommand = Join-Path $projectRoot ".tooling\flutter\bin\dart.bat"
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

if (-not (Test-Path -LiteralPath $dartCommand)) {
    & (Join-Path $PSScriptRoot "bootstrap.ps1") -SkipPubGet
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

Push-Location $projectRoot
try {
    & $dartCommand @DartArguments
    exit $LASTEXITCODE
} finally {
    Pop-Location
}
