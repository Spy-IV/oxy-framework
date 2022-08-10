local chatInputActive = false

RegisterNetEvent('chatMessage')
AddEventHandler('chatMessage', function(name, color, message)
    SendNUIMessage({
        name = name,
        color = color,
        message = message
    })
end)

RegisterNetEvent('chatMessageCheck')
AddEventHandler('chatMessageCheck', function(name, color, message, x, y, z)
    if(exports.oxygen:IsLocalChatEnabled() == true) then
        if(IsCharNearCoords(GetPlayerChar(-1), x, y, z, exports.oxygen:GetChatRadius())) then
            TriggerEvent('chatMessage', "[Local Chat] " .. name, {255, 0, 0}, ' ' .. message)
        end
    else
        TriggerEvent('chatMessage', "[Global] " .. name, {255, 0, 0}, ' ' .. message)
    end
end)

RegisterNUICallback('chatResult', function(data, cb)
    chatInputActive = false

    SetNuiFocus(false)

    if data.message then
        local id = GetPlayerId()

        local r, g, b = GetPlayerRgbColour(id)

        local x,y,z = GetCharCoordinates(GetPlayerChar(-1))

        TriggerServerEvent('chatMessageEntered', GetPlayerName(id), { r, g, b }, data.message, x, y, z)
    end

    cb('ok')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if not chatInputActive then
            if IsGameKeyboardKeyJustPressed(exports.oxygen:GetChatKey()) --[[ y ]] then
                chatInputActive = true

                SendNUIMessage({
                    meta = 'openChatBox'
                })

                SetNuiFocus(true)

                NetworkSetLocalPlayerIsTyping(GetPlayerId())
            end
        end
    end
end)

IsCharNearCoords = function(ped, x, y, z, radius) --can be used for both players and peds
	local px,py,pz = GetCharCoordinates(ped)
	local dist = GetDistanceBetweenCoords3d(px, py, pz, x, y, z)
	if(dist < radius) then
		return true
	else
		return false
	end
end