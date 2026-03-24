$int1 = Read-Host "Give the first integer"
$int2 = Read-Host "Give the second integer"

$int1 = [int]$int1
$int2 = [int]$int2

$sum = $int1 + $int2
$sub = $int1 - $int2
$mul = $int1 * $int2
$div = $int1 / $int2

Write-Host "Sum is $sum"
Write-Host "Subtraction is $sub"
Write-Host "Multiplication is $mul"
Write-Host "Division is $div"