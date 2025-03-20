local securitykey = math.random(111111,999999)
local resource = GetCurrentResourceName()
local codeloaded = false

RegisterNetEvent(resource.."unknown_antidump:client:load", function(files,key)
    if key ~= securitykey or codeloaded then
        print("Netter Versuch!")
        return
    end

    --Load Code--
    for k, v in ipairs(files) do
        local success, err = load(v.code, v.file, "bt") 
        if not success then
            -- Fehler Handling
            local cleanError = string.match(err, ":%d+:%s*(.*)") or err
            local lineNumber = string.match(err, ":(%d+):") or "?"
            print("^1Error^0 [Script: " ..v.file.. " | Zeile - " ..lineNumber.. "] " ..cleanError)
        else
            --Execute Code--
            pcall(success)
            -----------------
            print("Datei: ^3" .. v.file .. "^0 wurde ^2erfolgreich^0 geladen!") 
        end
    end
    ------------


    codeloaded = true
end)

Wait(100)

TriggerServerEvent("unknown_antidump:server:load", resource, securitykey, {"client/test.lua"})
