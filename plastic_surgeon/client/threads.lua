--[[ Plastic Surgeon client thread script ]]--

-- Main Thread
Citizen.CreateThread(function()
    while true do
        Wait(0)

        local dist = functions.getDistance() -- check player distance from surgeon

        if IsControlJustReleased(1, 0xB2F377E8) and not saved.getIsInMenu() and dist < config.interactDistance then -- if f pressed, and not in menu and within distance params
            if saved.getCanChangePed() then
                saved.setIsInMenu(true) -- set isInMenu to true for use in other places

                SendNUIMessage({ -- close all menus
                    type = 'close'
                })

                SendNUIMessage({ -- open selection screen
                    type = 'open'
                })
                SetNuiFocus(true, true) -- set focus to menu

            elseif not saved.getCanChangePed() then -- if we cannot change ped and dist is within interact distance
                functions.showCannotChangePed() -- show cannot change ped text
            end
        end
    end
end)