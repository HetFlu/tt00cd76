
param(
    [Parameter(Mandatory = $true)]
    [string]$filename,
    [switch]$NoPassword
)

# Tarkistetaan että tiedosto on olemassa
if (!(Test-Path $filename)) {
    Write-Host "Virhe: Tiedostoa ei löydy!" -ForegroundColor Red
    exit
}

$users = Get-Content $filename
$count = 0

foreach ($line in $users) {

    $parts = $line.Split(" ")
    $firstname = $parts[0]
    $lastname  = $parts[1]

    # Luo käyttäjätunnuksen
    $account = ($lastname.Substring(0,4) + $firstname.Substring(0,2)).ToLower()

    # Kysyy vahvistusta
    $answer = Read-Host "A new local account $account will be created for $firstname $lastname, [Yes]/No"

    # HYVÄKSYTÄÄN Y, y, yes, YES
    if ($answer -match "^(y|yes)$" -or $answer -eq "") {

        try {
            New-LocalUser -Name $account -NoPassword -Description "$firstname $lastname"

            Write-Host "$account True" -ForegroundColor Green
            $count++

        } catch {
            Write-Host "Virhe luotaessa käyttäjää $account : $_" -ForegroundColor Red
        }
    }
}

Write-Host "$count new accounts were created successfully" -ForegroundColor Cyan