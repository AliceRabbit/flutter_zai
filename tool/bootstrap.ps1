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
$localAppDataRoot = Join-Path $toolingRoot "localappdata"
$roamingAppDataRoot = Join-Path $toolingRoot "appdata"
New-Item -ItemType Directory -Force -Path $localAppDataRoot, $roamingAppDataRoot |
    Out-Null
$env:LOCALAPPDATA = $localAppDataRoot
$env:APPDATA = $roamingAppDataRoot
$env:DART_SUPPRESS_ANALYTICS = "true"
$env:FLUTTER_SUPPRESS_ANALYTICS = "true"
$archiveName = "flutter_windows_${flutterVersion}-stable.zip"
$archivePath = Join-Path (Join-Path $toolingRoot "cache") $archiveName
$expectedSha256 = "095c108a08e0377d8a6501fed65aeb288908a070ed3f135e525dc6431c7686e4"
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
        $aria2 = Get-Command aria2c.exe -ErrorAction SilentlyContinue
        if ($aria2) {
            Write-Host "Using aria2 with parallel connections and resume support ..."
            & $aria2.Source `
                --continue=true `
                --max-connection-per-server=16 `
                --split=16 `
                --min-split-size=1M `
                --file-allocation=none `
                --auto-file-renaming=false `
                --allow-overwrite=true `
                --check-integrity=true `
                "--checksum=sha-256=$expectedSha256" `
                --dir (Split-Path -Parent $archivePath) `
                --out (Split-Path -Leaf $archivePath) `
                $downloadUrl
            if ($LASTEXITCODE -ne 0) {
                Write-Warning "aria2 failed with exit code $LASTEXITCODE; falling back to curl."
                $curlArguments = @(
                    "--fail",
                    "--location",
                    "--retry", "3",
                    "--continue-at", "-",
                    "--output", $archivePath,
                    $downloadUrl
                )
                & curl.exe @curlArguments
                if ($LASTEXITCODE -ne 0) {
                    throw "Flutter SDK download failed with curl exit code $LASTEXITCODE."
                }
            }
        } else {
            $curlArguments = @(
                "--fail",
                "--location",
                "--retry", "3"
            )
            if (Test-Path -LiteralPath $archivePath) {
                Write-Host "Resuming the existing partial SDK archive ..."
                $curlArguments += @("--continue-at", "-")
            }
            $curlArguments += @("--output", $archivePath, $downloadUrl)
            & curl.exe @curlArguments
            if ($LASTEXITCODE -ne 0) {
                throw "Flutter SDK download failed with curl exit code $LASTEXITCODE."
            }
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
