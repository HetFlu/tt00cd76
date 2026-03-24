$name = Read-Host "Anna koko nimesi"

$letterCount = ($name -replace " ", "").Length

$parts = $name.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries)

$first = $parts[0]
$last  = $parts[-1]

Write-Host "Nimessäsi on yhteensä $letterCount kirjainta."
Write-Host "Etunimi : $first"
Write-Host "Sukunimi: $last"