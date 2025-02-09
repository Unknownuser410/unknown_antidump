local securitykey = math.random(111111,999999)
local resource = GetCurrentResourceName()

RegisterNetEvent(resource.."unknown_antidump:client:load", function(code,key)
    if key ~= securitykey then
        print("Netter Versuch!")
        return
    end
    assert(load(code, "Error:"))() --Load and execute Code
end)

Wait(100)

TriggerServerEvent("unknown_antidump:server:load", resource, securitykey, "postal", {"config.lua", "locales.lua"})
