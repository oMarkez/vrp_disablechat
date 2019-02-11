------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--        Script made for ByensRP 11/02/2019         --
--   Copyright 2019 ©oMarkez. All rights reserved    --
-------------------------------------------------------

local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_disablechat")

cfg = getConfig()
local disabled = false

RegisterServerEvent('_chat:messageEntered')

RegisterServerEvent("disableChat")
AddEventHandler("disableChat", function()
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then 
		if vRP.hasPermission({user_id,cfg.disablechatperm}) then
			disabled = not disabled
			if disabled then
				TriggerClientEvent('chatMessage', -1, cfg.messages.name,  {249, 77, 20}, cfg.messages.off)
			else
				TriggerClientEvent('chatMessage', -1, cfg.messages.name,  {249, 77, 20}, cfg.messages.on)
			end
		else
			vRPclient.notify(source,{cfg.messages.noperm})
		end
	end
end)

RegisterServerEvent("clearChat")
AddEventHandler("clearChat", function()
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then 
		if vRP.hasPermission({user_id,cfg.disablechatperm}) then
			TriggerClientEvent("chat:clear", -1)
			TriggerClientEvent('chatMessage', -1, cfg.messages.name, {249, 77, 20}, cfg.messages.clearedchat)
		end
	end
end)

AddEventHandler("_chat:messageEntered", function(author, color, message)
	if not message or not author then
        return
	end

	local user_id = vRP.getUserId({source})

	TriggerEvent('chatMessage', source, author, message)

	if disabled then
		if not vRP.hasPermission({user_id,cfg.bypassperm}) then
			CancelEvent()
			TriggerClientEvent('chatMessage', source, cfg.messages.name, {249, 77, 20}, cfg.messages.currentlyoff)
		else
			TriggerClientEvent('chatMessage', -1, "^0[^1STAFF^0] " .. author .. " | ^0(^1" .. user_id .. "^0): ",  { 128, 128, 128 }, message)
			CancelEvent()
		end
	end
		
	if not WasEventCanceled() and not disabled then
		TriggerClientEvent('chatMessage', -1, "^0[^1OOC^0] " .. author .. " | ^0(^1" .. user_id .. "^0): ",  { 128, 128, 128 }, message)
	end
	
	CancelEvent()
end)