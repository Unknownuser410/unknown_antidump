local loadedplayers = {}

--Mainpart--
local function loadcode(resource,path)
    local success = LoadResourceFile(resource, path)

    if not success then
        print("Datei: " ..path.. " konnte nicht geladen werden!")
        return ""
    end
    
    return success
end

RegisterNetEvent("unknown_antidump:server:load", function(resource, securitykey, script, extras)
    if loadedplayers[source] and loadedplayers[source][resource] then --Check if Player has Script already loaded
        DropPlayer(source, "Tried to dump Script") -- Ban/Kick Part
    else
        --Insert Player to loaded Table--
        if not loadedplayers[source] then
            loadedplayers[source] = {}
        end
        loadedplayers[source][resource] = true
        ---------------------------------

        local code = ""

        --Load Dependencies--
        for i = 1, #extras do
            code = code.." "..loadcode(resource, extras[i])
        end
        ----------------

        --Load actual Code--
        code = code.." "..loadcode(GetCurrentResourceName(), "scripts/"..script..".lua")
        -----------------------

        --Send to Client--
        TriggerClientEvent(resource.."unknown_antidump:client:load", source, code, securitykey)
        -------------------
    end
end)
----------------


--Resource Debug--
AddEventHandler('onResourceStop', function(resourceName)
    for k, v in pairs(loadedplayers) do
        if loadedplayers[k][resourceName] then
            loadedplayers[k][resourceName] = false
            --print("Resource: " ..resourceName.. " wurde für ID: " ..k.. " entladen!")
        end
    end
end)
