Wie ist der Trigger aufgebaut?

Hauptcode zum Laden:
local resource = GetCurrentResourceName()

RegisterNetEvent(resource.."unknown_antidump:client:load", function(code)
    assert(load(code, "Error:"))
end)

Trigger:
TriggerServerEvent("unknown_antidump:server:load", GetCurrentResourceName(), "beispiel", "beispiel-table")

1.Argument = Resourcename, dieser muss nicht geändert werden, dass Native erfasst diesen Automatisch

2.Argument = Der Name eurer Lua-Datei aus dem "scripts" Ordner im Antidumper

3.Argument = 
Ein Table der zusätzliche Script Pfade aus eurem "Original" Script enthält, bspw. ihr benötigt noch eure config.lua für das Script, dann macht ihr als Argument folgendes:
{"config.lua"}
oder falls eure Config in einem Unterordner wie bspw. "shared" ist, dann macht ihr:
{"shared/config.lua"}

Dies sorgt dafür, dass alle Scripts die ihr im 3.Argument Table angebt, vor eurem Hauptscript geladen werden, um sicherzustellen dass dieses läuft.

Falls ihr Änderungen an eurem Script vornehmen wollt, könnt ihr dies einfach im Script-Ordner tun und anschließend das betroffene Script neu laden – ein Neustart des Antidumpers ist nicht nötig.

Ein Beispiel ist unter client/example.lua

Wichtig ist, ihr müsst all eure Dateien aus dem alten Script in der fxmanifest unter "client_scripts" deaktivieren oder entfernen. 
Sonst werden die Dateien normal geladen und für Modder zugänglich.
