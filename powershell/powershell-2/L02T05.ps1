param(
    [string]$ip = "192.168.1.1",
    [int]$count = 1
)

Write-Host "I will ping address $ip $count time, Okay? [y/n]: "
$answer = Read-Host

if ($answer -match '^[Yy]$') {
    for ($i = 1; $i -le $count; $i++) {
        Write-Host "try $i to ping: $ip"
        Start-Sleep -Milliseconds 400
    }
} else {
    Write-Host "Ping cancelled."
}