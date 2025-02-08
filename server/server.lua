local loadedplayers = {}

--Mainpart--
RegisterNetEvent("unknown_antidump:server:load", function(resource, script, extras)
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
            code = code.." "..LoadResourceFile(resource, extras[i])
        end
        ----------------

        --Load actual Code--
        code = code.." "..LoadResourceFile(GetCurrentResourceName(), "scripts/"..script..".lua")
        -----------------------

        --Send to Client--
        TriggerClientEvent(resource.."unknown_antidump:client:load", source, code)
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