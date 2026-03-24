param(
    [Parameter(Mandatory = $true)]
    [string]$filename   # URL-osoitteita sisältävä tiedosto
)

# Tarkistaa että tiedosto on olemassa
if (!(Test-Path $filename)) {
    Write-Host "Virhe: Tiedostoa ei löydy!" -ForegroundColor Red
    exit
}

# Lukee kaikki URL:t
$urls = Get-Content $filename

foreach ($url in $urls) {
    # Avaa salaimessa
    Start-Process $url
    Write-Host "Opening: $url" -ForegroundColor Green
}

Write-Host "All URLs opened successfully" -ForegroundColor Cyan