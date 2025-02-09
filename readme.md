# 📌 Wie funktioniert der Trigger?
- Um eure geschützten Skripte zu laden, nutzt ihr folgenden Trigger:
- TriggerServerEvent("unknown_antidump:server:load", resource, securitykey, "test", {})

# 🛠️ Parameter-Erklärung:

- 1️⃣ Resourcename (resource)
- Muss nicht geändert werden – das Native erkennt den Namen automatisch.

- 2️⃣ Sicherheitskey (securitykey)
- Erhöht die Sicherheit und verhindert, dass Cheater den Code ausführen.

- 3️⃣ Dateiname ("test")
- Der Name eurer Lua-Datei im scripts-Ordner des Antidumpers.

- 4️⃣ Zusätzliche Dateien ({})
- Falls euer Skript weitere Dateien benötigt (z. B. eine config.lua), gebt ihr diese hier an.

# Beispiele:
- 📌 Diese Dateien werden vor eurem Hauptskript geladen, um sicherzustellen, dass es korrekt läuft.
- {"config.lua"} → Lädt config.lua aus dem Hauptverzeichnis.
- {"shared/config.lua"} → Lädt config.lua aus dem Unterordner shared.

# 🔄 Änderungen an eurem Skript
## Falls ihr Änderungen an euren Skripten vornehmen wollt:
- ✅ Einfach die Datei im scripts-Ordner anpassen.
- ✅ Danach das betroffene Skript neu laden.
- ❌ Kein Neustart des Antidumpers erforderlich!
- 👉 Ein Beispiel-Skript findet ihr unter client/example.lua.

# ⚠️ WICHTIG: FXManifest anpassen!
- Vergesst nicht, in der fxmanifest.lua eure alten Dateien unter "client_scripts" zu deaktivieren oder zu entfernen!
- 🚨 Sonst werden sie weiterhin normal geladen und sind für Modder sichtbar.
