param(
    [Parameter(Mandatory = $true)]
    [string]$filename    # Mihin CSV kirjoitetaan
)

function Add-MyEvent {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("Error", "Warning", "Information")]
        [string]$Type,      # Lokityyppi
        [Parameter(Mandatory = $true)]
        [string]$Message    # viesti
    )

    # Lähde ja loki
    $source = "MyPowerShell"
    $log = "Application"

    if (-not [System.Diagnostics.EventLog]::SourceExists($source)) {
        New-EventLog -LogName $log -Source $source
    }

    $eventId = switch ($Type) {
        "Information" { 1000 }
        "Warning"     { 1001 }
        "Error"       { 1002 }
    }

    Write-EventLog -LogName $log -Source $source -EntryType $Type -EventId $eventId -Message $Message
}

try {

    $users = Get-LocalUser | Select-Object Name, FullName, SID, LastLogon

    $users | Export-Csv -Path $filename -NoTypeInformation -Delimiter ";"

    # Ilmoitus ruudulle + lokiin (Information)
    Write-Host "Local user information written to $filename successfully." -ForegroundColor Green
    Add-MyEvent -Type Information -Message "CSV created successfully: $filename"

}
catch {
    # Virhe ruudulle + lokiin (Error)
    Write-Host "Virhe kirjoitettaessa CSV-tiedostoon: $($_.Exception.Message)" -ForegroundColor Red
    Add-MyEvent -Type Error -Message "CSV creation FAILED: $filename - $($_.Exception.Message)"
}