--[[ Plastic Surgeon Config file ]]--

config = config or {}

-- Surgeon Spawn Location
config.surgeonLocation = {
    x = -289.4532,
    y = 811.5123,
    z = 118.3859,
    heading = 229.44378662109
}

-- models to use
config.selection1 = 'A_M_M_ARMTOWNFOLK_01'
config.selection2 = 'A_M_M_ASBBOATCREW_01'
config.selection3 = 'A_M_M_asbminer_04'
config.selection4 = 'A_M_M_BiVFancyTravellers_01'

-- time to wait when selecting new model
config.changePedWaitTime = 5000

-- time until next change available
config.timeBetweenModelChanges = 600000 -- 10 minutes default

-- distance to interact with surgeon
config.interactDistance = 1.5