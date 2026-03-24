param(
    [Parameter(Mandatory = $true)]
    [string]$fromfolder,

    [Parameter(Mandatory = $true)]
    [string]$tofolder
)

if (!(Test-Path -Path $fromfolder -PathType Container)) {
    Write-Host "Sorry, $fromfolder does not exist."
    exit 1
}

if (!(Test-Path -Path $tofolder -PathType Container)) {
    New-Item -Path $tofolder -ItemType Directory | Out-Null
    Write-Host "Created destination folder '$tofolder'."
}

$files = Get-ChildItem -Path $fromfolder -File
if ($files.Count -eq 0) {
    Write-Host "No files found in '$fromfolder'. Nothing to backup."
    exit 0
}

$copied = @()
foreach ($f in $files) {
    $destPath = Join-Path $tofolder $f.Name

    if (Test-Path -Path $destPath) {
        $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
        $ext  = [System.IO.Path]::GetExtension($f.Name)
        $n = 1
        do {
            $newName  = "$base-copy$n$ext"
            $destPath = Join-Path $tofolder $newName
            $n++
        } while (Test-Path -Path $destPath)
    }

    Copy-Item -Path $f.FullName -Destination $destPath
    $copied += [System.IO.Path]::GetFileName($destPath)
}

Write-Host "$($copied.Count) files have been backed up from '$fromfolder' to '$tofolder'."
Write-Host ""
Write-Host "Name"
Write-Host "----"
$copied | ForEach-Object { Write-Host $_ }