param(
    [string]$filename   # tiedoston nimi
)

# Jos ei annettu tiedoston nimeä
if (-not $filename) {
    Write-Host "Anna tiedoston nimi parametrina: .\L04T02.ps1 temp.txt"
    exit
}

# Tyhjä lista työasemia varten
$workstations = @()

# Kysyy workstation-nimiä kunnes käyttäjä antaa tyhjän
while ($true) {
    $inputName = Read-Host "Give a workstation name, press Enter to quit"
    if ($inputName -eq "") { break }   # lopeta tyhjä syöte
    $workstations += $inputName        # lisää listaan
}

# Polku kotihakemistoon
$path = Join-Path $HOME $filename

# Kirjoittaa listan tiedostoon
$workstations | Out-File -FilePath $path

# Ilmoittaa onnistumisesta
Write-Host "$path created successfully"