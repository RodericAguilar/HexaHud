Config = Config or {}

Config.Language = 'EN' -- Just ES or EN is for server print.
Config.StatusUpdateInterval = 1000 -- Time it takes for status to update (lowering this value adds ms)

function GetStatus(cb)

TriggerEvent("esx_status:getStatus", "hunger", function(h)
TriggerEvent("esx_status:getStatus", "thirst", function(t)
    local hunger = h.getPercent()
    local thirst = t.getPercent()
    local stress = 30     
    cb({hunger, thirst, stress})    
end) 
end)

end
