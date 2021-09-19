ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('dpr_Fishing:startFishing')
AddEventHandler('dpr_Fishing:startFishing', function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local haveFishingRod = (xPlayer.getInventoryItem(Config.FishingRod).count >= 1)
    if not haveFishingRod then
        TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'avez pas de ~b~canne à pêche ~s~sur vous !")
        return
    end
    TriggerClientEvent('dpr_Fishing:startFishing', _src)
    SetTimeout(math.random(Config.MinTime, Config.MaxTime), function()
        local fish = Config.Fish[math.random(#Config.Fish)]
        xPlayer.addInventoryItem(fish, 1)
        TriggerClientEvent('dpr_Fishing:stopFishing', _src)
    end)
end)

RegisterNetEvent('dpr_Fishing:SellFish')
AddEventHandler('dpr_Fishing:SellFish', function(Nom, Item, Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local haveFish = (xPlayer.getInventoryItem(Item).count >= 1)
    if haveFish then
        xPlayer.addMoney(Price)
        xPlayer.removeInventoryItem(Item, 1)
        local xPlayers	= ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			Citizen.Wait(500) 
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Poissonerie', 'Revente', "Vous venez de vendre ~b~x1 "..Nom.." ~s~pour ~r~"..Price.."$", 'CHAR_BOATSITE', 1)
		end
    else
        local xPlayers	= ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			Citizen.Wait(500) 
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Poissonerie', 'Revente', "Vous n'avez pas suffisament de ~b~"..Nom.." ~s~pour en vendre !", 'CHAR_BOATSITE', 1)
		end
    end
end)
