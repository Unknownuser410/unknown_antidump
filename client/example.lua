local resource = GetCurrentResourceName()

RegisterNetEvent(resource.."unknown_antidump:client:load", function(code)
    assert(load(code, "Error:"))()
end)

Wait(100)

TriggerServerEvent("unknown_antidump:server:load", resource, "test", {})
