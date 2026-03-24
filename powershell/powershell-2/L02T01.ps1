$numbers = 0..256 | Get-Random -Count 10

Write-Host "Here are ten random numbers in the original order:"
Write-Host ($numbers -join ", ")

$sorted = $numbers | Sort-Object

Write-Host "`The numbers in ascending order:"
Write-Host ($sorted -join ", ")