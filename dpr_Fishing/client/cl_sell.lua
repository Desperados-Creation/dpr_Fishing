ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Menu -- 
local open = false
local MenuSellFish = RageUI.CreateMenu("Poissonerie", "INTERACTION")
MenuSellFish.Display.Header = true
MenuSellFish.Closed = function()
    open = false
end

function OpenMenuSellFish() 
    if open then 
        open = false
        RageUI.Visible(MenuSellFish, false)
        return
    else
        open = true
        RageUI.Visible(MenuSellFish, true)
        CreateThread(function()
            while open do 
                RageUI.IsVisible(MenuSellFish, function()
                    RageUI.Separator("↓     ~b~Revente de poisson    ~s~↓")
                    for k, v in pairs(Config.FishButtonMEnu) do
                        RageUI.Button(v.Nom, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('dpr_Fishing:SellFish', v.Nom, v.Item, v.Price)
                            end
                        })
                    end
                    RageUI.Separator("↓    ~r~Fermer    ~s~↓")
                    RageUI.Button("Fermer", nil, {RightLabel = "~y~→→"}, true, {
                        onSelected = function()
                            RageUI.CloseAll()
                            open = false
                        end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do 
        local wait = 750
        for k in pairs(Config.SellFishZone) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local pos = Config.SellFishZone
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

            if dist <= 2.0 then 
                wait = 0
                Visual.Subtitle(Config.TextSellFish)
                if IsControlJustPressed(1, 51) then 
                    OpenMenuSellFish()
                end
            end
        end
    Wait(wait)
    end
end)

-- Blips --
Citizen.CreateThread(function()
    if Config.BlipSellFish then
        for k, v in pairs(Config.SellFishZone) do
            local blip = AddBlipForCoord(v.x, v.y, v.z)

            SetBlipSprite(blip, Config.BlipSellFishId)
            SetBlipScale (blip, Config.BlipSellFishTaille)
            SetBlipColour(blip, Config.BlipSellFishCouleur)
            SetBlipAsShortRange(blip, Config.BlipSellFishRange)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.BlipSellFishName)
            EndTextCommandSetBlipName(blip)
        end
    end
end)