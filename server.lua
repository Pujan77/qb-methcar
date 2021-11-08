print("Meth car got loaded, Modified by AAYAN ANIK")
	
--ESX = nil
QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-methcar:start')
AddEventHandler('qb-methcar:start', function()
	-- local _source = source
	-- local xPlayer = ESX.GetPlayerFromId(_source)
	local src   = source
    local Player = QBCore.Functions.GetPlayer(src)
	
	-- if xPlayer.getInventoryItem('acetone').count >= 5 and xPlayer.getInventoryItem('lithium').count >= 2 and xPlayer.getInventoryItem('methlab').count >= 1 then
	-- 	if xPlayer.getInventoryItem('meth').count >= 30 then
	-- 			TriggerClientEvent('qb-methcar:notify', _source, "~r~~h~You cant hold more meth")
	-- 	else
	-- 		TriggerClientEvent('qb-methcar:startprod', _source)
	-- 		xPlayer.removeInventoryItem('acetone', 5)
	-- 		xPlayer.removeInventoryItem('lithium', 2)
	-- 	end	
	-- else
	-- 	--TriggerClientEvent('qb-methcar:notify', _source, "~r~~h~Not enough supplies to start producing Meth")
	-- end	

	if Player.Functions.GetItemByName('concacid') and Player.Functions.GetItemByName('concacideph') and Player.Functions.GetItemByName('methlab') and Player.Functions.GetItemByName('ethylalc') then
		TriggerClientEvent('qb-methcar:start', src)
		Player.Functions.RemoveItem('concacid', 1)----change this
	    Player.Functions.RemoveItem('ethylalc', 1)-----change this
	    Player.Functions.RemoveItem('concacideph', 1)-----change this
	   TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['ethylalc'], "remove")
	   TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['concacid'], "remove")
	   TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['concacideph'], "remove")
	   TriggerClientEvent("QBCore:Notify", src, "Meth producing started sucessfully", "success", 7500)
	else
		TriggerClientEvent("QBCore:Notify", src, "You don\'t have enough supplies", "error", 7500)
	end
end)


RegisterServerEvent('qb-methcar:stop')
AddEventHandler('qb-methcar:stop', function()
--local _source = source
    local src   = source
	-- local xPlayers = ESX.GetPlayers()
	-- local xPlayer = ESX.GetPlayerFromId(_source)
    local Player = QBCore.Functions.GetPlayer(src)
    local xPlayers   = QBCore.Functions.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('qb-methcar:stop', xPlayers[i], id)
	end	
end)

RegisterServerEvent('qb-methcar:make')
AddEventHandler('qb-methcar:make', function(posx,posy,posz)
	-- local _source = source
	-- local xPlayer = ESX.GetPlayerFromId(_source)
	local src   = source
    local Player = QBCore.Functions.GetPlayer(src)
	local xPlayers   = QBCore.Functions.GetPlayers(Player)
	
	-- if xPlayer.getInventoryItem('methlab').count >= 1 then
	-- local xPlayers   = QBCore.Functions.GetPlayers()
	
		-- local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			TriggerClientEvent('qb-methcar:smoke',xPlayers[i],posx,posy,posz, 'a') 
		end
end)

RegisterServerEvent('qb-methcar:finish')
AddEventHandler('qb-methcar:finish', function(qualtiy)
	-- local _source = source
	-- local xPlayer = ESX.GetPlayerFromId(_source)
	local src   = source
    local Player = QBCore.Functions.GetPlayer(src)
	print(qualtiy)
	local rnd = math.random(-7, 5)
	local qualitynew = qualtiy - 4
	--TriggerEvent('KLevels:addXP', _source, 20)
	TriggerEvent('KLevels:addXP', src, 20)
	--xPlayer.addInventoryItem('meth', math.floor(qualtiy / 2) + rnd)
	Player.Functions.AddItem('acetone', math.floor(qualitynew / 2) + rnd)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['acetone'], "add")
	Player.Functions.AddItem('hydrochloricacid', math.floor(qualitynew / 2) + rnd)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['hydrochloricacid'], "add")
	Player.Functions.AddItem('ephedrine', math.floor(qualitynew / 2) + rnd)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['ephedrine'], "add")
	
end)

RegisterServerEvent('qb-methcar:blow')
AddEventHandler('qb-methcar:blow', function(posx, posy, posz)
	-- local _source = source
	-- local xPlayers = ESX.GetPlayers()
	-- local xPlayer = ESX.GetPlayerFromId(_source)
	local src   = source
    local Player = QBCore.Functions.GetPlayer(src)
    local xPlayers   = QBCore.Functions.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('qb-methcar:blowup', xPlayers[i],posx, posy, posz)
	end
	--xPlayer.removeInventoryItem('methlab', 1)
	Player.Functions.RemoveItem('methlab', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['methlab'], "remove")
end)

