$names = @(
    "Juhani"
    "Tuomas"
    "Aapo"
    "Simeoni"
    "Timo"
    "Lauri"
    "Eero"
)

Write-Host "There are $($names.Count) brothers:"
foreach ($n in $names) {
    Write-Host $n
}

$first = $names[0]
$last  = $names[-1]

Write-Host "The oldest is $first and the youngest is $last"