local resource = GetCurrentResourceName()

RegisterNetEvent(resource.."unknown_antidump:client:load", function(code)
    local cd,err = assert(load(code,"Scripterror erkannt: "))() 
end)

Wait(100)

TriggerServerEvent("unknown_antidump:server:load", resource, "test", {})