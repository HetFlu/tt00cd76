param(
    [Parameter(Mandatory = $true)]
    [string]$foldername,

    [Parameter(Mandatory = $true)]
    [string]$filename
)

if (Test-Path -Path $foldername -PathType Container) {

    $filePath = Join-Path $foldername $filename

    if (Test-Path -Path $filePath -PathType Leaf) {
        Write-Host "The file '$filename' exists in the folder '$foldername'."
    }
    else {
        Write-Host "Sorry, $filename in the $foldername does not exist."
    }
}
else {
    Write-Host "Sorry, $foldername does not exist."
}