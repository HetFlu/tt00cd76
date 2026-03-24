param(
    [Parameter(Mandatory = $true)]
    [string]$filename   # CSV-tiedoston polku
)

# Tarkistaa että tiedosto on olemassa
if (!(Test-Path $filename)) {
    Write-Host "Virhe: Tiedostoa ei löydy!" -ForegroundColor Red
    exit
}

# Lukee CSV
$users = Get-Content $filename
$count = 0

foreach ($line in $users) {

    # Erottaa suku ja etunimi
    $parts = $line.Split(" ")
    $firstname = $parts[0]
    $lastname = $parts[1]

    # Luo tunnuksen: 4 merkkiä sukunimestä + 2 etunimestä
    $account = ($lastname.Substring(0,4) + $firstname.Substring(0,2)).ToLower()

    # TViesti
    Write-Host "Hello my colleague $firstname $lastname, this is your new account:" -ForegroundColor Yellow
    Write-Host $account -ForegroundColor Green

    $count++
}

Write-Host "$count new accounts created successfully" -ForegroundColor Cyan



