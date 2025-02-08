Wie ist der Trigger aufgebaut?

Mainpart zum Laden:
local resource = GetCurrentResourceName()

RegisterNetEvent(resource.."unknown_antidump:client:load", function(code)
    local cd,err = assert(load(code,"Scripterror erkannt: "))() 
end)

Trigger:
TriggerServerEvent("unknown_antidump:server:load", GetCurrentResourceName(), "beispiel", "beispiel-table")

1.Argument = Resourcename, dieser muss nicht geändert werden, dass Native erfasst diesen Automatisch

2.Argument = Den Namen eurer lua Datei aus dem "scripts" Ordner im Antidumper

3.Argument = 
Ein Table der zusätzliche Script Pfade aus eurem "Original" Script enthält, bspw. ihr benötigt noch eure config.lua für das Script, dann macht ihr als Argument folgendes:
{"config.lua"}
oder falls eure Config in einem Unterordner wie bspw. "shared" ist, dann macht ihr:
{"shared/config.lua"}

Dies sorgt dafür, dass alle Scripts die ihr im 3.Argument Table angebt, vor eurem Hauptscript geladen werden, um sicherzustellen dass dieses läuft.

Solltet ihr in eurem Script etwas ändern wollen, könnt ihr dies einfach im Script Ordner tun und dann das entsprechende Script neu laden, nicht den Antidumper neustarten!

Ein Beispiel ist unter client/example.lua

Wichtig ist, ihr müsst all eure Datein aus dem alten Script in der fxmanifest unter "client_scripts" deaktivieren oder entfernen. 
Sonst werden die Dateien normal geladen und für Modder zugänglich.