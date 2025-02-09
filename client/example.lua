local securitykey = math.random(111111,999999)
local resource = GetCurrentResourceName()
local codeloaded = false

RegisterNetEvent(resource.."unknown_antidump:client:load", function(code,key)
    if key ~= securitykey or codeloaded then
        print("Netter Versuch!")
        return
    end
    assert(load(code, "Error:"))() --Load and execute Code
    codeloaded = true
end)

Wait(100)

TriggerServerEvent("unknown_antidump:server:load", resource, securitykey, "postal", {"config.lua", "locales.lua"})
