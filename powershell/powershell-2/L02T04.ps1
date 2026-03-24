param(
    [string]$name = "unknown",
    [int]$hellos = 1
)

for ($i = 1; $i -le $hellos; $i++) {
    Write-Host "Hello $name"
}