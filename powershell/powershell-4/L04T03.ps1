$filenames = @()

# Kysyy tiedostonimiä kunnes tyhjä
while ($true) {
    $name = Read-Host "Give a file name, press Enter to quit"
    if ($name -eq "") { break } 
    $filenames += $name 
}

if ($filenames.Count -eq 0) {
    Write-Host "No file names given. Nothing done."
    exit
}

# Päivämäärä + aika muodossa: Päivä.Kuukausi.Vuosi Tunti.Min
$timestamp = (Get-Date).ToString("d.M.yyyy H.mm")
Write-Host "Today is $timestamp"

# Luo tiedostot kotihakemistoon ja kirjoita päivämäärä+aika niihin
foreach ($file in $filenames) {
    $path = Join-Path $HOME $file
    $timestamp | Out-File -FilePath $path -Encoding UTF8
}

Write-Host "$($filenames.Count) files were created successfully."