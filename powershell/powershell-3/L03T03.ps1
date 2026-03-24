param(
    [Parameter(Mandatory = $true)]
    [string]$foldername,

    [Parameter(Mandatory = $true)]
    [string]$filename
)

if (!(Test-Path -Path $foldername -PathType Container)) {
    Write-Host "Sorry, $foldername does not exist."
    exit
}

$filePath = Join-Path $foldername $filename

if (Test-Path -Path $filePath -PathType Leaf) {
    Write-Host "The file '$filename' already exists in folder '$foldername'."
}
else {
    $response = Read-Host "Create the file $filename? Yes/No"

    if ($response -eq "Yes") {
        New-Item -Path $filePath -ItemType File | Out-Null
        Write-Host "The file '$filename' has been created in '$foldername'."
    }
    else {
        Write-Host "No file created."
    }
}