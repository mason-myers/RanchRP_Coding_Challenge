saved = saved or {}

--[[ variables to use across client script, these would normally be within a flat file or DB to keep over server/client restarts ]]--

-- variables to share/save
local surgeonPed = null
local isInMenu = false
local canChangePed = true

-- get/set surgeon ped variable
function saved.setSurgeonPed(ped)
    surgeonPed = ped
end
function saved.getSurgeonPed()
    return surgeonPed
end

-- get/set isInMenu variable
function saved.setIsInMenu(value)
    isInMenu = value
end
function saved.getIsInMenu()
    return isInMenu
end 

-- get/set canChangePed variable
function saved.setCanChangePed(value)
    canChangePed = value
end
function saved.getCanChangePed()
    return canChangePed
end 