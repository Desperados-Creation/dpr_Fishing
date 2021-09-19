ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do 
        local wait = 750
        for k in pairs(Config.FishingZone) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.FishingZone
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= Config.MarkerDistance then 
                wait = 0
                DrawMarker(Config.MarkerType, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)
                if dist <= 8.0 then 
                    wait = 0
                    Visual.Subtitle(Config.TextFishing)
                    if IsControlJustPressed(1, 51) then 
                        TriggerServerEvent('dpr_Fishing:startFishing')
                    end
                end
            end
        end
    Wait(wait)
    end
end)

RegisterNetEvent('dpr_Fishing:startFishing')
AddEventHandler('dpr_Fishing:startFishing', function()
    Citizen.Wait(500)
    local playerPed = GetPlayerPed(-1)
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_FISHING", 0, true)
end)

RegisterNetEvent('dpr_Fishing:stopFishing')
AddEventHandler('dpr_Fishing:stopFishing', function()
    local playerPed = GetPlayerPed(-1)
    ClearPedTasksImmediately(playerPed)
end)

-- Blips --
Citizen.CreateThread(function()
    if Config.Blip then
        for k, v in pairs(Config.FishingZone) do
            local blip = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blip, Config.BlipId)
            SetBlipScale (blip, Config.BlipTaille)
            SetBlipColour(blip, Config.BlipCouleur)
            SetBlipAsShortRange(blip, Config.BlipRange)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.BlipName)
            EndTextCommandSetBlipName(blip)
        end
    end
end)