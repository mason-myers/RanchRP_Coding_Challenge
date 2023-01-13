--[[ Client sided commands for plastic surgeon script ]]--

-- Command to test functionality of ped swapping with inputs
RegisterCommand('surgeon', function(source, args, rawCommand)
    functions.changePed(args)
end, false)

-- simple coordinate grabber in order to set ped in a certain location
RegisterCommand('coords', function()
    functions.getCoords()
end)