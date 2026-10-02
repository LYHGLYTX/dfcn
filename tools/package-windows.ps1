#requires -Version 5.1
[CmdletBinding()]
param()

# Package existing runtime files. Paths are relative to this script, never to
# the caller's working directory. This entry does not build or deploy code.
$ErrorActionPreference = 'Stop'
$projectRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$gameRoot = [IO.Directory]::GetParent($projectRoot).FullName
$imageConfigPath = Join-Path $projectRoot 'data\runtime\native-pe-images.json'
if ([IO.File]::Exists($imageConfigPath)) {
    $imageConfig = [IO.File]::ReadAllText($imageConfigPath) | ConvertFrom-Json
    $referenceImagePath = [string]$imageConfig.reference
    if (-not [IO.Path]::IsPathRooted($referenceImagePath)) {
        $referenceImagePath = [IO.Path]::Combine($projectRoot, $referenceImagePath)
    }
    $gameRoot = [IO.Path]::GetDirectoryName([IO.Path]::GetFullPath($referenceImagePath))
}
$outputPath = Join-Path $projectRoot 'DFCN-Windows-x64-minimal.zip'
$stagingPath = Join-Path $projectRoot ('DFCN-Windows-x64-minimal.' + [Guid]::NewGuid().ToString('N') + '.tmp')
$archive = $null
$archiveStream = $null
$entryCount = 0

function Add-RuntimeFile([string] $source, [string] $entryName) {
    [void][IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
        $script:archive, $source, $entryName.Replace('\', '/'),
        [IO.Compression.CompressionLevel]::Optimal)
    $script:entryCount++
}

function Add-RuntimeText([string] $entryName, [string] $content) {
    $entry = $script:archive.CreateEntry($entryName, [IO.Compression.CompressionLevel]::Optimal)
    $stream = $entry.Open()
    try {
        $bytes = [Text.UTF8Encoding]::new($false).GetBytes($content)
        $stream.Write($bytes, 0, $bytes.Length)
    } finally {
        $stream.Dispose()
    }
    $script:entryCount++
}

try {
    Add-Type -AssemblyName System.IO.Compression
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    Write-Host 'Packaging the existing Windows translation runtime...'
    $archiveStream = [IO.File]::Open($stagingPath, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
    $archive = [IO.Compression.ZipArchive]::new($archiveStream, [IO.Compression.ZipArchiveMode]::Create, $true)

    Add-RuntimeFile (Join-Path $gameRoot 'dfhooks.dll') 'dfhooks.dll'
    # Exactly one loader path; no second root-level copy of dfhooks_dfcn.dll.
    Add-RuntimeText 'dfhooks_dfcn.ini' "dfcn/dfhooks_dfcn.dll`n"
    Add-RuntimeFile (Join-Path $projectRoot 'LICENSE') 'dfcn/LICENSE'
    foreach ($name in @(
        'dfcn_core.dll', 'dfhooks_dfcn.dll', 'data/runtime/config.ini',
        'data/runtime/translations.tsv', 'data/runtime/name-editor.tsv',
        'data/runtime/instrument-translations.tsv', 'data/runtime/procedural-terms.tsv',
        'data/runtime/procedural-word-senses.tsv', 'data/runtime/adventure-target-translations.tsv'
    )) {
        Add-RuntimeFile (Join-Path $projectRoot $name) ('dfcn/' + $name)
    }

    $rulesRoot = Join-Path $projectRoot 'data\runtime\rulesets\zh-Hans'
    # The complete TOML tree is loaded recursively by the runtime.
    foreach ($file in ([IO.Directory]::GetFiles($rulesRoot, '*.toml', [IO.SearchOption]::AllDirectories) | Sort-Object)) {
        $relative = $file.Substring($projectRoot.Length + 1).Replace('\', '/')
        Add-RuntimeFile $file ('dfcn/' + $relative)
    }
    # Use the same first bundled-font preference as the runtime, if present.
    foreach ($name in @('font.ttf', 'font.otf', 'font.ttc')) {
        $fontPath = Join-Path $projectRoot ('data\runtime\' + $name)
        if ([IO.File]::Exists($fontPath)) {
            Add-RuntimeFile $fontPath ('dfcn/data/runtime/' + $name)
            break
        }
    }

    # Collect local attribution and license texts into one runtime notice.
    # No old ZIP, separate game installation, network, or development tool is
    # needed to obtain these texts when the script is run again.
    $notices = [Text.StringBuilder]::new()
    [void]$notices.AppendLine('# Minimal runtime: third-party attribution and licenses')
    [void]$notices.AppendLine()
    [void]$notices.AppendLine('The referenced development sources are omitted from this runtime package. License texts and translator credits follow below.')
    [void]$notices.AppendLine()
    [void]$notices.AppendLine([IO.File]::ReadAllText((Join-Path $projectRoot 'THIRD_PARTY_NOTICES.md')))
    foreach ($relative in @(
        'data/upstream/licenses/dfi18n-data.LICENSE.md', 'data/upstream/licenses/dfzh-data.LICENSE.md',
        'third_party/dfzh-rules-engine.LICENSE', 'third_party/tomlplusplus/LICENSE',
        'third_party/dfhooks.LICENSE', 'data/upstream/licenses/ECDICT.LICENSE'
    )) {
        [void]$notices.AppendLine()
        [void]$notices.AppendLine('## ' + $relative)
        [void]$notices.AppendLine()
        [void]$notices.AppendLine([IO.File]::ReadAllText((Join-Path $projectRoot $relative)))
    }
    [void]$notices.AppendLine()
    [void]$notices.AppendLine('## data/upstream/objects.zh-Hans.po translator credits')
    [void]$notices.AppendLine()
    foreach ($line in [IO.File]::ReadLines((Join-Path $projectRoot 'data/upstream/objects.zh-Hans.po'))) {
        if (-not $line.StartsWith('#')) { break }
        [void]$notices.AppendLine($line)
    }
    Add-RuntimeText 'dfcn/THIRD_PARTY_NOTICES.md' $notices.ToString()

    $archive.Dispose()
    $archive = $null
    $archiveStream.Dispose()
    $archiveStream = $null
    # Publish only a fully written ZIP. A failed package leaves the old ZIP.
    if ([IO.File]::Exists($outputPath)) {
        [IO.File]::Replace($stagingPath, $outputPath, [NullString]::Value)
    } else {
        [IO.File]::Move($stagingPath, $outputPath)
    }
    $sizeMiB = [Math]::Round(([IO.FileInfo]::new($outputPath)).Length / 1MB, 2)
    Write-Host "Created: $outputPath" -ForegroundColor Green
    Write-Host "Files: $entryCount; size: $sizeMiB MiB"
    Write-Host 'Extract the ZIP into the game folder containing Dwarf Fortress.exe.'
} catch {
    [Console]::Error.WriteLine('Packaging failed: ' + $_.Exception.Message)
    exit 1
} finally {
    if ($null -ne $archive) { $archive.Dispose() }
    if ($null -ne $archiveStream) { $archiveStream.Dispose() }
    if ([IO.File]::Exists($stagingPath)) {
        try { [IO.File]::Delete($stagingPath) }
        catch { [Console]::Error.WriteLine('Could not remove temporary package: ' + $stagingPath + ': ' + $_.Exception.Message) }
    }
}
exit 0
