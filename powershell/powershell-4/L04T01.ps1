function Get-FileInfo {
    param(
        [string]$Extension
    )

    # Lisää piste jos puuttuu
    if ($Extension -notmatch '^\.') { 
        $Extension = ".$Extension" 
    }

    # Käyttäjän kotihakemisto
    $homePath = $HOME

    # Hakee tiedostot päätteellä
    $items = Get-ChildItem -Path $homePath -File -Filter "*$Extension"

    # Ei löytynyt mitään
    if (-not $items) {
        Write-Host "Ei tiedostoja, joiden pääte on $Extension"
        return
    }

    # Tulostaa vain tarvittavat sarakkeet
    $items |
        Select-Object Name, Length, LastWriteTime |
        Format-Table -AutoSize
}