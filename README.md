# IT-Infrastruktur mit cloudbasiertem 3-2-1-Backup für eine Zahnarztpraxis

![Status](https://img.shields.io/badge/status-in%20Bearbeitung-C46A2E)
![Umgebung](https://img.shields.io/badge/umgebung-virtuelle%20Testumgebung-0B6E4F)

Aufbau einer neuen IT-Infrastruktur (Windows Server, Active Directory, Dateifreigaben) inklusive einer redundanten, verschlüsselten **3-2-1-Backup-Strategie** für besonders schutzwürdige Patientendaten.

## Inhalt

- [Ausgangslage & Auftrag](#ausgangslage--auftrag)
- [Ziele](#ziele)

## Configuration
- [Linux](https://github.com/Joshua-bat/Projektarbeit/tree/8d0fa4235ff2e63f6fab9030e35c1883ffa2a9d6/Linux)
- [Docker](https://github.com/Joshua-bat/Projektarbeit/tree/8d0fa4235ff2e63f6fab9030e35c1883ffa2a9d6/Docker)
- [Windows](https://github.com/Joshua-bat/Projektarbeit/tree/e6b3d42ca9ea1e6fa8d31da2c570cc0d233e0f79/Windows%20)
- [Firewall](https://github.com/Joshua-bat/Projektarbeit/tree/8d0fa4235ff2e63f6fab9030e35c1883ffa2a9d6/Firewall)
- [Nextcloud](https://github.com/Joshua-bat/Projektarbeit/tree/8d0fa4235ff2e63f6fab9030e35c1883ffa2a9d6/Nextcloud)
  
## Ausgangslage & Auftrag

Der Kunde eröffnet eine neue Zahnarztpraxis mit mehreren Behandlungszimmern. Es existiert aktuell **keine eigene IT-Infrastruktur**: kein zentraler Server, keine strukturierte Benutzer- und Rechteverwaltung, keine zentrale Dateiablage und kein Datensicherungskonzept.

Da die Praxis von Beginn an mit besonders schutzwürdigen Patientendaten arbeitet, besteht der Auftrag darin, eine vollständige IT-Infrastruktur neu aufzubauen und direkt mit einer zuverlässigen, revisionssicheren und DSGVO-konformen Datensicherung nach dem **3-2-1-Prinzip** zu versehen.

## Ziele

- **3 Kopien** der Daten — Produktivdaten plus zwei Backups
- **2 unterschiedliche Speicherorte** — lokales NAS am Praxisstandort und ein externer Server
- **1 externe Kopie** — schützt auch bei Brand, Diebstahl oder Totalausfall vor Ort
- Automatisierte Sicherung: **täglich inkrementell**, **wöchentlich voll**
- Verschlüsselung **in transit und at rest** gemäß Art. 9 DSGVO (Gesundheitsdaten)
- Nachweis der Wiederherstellbarkeit durch einen dokumentierten **Restore-Test**
