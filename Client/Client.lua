if GetResourceState("es_extended") == "started" then
    local ESX = exports["es_extended"]:getSharedObject()
    Citizen.CreateThread(function ()
        while true do          
            local playerPed = PlayerPedId()
            local veh = GetVehiclePedIsIn(playerPed)  
                if veh ~= 0 then 
                    DisplayRadar(true)
                    SendNUIMessage({
                        open = 'car',
                        armour = GetPedArmour(playerPed),
                        health = GetEntityHealth(playerPed) - 100,
                        food = food,
                        thirst = agua,
                        voice = NetworkIsPlayerTalking(PlayerId()),
                        stress = stress,
                    })
                else
                    DisplayRadar(false)
                    SendNUIMessage({
                        open = true,
                        armour = GetPedArmour(playerPed),
                        health = GetEntityHealth(playerPed) - 100,
                        food = food,
                        thirst = agua,
                        voice = NetworkIsPlayerTalking(PlayerId()),
                        stress = stress,
                    })
                end
            Citizen.Wait(500)
        end
    end)


    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(Config.StatusUpdateInterval)
                GetStatus(
                        function(data)
                        food = data[1]
                        agua = data[2]
                        stress = data[3]
                end)
            end
    end)

elseif GetResourceState("qb-core") == "started" then 

    QBCore = exports["qb-core"]:GetCoreObject()

    RegisterNetEvent('hud:client:UpdateNeeds') -- Triggered in qb-core
    AddEventHandler('hud:client:UpdateNeeds', function(newHunger, newThirst)
        hunger = newHunger
        thirst = newThirst
    end)
    Citizen.CreateThread(function ()
        while true do
            local playerPed = PlayerPedId()
            local veh = GetVehiclePedIsIn(playerPed)  
                if veh ~= 0 then 
                    DisplayRadar(true)
                    SendNUIMessage({
                        open = 'car',
                        armour = GetPedArmour(playerPed),
                        health = GetEntityHealth(playerPed) - 100,
                        food = hunger,
                        thirst = thirst,
                        voice = NetworkIsPlayerTalking(PlayerId()),
                        stress = 10,
                    })
                else
                    DisplayRadar(false)
                    SendNUIMessage({
                        open = true,
                        armour = GetPedArmour(playerPed),
                        health = GetEntityHealth(playerPed) - 100,
                        food = hunger,
                        thirst = thirst,
                        voice = NetworkIsPlayerTalking(PlayerId()),
                        stress = 10,
                    })
                end
            Citizen.Wait(500)
        end
    end)

else
    print('The server owners has another name in his core, use real core like es_extended or qb-core.')
end
