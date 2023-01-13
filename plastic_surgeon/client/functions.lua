--[[ plastic surgeon client functions ]]--

functions = functions or {}

-- function that changed the ped of the player to given ped
function functions.changePed(args)
    SendNUIMessage({ -- close ui on initiation
        type = 'close'
    })
    SetNuiFocus(false, false) -- disable focus, as a fail safe

    if saved.getCanChangePed() then
        local hash = GetHashKey(args[1]) -- get ped hash

        model = RequestModel(hash) -- request model

        if IsModelValid(model) then -- check validity of given model
            while not HasModelLoaded(model) do -- wait until model is loaded
                Wait(100)
            end

            if HasModelLoaded(hash) then -- if model is loaded, set player model and make sure player is not invisible
                DoScreenFadeOut(1000)
                Wait(1000)

                SetPlayerModel(PlayerId(), model, true)
                SetPlayerInvisibleLocally(PlayerId(), true)

                Wait(config.changePedWaitTime)

                DoScreenFadeIn(1000)

                Wait(1000)

                saved.setIsInMenu(false) -- set isInMenu to false for use in other places
            end
        end

        if not IsModelValid(model) then -- notify if not valid (client-sided)
            print('invalid model!')
        end
        
        functions.resetPedChangeTimer() -- reset ped changing timer
        
    elseif not saved.getCanChangePed() then
    end
end 

-- fade in of screen text showing cannot change skin
function functions.showCannotChangePed()
    SendNUIMessage({
        type = 'cannotChangePed'
    })

    Wait(3000)

    SendNUIMessage({
        type = 'close'
    })
    saved.setIsInMenu(false) -- set isInMenu to false for use in other places
end

-- Ped changing timer
function functions.resetPedChangeTimer()
    saved.setCanChangePed(false)
    
    Wait(config.timeBetweenModelChanges)
    
    saved.setCanChangePed(true)
end

-- grabs coordinates of player
function functions.getCoords()
    print(GetEntityCoords(PlayerPedId(), true, true) .. '\nHeading: ' .. GetEntityHeading(PlayerPedId()))
end 

-- spawns the surgeon client-sided
function functions.spawnSurgeon()
    local hash = GetHashKey('U_M_M_ValDoctor_01') -- get model hash
    local spawnLoc = config.surgeonLocation -- get spawn location from config

    model = RequestModel(hash) -- request model

    if IsModelValid(model) then -- check model validity

        while not HasModelLoaded(model) do -- check if model has loaded
            Wait(100)
        end

        if HasModelLoaded(hash) then -- if model has loaded...
            local ped = CreatePed(hash, spawnLoc.x, spawnLoc.y, spawnLoc.z, spawnLoc.heading, true, false, false, false) -- create ped

            Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- loads ped visibility
            
            -- freeze entity and set not forgettable, damageable, and does not flee.
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetEntityCanBeDamaged(ped, false)
            SetPedCanBeTargetted(ped, false)
            SetPedCanRagdoll(ped, false)
            SetPedCombatAttributes(ped, 58, false)
            SetPedCombatAttributes(ped, 17, false)
            
            -- set the saved variables to that of the ped for later use
            saved.setSurgeonPed(ped)
        end
    end
end 

-- get the distance of the player to the surgeon
function functions.getDistance()
    local surgeonPos = GetEntityCoords(saved.getSurgeonPed()) -- get surgeon position
    local playerPos = GetEntityCoords(PlayerPedId()) -- get player position
    local dist = #(playerPos - surgeonPos) -- get distance between the two

    if dist < config.interactDistance and not saved.getIsInMenu() then -- if distance is closer than 1.5 and saved variable is not in menu, show prompt
        SendNUIMessage({
            type = 'prompt'
        })
    elseif not saved.getIsInMenu() then -- else and not in menu, close all NUI objects
        SendNUIMessage({
            type = 'close'
        })
        SetNuiFocus(false, false) -- disable focus, as a fail safe
    end
    
    return dist
end 