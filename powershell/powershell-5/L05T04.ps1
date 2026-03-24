param(
    [Parameter(Mandatory = $true)]
    [string]$filename    # CSV-tiedoston nimi
)

# Hakee kaikki paikalliset käyttäjät
$users = Get-LocalUser | Select-Object Name, FullName, SID, LastLogon

# Tallentaa CSV-tiedostoon
try {
    $users | Export-Csv -Path $filename -NoTypeInformation -Delimiter ";" 
    Write-Host "Local user information written to $filename successfully." -ForegroundColor Green
}
catch {
    Write-Host "Virhe kirjoitettaessa CSV-tiedostoon: $_" -ForegroundColor Red
}