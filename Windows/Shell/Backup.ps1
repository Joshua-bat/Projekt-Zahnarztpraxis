# ===== Einstellungen (hier anpassen) =====
$quelle  = 'C:\Users\Joshua\Documents\ZAW'
$zielDir = '\\192.168.179.36\Backup'
$pwDatei = 'C:\Shell\zip-pw.txt'

# ===== 7-Zip suchen =====
$sevenZip = @(
    "$env:ProgramFiles\7-Zip\7z.exe",
    "${env:ProgramFiles(x86)}\7-Zip\7z.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $sevenZip) { Write-Host 'FEHLER: 7-Zip nicht gefunden. Bitte installieren.'; exit 1 }
if (-not (Test-Path $quelle)) { Write-Host "FEHLER: Quelle nicht gefunden: $quelle"; exit 1 }
if (-not (Test-Path $pwDatei)) { Write-Host 'FEHLER: Passwortdatei fehlt. Schritt 1 wiederholen.'; exit 1 }
if (-not (Test-Path $zielDir)) { Write-Host "FEHLER: Ziel nicht erreichbar: $zielDir"; exit 1 }

# ===== Passwort einlesen =====
$sec = Get-Content $pwDatei | ConvertTo-SecureString
$pw  = [System.Net.NetworkCredential]::new('', $sec).Password

# ===== ZIP lokal erstellen =====
$datum   = Get-Date -Format 'yyyy-MM-dd'
$tempZip = Join-Path $env:TEMP "$datum.zip"
if (Test-Path $tempZip) { Remove-Item $tempZip }

& $sevenZip a -tzip -mem=AES256 "-p$pw" -y $tempZip "$quelle\*"
if ($LASTEXITCODE -ne 0) { Write-Host "FEHLER: 7-Zip Code $LASTEXITCODE"; exit 1 }

# ===== Aufs Netzlaufwerk kopieren =====
try {
    Copy-Item $tempZip (Join-Path $zielDir "$datum.zip") -Force -ErrorAction Stop
    Write-Host "Backup gespeichert: $zielDir\$datum.zip"
}
catch { Write-Host "FEHLER beim Kopieren: $_"; exit 1 }
finally { Remove-Item $tempZip -ErrorAction SilentlyContinue }