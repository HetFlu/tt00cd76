param(
    [Parameter(Mandatory=$true)]
    [string]$word1,

    [Parameter(Mandatory=$true)]
    [string]$word2,

    [Parameter(Mandatory=$true)]
    [string]$word3
)

Write-Host "Parameters are: $word1 $word2 $word3"

$words = @($word1, $word2, $word3)

$ordered = $words | Sort-Object { $_.Length }

Write-Host "Your ordered words are: $($ordered -join ' ')"