param(
    [string]$foldername 
)

if (-not $foldername) {
    Write-Host "Anna kansio parametrina. Esim:"
    Write-Host ".\L04T04.ps1 'C:\Users\hetaf\Documents'"
    exit
}

# Tarkistaa onko kansio olemassa
if (-not (Test-Path $foldername)) {
    Write-Host "Sorry, '$foldername' does not exist."
    exit
}

$files = Get-ChildItem -Path $foldername -File | Select-Object -ExpandProperty Name

$outputFile = Join-Path $HOME "files.txt"

"Name" | Out-File -FilePath $outputFile -Encoding UTF8
$files | Out-File -FilePath $outputFile -Append -Encoding UTF8

# Ilmoittaa kuinka monta tiedostoa
Write-Host "$($files.Count) filenames were written to file $outputFile"