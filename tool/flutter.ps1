[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$FlutterArguments
)

$projectRoot = Split-Path -Parent $PSScriptRoot
$flutterCommand = Join-Path $projectRoot ".tooling\flutter\bin\flutter.bat"
$flutterRoot = Join-Path $projectRoot ".tooling\flutter"
$env:PUB_CACHE = Join-Path $projectRoot ".tooling\pub-cache"
$env:FLUTTER_SKIP_UPDATE_CHECK = "true"
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
