[CmdletBinding()]
param(
    [switch]$SkipPubGet,
    [switch]$UseGoogleStorage
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$projectRoot = Split-Path -Parent $PSScriptRoot
$versionFile = Join-Path $projectRoot ".flutter-version"
$flutterVersion = (Get-Content -Raw -LiteralPath $versionFile).Trim()
$toolingRoot = Join-Path $projectRoot ".tooling"
$flutterRoot = Join-Path $toolingRoot "flutter"
$flutterCommand = Join-Path $flutterRoot "bin\flutter.bat"
$archiveName = "flutter_windows_${flutterVersion}-stable.zip"
$archivePath = Join-Path (Join-Path $toolingRoot "cache") $archiveName
$expectedSha256 = "fd7e3e4f4484a8608866bdb12d82051d34f525f80710e87ecae84f5104fc264d"
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

function Get-Sha256 {
    param([Parameter(Mandatory = $true)][string]$Path)

    $stream = [System.IO.File]::OpenRead($Path)
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    try {
        $hashBytes = $sha256.ComputeHash($stream)
        return ([System.BitConverter]::ToString($hashBytes)).Replace("-", "").ToLowerInvariant()
    } finally {
        $sha256.Dispose()
        $stream.Dispose()
    }
}

if (-not (Test-Path -LiteralPath $flutterCommand)) {
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $archivePath) | Out-Null

    $storageBase = if ($UseGoogleStorage) {
        "https://storage.googleapis.com"
    } elseif ($env:FLUTTER_STORAGE_BASE_URL) {
        $env:FLUTTER_STORAGE_BASE_URL.TrimEnd("/")
    } else {
        "https://storage.flutter-io.cn"
    }
    $downloadUrl = "$storageBase/flutter_infra_release/releases/stable/windows/$archiveName"

    $archiveIsValid = $false
    if (Test-Path -LiteralPath $archivePath) {
        $archiveHash = Get-Sha256 -Path $archivePath
        $archiveIsValid = $archiveHash.Equals(
            $expectedSha256,
            [System.StringComparison]::OrdinalIgnoreCase
        )
    }

    if (-not $archiveIsValid) {
        Write-Host "Downloading Flutter $flutterVersion from $storageBase ..."
        & curl.exe --fail --location --retry 3 --output $archivePath $downloadUrl
        if ($LASTEXITCODE -ne 0) {
            throw "Flutter SDK download failed with exit code $LASTEXITCODE."
        }
    }

    $actualSha256 = Get-Sha256 -Path $archivePath
    if (-not $actualSha256.Equals(
        $expectedSha256,
        [System.StringComparison]::OrdinalIgnoreCase
    )) {
        throw "Flutter SDK checksum mismatch. Expected $expectedSha256, got $actualSha256."
    }

    if (Test-Path -LiteralPath $flutterRoot) {
        throw "A partial Flutter SDK exists at $flutterRoot. Remove it and rerun this script."
    }

    Write-Host "Extracting Flutter $flutterVersion ..."
    Expand-Archive -LiteralPath $archivePath -DestinationPath $toolingRoot
}

if (-not $env:PUB_HOSTED_URL) {
    $env:PUB_HOSTED_URL = "https://pub.dev"
}
if (-not $env:FLUTTER_STORAGE_BASE_URL -and -not $UseGoogleStorage) {
    $env:FLUTTER_STORAGE_BASE_URL = "https://storage.flutter-io.cn"
}
$env:PUB_CACHE = Join-Path $toolingRoot "pub-cache"
$env:FLUTTER_SKIP_UPDATE_CHECK = "true"

& $flutterCommand config --no-analytics
if ($LASTEXITCODE -ne 0) {
    throw "Unable to configure Flutter."
}

& $flutterCommand --version
if ($LASTEXITCODE -ne 0) {
    throw "Flutter installation verification failed."
}

if (-not $SkipPubGet) {
    Push-Location $projectRoot
    try {
        & $flutterCommand pub get --enforce-lockfile
        if ($LASTEXITCODE -ne 0) {
            throw "Dependency restore failed."
        }
    } finally {
        Pop-Location
    }
}

Write-Host ""
Write-Host "Flutter environment is ready."
Write-Host "Use .\tool\flutter.ps1 for Flutter commands."
Write-Host "Use .\tool\verify.ps1 to run analysis and tests."
