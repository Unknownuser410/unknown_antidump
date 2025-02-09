local resource = GetCurrentResourceName()

RegisterNetEvent(resource.."unknown_antidump:client:load", function(code)
    local func, err = load(code)
    if func then
        func() -- Führt den geladenen Code aus
    else
        print("Fehler beim Laden des Codes:", err)
    end
end)

Wait(100)

TriggerServerEvent("unknown_antidump:server:load", resource, "test", {})
