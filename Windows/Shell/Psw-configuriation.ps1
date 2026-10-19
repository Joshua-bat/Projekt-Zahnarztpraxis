mkdir C:\Skripte -ErrorAction SilentlyContinue
cmdkey /add:server /user:BENUTZER /pass:PASSWORT
Read-Host "ZIP-Passwort" -AsSecureString | ConvertFrom-SecureString | Set-Content C:\Shell\zip-pw.txt