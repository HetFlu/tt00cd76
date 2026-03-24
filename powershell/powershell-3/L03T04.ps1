param(
    [Parameter(Mandatory = $true)]
    [string]$foldername,

    [Parameter(Mandatory = $true)]
    [string]$newname
)

if (!(Test-Path -Path $foldername -PathType Container)) {
    Write-Host "Sorry, $foldername does not exist."
    exit 1
}

$files = Get-ChildItem -Path $foldername -File
$count = $files.Count

if ($count -eq 0) {
    Write-Host "There are no files in the folder '$foldername'. Nothing to rename."
    exit 0
}

$answer = Read-Host "All $count files will be renamed with name '$newname'. Yes/No"
if ($answer -ne "Yes") {
    Write-Host "Rename cancelled."
    exit 0
}

$index = 1
foreach ($f in $files) {
    $ext = $f.Extension
    $number = "{0:D2}" -f $index
    $targetName = "$newname" + "_" + "$number" + "$ext"
    $targetPath = Join-Path $foldername $targetName

    # Jos kohdenimi on jo olemassa, etsi seuraava vapaa numero
    while (Test-Path -Path $targetPath) {
        $index++
        $number = "{0:D2}" -f $index
        $targetName = "$newname" + "_" + "$number" + "$ext"
        $targetPath = Join-Path $foldername $targetName
    }

    Rename-Item -Path $f.FullName -NewName $targetName
    $index++
}

Write-Host "All files in '$foldername' have been renamed with base name '$newname'."