[CmdletBinding()]
param(
    [switch]$SkipPackages
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$projectRoot = Split-Path -Parent $PSScriptRoot
$toolingRoot = Join-Path $projectRoot ".tooling"
$cacheRoot = Join-Path $toolingRoot "cache"
$jdkRoot = Join-Path $toolingRoot "jdk-17"
$androidSdkRoot = Join-Path $toolingRoot "android-sdk"
$androidUserHome = Join-Path $toolingRoot "android-user"
$commandLineToolsRoot = Join-Path $androidSdkRoot "cmdline-tools\latest"
$androidCliLauncher = Join-Path $commandLineToolsRoot "bin\android.exe"
$androidCli = Join-Path $androidUserHome "bin\android-cli.exe"

$jdkVersion = "17.0.19+10"
$jdkArchiveName = "OpenJDK17U-jdk_x64_windows_hotspot_17.0.19_10.zip"
$jdkArchiveUrl =
    "https://github.com/adoptium/temurin17-binaries/releases/download/" +
    "jdk-17.0.19%2B10/$jdkArchiveName"
$jdkSha256 = "b5b235c48adf6a081874b812c630b9f4b5f637b7a5ed18b9174d08a41ec4c235"

$commandLineToolsRevision = "15859902"
$commandLineToolsArchiveName =
    "commandlinetools-win-${commandLineToolsRevision}_latest.zip"
$commandLineToolsArchiveUrl =
    "https://dl.google.com/android/repository/$commandLineToolsArchiveName"
$commandLineToolsSha256 =
    "90ae805d20434428bffcb699c290860f19bb5f66a67e6b330067e3de801fb04a"

$ndkVersion = "28.2.13676358"
$ndkArchiveName = "android-ndk-r28c-windows.zip"
$ndkArchiveUrl = "https://dl.google.com/android/repository/$ndkArchiveName"
$ndkArchiveSize = 748118221
$ndkSha1 = "086bba43ff2f5eb0e387b15c8278bb4e0d89ba1d"
$ndkRoot = Join-Path $androidSdkRoot "ndk\$ndkVersion"

$androidPackages = @(
    "platform-tools@37.0.0",
    "platforms/android-35@2.0.0",
    "platforms/android-36@2.0.0",
    "build-tools/36.0.0@36.0.0",
    "cmake/3.22.1@3.22.1"
)

function Get-Hash {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [ValidateSet("SHA1", "SHA256")][string]$Algorithm = "SHA256"
    )

    $stream = [System.IO.File]::OpenRead($Path)
    $hashAlgorithm = if ($Algorithm -eq "SHA1") {
        [System.Security.Cryptography.SHA1]::Create()
    } else {
        [System.Security.Cryptography.SHA256]::Create()
    }
    try {
        $hashBytes = $hashAlgorithm.ComputeHash($stream)
        return ([System.BitConverter]::ToString($hashBytes)).
            Replace("-", "").
            ToLowerInvariant()
    } finally {
        $hashAlgorithm.Dispose()
        $stream.Dispose()
    }
}

function Test-VerifiedArchive {
    param(
        [Parameter(Mandatory = $true)][string]$ArchivePath,
        [Parameter(Mandatory = $true)][string]$ExpectedHash,
        [ValidateSet("SHA1", "SHA256")][string]$HashAlgorithm = "SHA256",
        [long]$ExpectedSize = 0
    )

    if (-not (Test-Path -LiteralPath $ArchivePath)) {
        return $false
    }
    if ($ExpectedSize -gt 0 -and
        (Get-Item -LiteralPath $ArchivePath).Length -ne $ExpectedSize) {
        return $false
    }

    $actualHash = Get-Hash -Path $ArchivePath -Algorithm $HashAlgorithm
    return $actualHash.Equals(
        $ExpectedHash,
        [System.StringComparison]::OrdinalIgnoreCase
    )
}

function Get-VerifiedArchive {
    param(
        [Parameter(Mandatory = $true)][string]$Url,
        [Parameter(Mandatory = $true)][string]$ArchivePath,
        [Parameter(Mandatory = $true)][string]$ExpectedHash,
        [ValidateSet("SHA1", "SHA256")][string]$HashAlgorithm = "SHA256",
        [long]$ExpectedSize = 0
    )

    if (Test-VerifiedArchive `
        -ArchivePath $ArchivePath `
        -ExpectedHash $ExpectedHash `
        -HashAlgorithm $HashAlgorithm `
        -ExpectedSize $ExpectedSize
    ) {
        Write-Host "Using verified cache: $(Split-Path -Leaf $ArchivePath)"
        return
    }

    if (Test-Path -LiteralPath $ArchivePath) {
        Write-Warning "Removing corrupt cached archive: $ArchivePath"
        Remove-Item -LiteralPath $ArchivePath -Force
    }

    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $ArchivePath) |
        Out-Null

    $aria2 = Get-Command aria2c.exe -ErrorAction SilentlyContinue
    if ($aria2) {
        $aria2HashAlgorithm = if ($HashAlgorithm -eq "SHA1") {
            "sha-1"
        } else {
            "sha-256"
        }
        Write-Host "Downloading $(Split-Path -Leaf $ArchivePath) with aria2 ..."
        & $aria2.Source `
            --continue=true `
            --max-connection-per-server=16 `
            --split=16 `
            --min-split-size=1M `
            --file-allocation=none `
            --auto-file-renaming=false `
            --allow-overwrite=true `
            --check-integrity=true `
            "--checksum=$aria2HashAlgorithm=$ExpectedHash" `
            --dir (Split-Path -Parent $ArchivePath) `
            --out (Split-Path -Leaf $ArchivePath) `
            $Url
        if ($LASTEXITCODE -ne 0) {
            Write-Warning "aria2 failed with exit code $LASTEXITCODE; falling back to curl."
        }
    }

    if (-not (Test-VerifiedArchive `
        -ArchivePath $ArchivePath `
        -ExpectedHash $ExpectedHash `
        -HashAlgorithm $HashAlgorithm `
        -ExpectedSize $ExpectedSize
    )) {
        $curlArguments = @(
            "--fail",
            "--location",
            "--retry", "3"
        )
        if (Test-Path -LiteralPath $ArchivePath) {
            $curlArguments += @("--continue-at", "-")
        }
        $curlArguments += @("--output", $ArchivePath, $Url)

        & curl.exe @curlArguments
        if ($LASTEXITCODE -ne 0) {
            throw "Download failed with curl exit code $LASTEXITCODE."
        }
    }

    if (-not (Test-VerifiedArchive `
        -ArchivePath $ArchivePath `
        -ExpectedHash $ExpectedHash `
        -HashAlgorithm $HashAlgorithm `
        -ExpectedSize $ExpectedSize
    )) {
        $actualHash = Get-Hash -Path $ArchivePath -Algorithm $HashAlgorithm
        throw (
            "Checksum mismatch for $ArchivePath. " +
            "Expected $ExpectedHash, got $actualHash."
        )
    }
}

function Expand-Jdk {
    param([Parameter(Mandatory = $true)][string]$ArchivePath)

    if (Test-Path -LiteralPath (Join-Path $jdkRoot "bin\java.exe")) {
        return
    }
    if (Test-Path -LiteralPath $jdkRoot) {
        throw "A partial JDK exists at $jdkRoot. Remove it and rerun this script."
    }

    $stagingRoot = Join-Path $toolingRoot "jdk-staging-$([guid]::NewGuid())"
    try {
        Write-Host "Extracting Eclipse Temurin JDK $jdkVersion ..."
        Expand-Archive -LiteralPath $ArchivePath -DestinationPath $stagingRoot
        $java = Get-ChildItem -LiteralPath $stagingRoot -Recurse -Filter "java.exe" |
            Where-Object { $_.FullName.EndsWith("\bin\java.exe") } |
            Select-Object -First 1
        if (-not $java) {
            throw "The JDK archive did not contain bin\java.exe."
        }
        $extractedJdkRoot = Split-Path -Parent (Split-Path -Parent $java.FullName)
        Move-Item -LiteralPath $extractedJdkRoot -Destination $jdkRoot
    } finally {
        if (Test-Path -LiteralPath $stagingRoot) {
            Remove-Item -LiteralPath $stagingRoot -Recurse -Force
        }
    }
}

function Expand-AndroidCommandLineTools {
    param([Parameter(Mandatory = $true)][string]$ArchivePath)

    if (Test-Path -LiteralPath $androidCliLauncher) {
        return
    }
    if (Test-Path -LiteralPath $commandLineToolsRoot) {
        throw (
            "Partial Android command-line tools exist at " +
            "$commandLineToolsRoot. Remove them and rerun this script."
        )
    }

    $stagingRoot = Join-Path $toolingRoot "android-staging-$([guid]::NewGuid())"
    try {
        Write-Host "Extracting Android SDK command-line tools ..."
        Expand-Archive -LiteralPath $ArchivePath -DestinationPath $stagingRoot
        $extractedRoot = Join-Path $stagingRoot "cmdline-tools"
        if (-not (Test-Path -LiteralPath (Join-Path $extractedRoot "bin\android.exe"))) {
            throw "The Android SDK archive did not contain the Android CLI launcher."
        }
        New-Item -ItemType Directory -Force -Path (
            Split-Path -Parent $commandLineToolsRoot
        ) | Out-Null
        Move-Item -LiteralPath $extractedRoot -Destination $commandLineToolsRoot
    } finally {
        if (Test-Path -LiteralPath $stagingRoot) {
            Remove-Item -LiteralPath $stagingRoot -Recurse -Force
        }
    }
}

function Install-Ndk {
    param([Parameter(Mandatory = $true)][string]$ArchivePath)

    $sourceProperties = Join-Path $ndkRoot "source.properties"
    if (Test-Path -LiteralPath $sourceProperties) {
        $installedRevision = Select-String `
            -LiteralPath $sourceProperties `
            -Pattern "Pkg.Revision\s*=\s*$([regex]::Escape($ndkVersion))"
        if ($installedRevision) {
            return
        }
        throw "An unexpected NDK installation exists at $ndkRoot."
    }

    if (Test-Path -LiteralPath $ndkRoot) {
        Write-Warning "Removing incomplete NDK installation: $ndkRoot"
        Remove-Item -LiteralPath $ndkRoot -Recurse -Force
    }

    $stagingRoot = Join-Path $toolingRoot "ndk-staging-$([guid]::NewGuid())"
    try {
        Write-Host "Extracting Android NDK r28c ..."
        Expand-Archive -LiteralPath $ArchivePath -DestinationPath $stagingRoot
        $extractedRoot = Join-Path $stagingRoot "android-ndk-r28c"
        $extractedProperties = Join-Path $extractedRoot "source.properties"
        if (-not (Test-Path -LiteralPath $extractedProperties)) {
            throw "The NDK archive did not contain source.properties."
        }
        $extractedRevision = Select-String `
            -LiteralPath $extractedProperties `
            -Pattern "Pkg.Revision\s*=\s*$([regex]::Escape($ndkVersion))"
        if (-not $extractedRevision) {
            throw "The NDK archive did not contain revision $ndkVersion."
        }
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $ndkRoot) |
            Out-Null
        Move-Item -LiteralPath $extractedRoot -Destination $ndkRoot
    } finally {
        if (Test-Path -LiteralPath $stagingRoot) {
            Remove-Item -LiteralPath $stagingRoot -Recurse -Force
        }
    }
}

function Remove-PartialAndroidPackage {
    param(
        [Parameter(Mandatory = $true)][string]$PackageRoot,
        [Parameter(Mandatory = $true)][string]$Marker
    )

    if ((Test-Path -LiteralPath $PackageRoot) -and
        -not (Test-Path -LiteralPath (Join-Path $PackageRoot $Marker))) {
        Write-Warning "Removing incomplete Android SDK package: $PackageRoot"
        Remove-Item -LiteralPath $PackageRoot -Recurse -Force
    }
}

function Assert-GoogleCodeSignature {
    param([Parameter(Mandatory = $true)][string]$Path)

    $certificate = [System.Security.Cryptography.X509Certificates.X509Certificate2]::new(
        [System.Security.Cryptography.X509Certificates.X509Certificate]::CreateFromSignedFile(
            $Path
        )
    )
    try {
        if ($certificate.Subject -notmatch "(^|,\s*)O=Google LLC(,|$)") {
            throw "Android CLI is not signed by Google LLC."
        }
    } finally {
        $certificate.Dispose()
    }

    $authenticodeCommand = Get-Command `
        Get-AuthenticodeSignature `
        -ErrorAction SilentlyContinue
    if ($authenticodeCommand) {
        $signature = & $authenticodeCommand -LiteralPath $Path
        if ($signature.Status -ne "Valid") {
            throw "Android CLI has an invalid Authenticode signature."
        }
    } else {
        Write-Warning (
            "Authenticode trust-chain validation is unavailable in this " +
            "PowerShell host; the embedded Google LLC certificate was verified."
        )
    }
}

New-Item -ItemType Directory -Force -Path (
    $toolingRoot,
    $cacheRoot,
    $androidUserHome
) | Out-Null

$jdkArchivePath = Join-Path $cacheRoot $jdkArchiveName
Get-VerifiedArchive `
    -Url $jdkArchiveUrl `
    -ArchivePath $jdkArchivePath `
    -ExpectedHash $jdkSha256
Expand-Jdk -ArchivePath $jdkArchivePath

$commandLineToolsArchivePath = Join-Path $cacheRoot $commandLineToolsArchiveName
Get-VerifiedArchive `
    -Url $commandLineToolsArchiveUrl `
    -ArchivePath $commandLineToolsArchivePath `
    -ExpectedHash $commandLineToolsSha256
Expand-AndroidCommandLineTools -ArchivePath $commandLineToolsArchivePath

if (-not $SkipPackages) {
    $ndkArchivePath = Join-Path $cacheRoot $ndkArchiveName
    Get-VerifiedArchive `
        -Url $ndkArchiveUrl `
        -ArchivePath $ndkArchivePath `
        -ExpectedHash $ndkSha1 `
        -HashAlgorithm SHA1 `
        -ExpectedSize $ndkArchiveSize
    Install-Ndk -ArchivePath $ndkArchivePath
}

$env:JAVA_HOME = $jdkRoot
$env:ANDROID_HOME = $androidSdkRoot
$env:ANDROID_SDK_ROOT = $androidSdkRoot
$env:ANDROID_USER_HOME = $androidUserHome
$env:GRADLE_USER_HOME = Join-Path $toolingRoot "gradle"
$env:Path = (
    (Join-Path $jdkRoot "bin"),
    (Join-Path $androidUserHome "bin"),
    (Join-Path $commandLineToolsRoot "bin"),
    (Join-Path $androidSdkRoot "platform-tools"),
    $env:Path
) -join ";"

if (-not $SkipPackages) {
    Remove-PartialAndroidPackage `
        -PackageRoot (Join-Path $androidSdkRoot "cmake\3.22.1") `
        -Marker "bin\cmake.exe"

    $androidPackageFiles = @(
        (Join-Path $androidSdkRoot "platform-tools\adb.exe"),
        (Join-Path $androidSdkRoot "platforms\android-35\android.jar"),
        (Join-Path $androidSdkRoot "platforms\android-36\android.jar"),
        (Join-Path $androidSdkRoot "build-tools\36.0.0\aapt2.exe"),
        (Join-Path $androidSdkRoot "cmake\3.22.1\bin\cmake.exe")
    )
    $missingPackageFiles = $androidPackageFiles |
        Where-Object { -not (Test-Path -LiteralPath $_) }
    if ($missingPackageFiles) {
        if (-not (Test-Path -LiteralPath $androidCli)) {
            Write-Host "Bootstrapping the signed Android CLI ..."
            & $androidCliLauncher --no-metrics --version
            if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $androidCli)) {
                throw "Unable to bootstrap Android CLI."
            }
        }

        Assert-GoogleCodeSignature -Path $androidCli

        Write-Host "Installing pinned Android SDK packages ..."
        & $androidCli `
            --no-metrics `
            "--sdk=$androidSdkRoot" `
            sdk install `
            @androidPackages
        $androidCliExitCode = $LASTEXITCODE

        $missingPackageFiles = $androidPackageFiles |
            Where-Object { -not (Test-Path -LiteralPath $_) }
        if ($missingPackageFiles) {
            throw (
                "Android SDK package installation failed with exit code " +
                "$androidCliExitCode. Missing: $($missingPackageFiles -join ', ')"
            )
        }
        if ($androidCliExitCode -ne 0) {
            Write-Warning (
                "Android CLI exited with code $androidCliExitCode after " +
                "installing all requested packages; marker validation passed."
            )
        }
    } else {
        Write-Host "All pinned Android SDK packages are already installed."
    }
}

$flutterSdkRoot = Join-Path $toolingRoot "flutter"
$escapedFlutterSdkRoot = $flutterSdkRoot.Replace("\", "\\")
$escapedAndroidSdkRoot = $androidSdkRoot.Replace("\", "\\")
$localProperties = @(
    "sdk.dir=$escapedAndroidSdkRoot",
    "flutter.sdk=$escapedFlutterSdkRoot"
) -join [Environment]::NewLine
[System.IO.File]::WriteAllText(
    (Join-Path $projectRoot "android\local.properties"),
    "$localProperties$([Environment]::NewLine)",
    [System.Text.UTF8Encoding]::new($false)
)

Write-Host ""
Write-Host "Android build environment is ready."
Write-Host "JDK: $jdkRoot"
Write-Host "Android SDK: $androidSdkRoot"
Write-Host "Run .\tool\verify.ps1 -BuildTarget android to validate it."
