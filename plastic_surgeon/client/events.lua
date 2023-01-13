--[[ client events handlers ]]--

-- called when player loads resource and spawns surgeon
AddEventHandler('onClientResourceStart' , function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    functions.spawnSurgeon()
end)

-- called when player client stops the resource. Deletes surgeon so there is not duplicates
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    DeletePed(saved.getSurgeonPed())
end)