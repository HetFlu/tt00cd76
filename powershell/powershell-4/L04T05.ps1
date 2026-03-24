param(
    [string]$foldername 
)

# Tarkistaa että hakemisto annettiin
if (-not $foldername) {
    Write-Host "Anna hakemisto parametrina. Esim:"
    Write-Host ".\L04T05.ps1 'C:\Users\hetaf'"
    exit
}

# Tarkistaa että hakemisto on olemassa
if (-not (Test-Path $foldername)) {
    Write-Host "Sorry, '$foldername' does not exist."
    exit
}

$files = Get-ChildItem -Path $foldername -File

$groups = $files | Group-Object Extension

$output = Join-Path $HOME "summary.txt"

"Summary of files in directory: $foldername" | Out-File $output -Encoding UTF8
"" | Out-File $output -Append -Encoding UTF8

foreach ($g in $groups) {
    $line = "Extension: $($g.Name), Count: $($g.Count)"
    Write-Host $line
    $line | Out-File $output -Append -Encoding UTF8
}

Write-Host ""
Write-Host "The result has been written to summary.txt"