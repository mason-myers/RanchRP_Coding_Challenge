--[[ Nui callbacks for plastic surgeon ]]--

-- nui callbacks for each of the 4 buttons
RegisterNUICallback('selection1', function(data)
    local args = {config.selection1}
    functions.changePed(args)
end)
RegisterNUICallback('selection2', function(data)
    local args = {config.selection2}
    functions.changePed(args)
end)
RegisterNUICallback('selection3', function(data)
    local args = {config.selection3}
    functions.changePed(args)
end)
RegisterNUICallback('selection4', function(data)
    local args = {config.selection4}
    functions.changePed(args)
end)