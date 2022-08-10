RegisterNetEvent("onClientResourceStart")
AddEventHandler('onClientResourceStart', function(name)
    if name == GetCurrentResourceName() then
        local x, y = GetHudPosition('HUD_RADAR')
        local w, h = GetHudSize('HUD_RADAR')

        x = x - 0.01
        w = w + 0.02

        if GetIsWidescreen() then
            x = x / 1.333
            w = w / 1.333
        end

        exports.channelfeed:addChannel('obituary', {
            method = 'append',
            styleUrl = 'nui://obituary/obituary.css',
            styles = { -- temporary
                left = tostring(x * 100) .. '%',
                bottom = 'calc(' .. tostring((1 - y) * 100) .. '% + 10px)',
                width = tostring(w * 100) .. '%'
            },
            template = '<div class="item">{{{text}}}</div>'
        })
    end
end)

function printObituary(format, ...)
    local args = table.pack(...)

    for i = 1, args.n do
        if type(args[i]) == 'string' then
            args[i] = args[i]:gsub('<', '&lt;')
        end
    end

    Citizen.Trace("obituary: printObituary\n")

    exports.channelfeed:printTo('obituary', {
        text = string.format(format, table.unpack(args))
    })
end

RegisterNetEvent("onClientResourceStop")
AddEventHandler('onClientResourceStop', function()
    -- todo: remove channel
end)

------------------[ Death notifications ]
RegisterNetEvent("baseevents:onPlayerDied")
AddEventHandler('baseevents:onPlayerDied', function(playerId, position)
    local player = GetPlayerFromServerId(playerId)

    if player then
        printObituary('<b>%s</b> died.', GetPlayerName(player))
    end
end)
RegisterNetEvent("baseevents:onPlayerKilled")
AddEventHandler('baseevents:onPlayerKilled', function(playerId, data)
    local player = GetPlayerFromServerId(playerId)
    local attacker = GetPlayerFromServerId(data.killer)

    local reasonString = 'killed'

    if data.reason == 0 or data.reason == 56 or data.reason == 1 or data.reason == 2 then
        reasonString = 'meleed'
    elseif data.reason == 3 then
        reasonString = 'knifed'
    elseif data.reason == 4 or data.reason == 6 or data.reason == 18 or data.reason == 51 then
        reasonString = 'bombed'
    elseif data.reason == 5 or data.reason == 19 then
        reasonString = 'burned'
    elseif data.reason == 7 or data.reason == 9 then
        reasonString = 'pistoled'
    elseif data.reason == 10 or data.reason == 11 then
        reasonString = 'shotgunned'
    elseif data.reason == 12 or data.reason == 13 or data.reason == 52 then
        reasonString = 'SMGd'
    elseif data.reason == 14 or data.reason == 15 or data.reason == 20 then
        reasonString = 'assaulted'
    elseif data.reason == 16 or data.reason == 17 then
        reasonString = 'sniped'
    elseif data.reason == 49 or data.reason == 50 then
        reasonString = 'ran over'
    end

    Citizen.Trace("obituary-deaths: onPlayerKilled\n")

    if player and attacker then
        printObituary('<b>%s</b> %s <b>%s</b>.', GetPlayerName(attacker), reasonString, GetPlayerName(player))
    end
end)