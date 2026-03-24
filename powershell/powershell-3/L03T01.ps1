param(
    [Parameter(Mandatory = $true)]
    [string]$foldername
)

if (Test-Path $foldername) {
    $files = Get-ChildItem -Path $foldername
    $count = $files.Count

    Write-Host "$count files in the folder $foldername"
    Write-Host ""
    $files | Select-Object Name
}
else {
    Write-Host "Sorry, $foldername does not exist."
}
