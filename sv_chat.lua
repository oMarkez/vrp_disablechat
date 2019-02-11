local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
--RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

--[[AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end
	
	message = Emojit(message)
    TriggerEvent('chatMessage', source, author, message)
	
    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            local player = vRP.getUserSource({user_id})
            if vRP.hasPermission({user_id,"hamza0721.chattitle"}) then
                TriggerClientEvent('chatMessage', -1, "^1Staff ^7| " ..author.. " | ^0(^1"..user_id.."^0): " ..  message)
            elseif vRP.hasPermission({user_id,"hjalper.chattitle"}) then
                TriggerClientEvent('chatMessage', -1, "^3Hjælper ^7| " ..author.. " | ^0(^1"..user_id.."^0): " ..  message)
            else
                TriggerClientEvent('chatMessage', -1, "^0[^1OOC^0] " .. author .. " | ^0(^1" .. user_id .. "^0): ",  { 128, 128, 128 }, message)
            end
        end
    end
	
	CancelEvent()
end)--]]

AddEventHandler('__cfx_internal:commandFallback', function(command)
    if not command then
        return
    end
	
    local name = GetPlayerName(source)
	
	command = Emojit(command)
    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
		if user_id ~= nil then
			local player = vRP.getUserSource({user_id})
			if vRP.hasPermission({user_id,"hamza0721.chattitle"}) then
			TriggerClientEvent('chatMessage', -1, "^1Staff ^7| " ..name.. " | ^0(^1"..user_id.."^0): " ..  command)
			elseif vRP.hasPermission({user_id,"hjalper.chattitle"}) then
				TriggerClientEvent('chatMessage', -1, "^3Hjælper ^7| " ..name.. " | ^0(^1"..user_id.."^0): " ..  command)
			else
				TriggerClientEvent('chatMessage', -1, "^0[^1OOC^0] " .. name .. " | ^0(^1" .. user_id .. "^0): ",  { 128, 128, 128 }, command)
			--[[TriggerClientEvent('chatMessage', -1, "^3Staff ^7| " ..name.. " | " ..dato.." ^0(^1"..user_id.."^0): " ..  command)
			else
				TriggerClientEvent('chatMessage', -1, "^0[^1OOC^0] " ..name.. " | " ..dato.." ^0(^1"..user_id.."^0): " ..  command)]]
			end
        end
    end
	
	CancelEvent()
end)

function Emojit(text)
    for i = 1, #emoji do
      for k = 1, #emoji[i][1] do
        text = string.gsub(text, emoji[i][1][k], emoji[i][2])
      end
    end
    return text
end

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'KONSOL' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)

AddEventHandler('chatMessage', function(source, name, message)
	if message == nil or message == '' then return FALSE end
		local user_id = vRP.getUserId({source})
		if user_id ~= nil then
		PerformHttpRequest('https://discordapp.com/api/webhooks/516954856926478346/Kg-hoUjW54sLoQaeFXsL-9qM3QU-eP6EsyNGnXkCJogNWkEW7JHKEJ9NnFrmqJwminEJ', function(err, text, headers) end, 'POST', json.encode({username = "ByensRP " .. GetConvar("servernumber","#1") .. " - " .. name, content = "**ID: " .. user_id .. "** | " .. message}), { ['Content-Type'] = 'application/json' })
	end
end)