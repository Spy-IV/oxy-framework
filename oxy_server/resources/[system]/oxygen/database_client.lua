---------------------------[Basic CSV Database]---------------------------
---------------------------[Temp Variables]---------------------------
local password = ""
local passwordentered = 0
local attempt = 1

---------------------------[Database Variables]---------------------------
playerCoordX = 0.0
playerCoordY = 0.0
playerCoordZ = 0.0
playerCoordH = 0.0
accountmoney = 0
bankmoney = 0
job = 0
rank = 0
health = 0
armor = 0

---------------------------[Script Variables]---------------------------
loggedIn = false
jobname = ""

---------------------------[Update password event]---------------------------
RegisterNetEvent("updPassword")
AddEventHandler("updPassword", function(ppassword)
	password = ppassword
end)

---------------------------[Login pannel]---------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if(useDatabase == true) then
            if(loggedIn == false) then
                FreezeCharPosition(GetPlayerChar(-1), true)
                
                DrawRect(0.5, 0.5, 1.0, 1.0, 36, 37, 42, 255)
                DrawRect(0.5, 0.5, 0.4, 0.1, 255, 255, 255, 255)
                DrawRect(0.35, 0.5, 0.08, 0.08, 3, 138, 255, 255)
                DrawRect(0.45, 0.5, 0.08, 0.08, 3, 138, 255, 255)
                DrawRect(0.55, 0.5, 0.08, 0.08, 3, 138, 255, 255)
                DrawRect(0.65, 0.5, 0.08, 0.08, 3, 138, 255, 255)
    
                SetTextFont(6)
                SetTextCentre(1)
                DisplayTextWithLiteralString(0.5, 0.35, "STRING", "Type Your password")
                if(password == "") then
                    SetTextFont(6)
                    SetTextCentre(1)
                    DisplayTextWithLiteralString(0.5, 0.65, "STRING", "Create password (4 digit Number)")
                else
                    SetTextFont(6)
                    SetTextCentre(1)
                    DisplayTextWithLiteralString(0.5, 0.65, "STRING", "Attempts: " .. attempt .. "/3")
                end
                for i=1,10,1 do
                    if(IsGameKeyboardKeyJustPressed(i+1)) then
                        if(number1 == nil) then
                            if(i ~= 10) then
                                number1 = i
                            else
                                number1 = 0
                            end
                        elseif(number2 == nil) then
                            if(i ~= 10) then
                                number2 = i
                            else
                                number2 = 0
                            end
                        elseif(number3 == nil) then
                            if(i ~= 10) then
                                number3 = i
                            else
                                number3 = 0
                            end
                        elseif(number4 == nil) then
                            if(i ~= 10) then
                                number4 = i
                            else
                                number4 = 0
                            end
                        end
                    end
                end
                if(HidePassword == true) then
                    if(number1 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.35)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.35, 0.48, "STRING", "x")
                    end
                    if(number2 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.45)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.45, 0.48, "STRING", "x")
                    end
                    if(number3 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.55)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.55, 0.48, "STRING", "x")
                    end
                    if(number4 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.65)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.65, 0.48, "STRING", "x")
                        passwordentered = 1
                    end
                else
                    if(number1 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.35)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.35, 0.48, "STRING", "" .. number1)
                    end
                    if(number2 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.45)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.45, 0.48, "STRING", "" .. number2)
                    end
                    if(number3 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.55)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.55, 0.48, "STRING", "" .. number3)
                    end
                    if(number4 ~= nil) then
                        SetTextScale(0.400000,  0.6000000)
                        SetTextDropshadow(0, 0, 0, 0, 0)
                        SetTextFont(6)
                        SetTextEdge(1, 0, 0, 0, 255)
                        SetTextWrap(0.0, 0.65)
                        SetTextCentre(1)
                        DisplayTextWithLiteralString(0.65, 0.48, "STRING", "" .. number4)
                        passwordentered = 1
                    end
                end
                if(passwordentered == 1) then
                    ---------------------------[Registration]---------------------------
                    if(password == "") then
                        TriggerServerEvent('savePassword', "" .. number1 .. "" .. number2 .. "" .. number3 .. "" .. number4)
                        loggedIn = true
                        SetPlayerControl(GetPlayerId(), true)
                        SetCharInvincible(GetPlayerChar(-1), false)
                        FreezeCharPosition(GetPlayerChar(-1), false)
                        SetCharCoordinates(GetPlayerChar(-1), SpawnCoordX, SpawnCoordY, SpawnCoordZ)
                        TriggerEvent('chatMessage', ServerName, {0, 0, 200}, 'Welcome to ' .. ServerName)
                    else
                        ---------------------------[Login]---------------------------
                        if(password == "" .. number1 .. "" .. number2 .. "" .. number3 .. "" .. number4) then
                            loggedIn = true
                            SetPlayerControl(GetPlayerId(), true)
                            SetCharInvincible(GetPlayerChar(-1), false)
                            FreezeCharPosition(GetPlayerChar(-1), false)
                            SetCharCoordinates(GetPlayerChar(-1), tonumber(playerCoordX), tonumber(playerCoordY), tonumber(playerCoordZ))
                            TriggerEvent('chatMessage', ServerName, {3, 138, 255}, 'Welcome back to ' .. ServerName)
                        else
                            if(attempt <= 2) then
                                attempt = attempt + 1
                                number1 = nil
                                number2 = nil
                                number3 = nil
                                number4 = nil
                                passwordentered = 0
                            else
                                ---------------------------[If password is wrong]---------------------------
                                TriggerServerEvent('kickPlayer')
                            end
                        end
                    end
                end
            end
        end
	end
end)

---------------------------[Saves player position in every 5 seconds]---------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
        if(useDatabase == true) then
            if(loggedIn == true) then
                local pos = table.pack(GetCharCoordinates(GetPlayerChar(-1), _f, _f, _f))
                playerCoordX = pos[1]
                playerCoordY = pos[2]
                playerCoordZ = pos[3]	
                TriggerServerEvent('savePlayerPos', round(playerCoordX, 2), round(playerCoordY, 2), round(playerCoordZ, 2))
            end
		end
	end
end)

---------------------------[Load Player Last Position]---------------------------
RegisterNetEvent('loadPlayerPos')
AddEventHandler('loadPlayerPos', function(posX, posY, posZ)
	playerCoordX = posX
	playerCoordY = posY
	playerCoordZ = posZ
	SetCharCoordinates(GetPlayerChar(-1), tonumber(posX), tonumber(posY), tonumber(posZ))
end)

---------------------------[Update Stats Event]---------------------------
RegisterNetEvent('updStats')
AddEventHandler('updStats', function(data)
	for i=1,100,1 do
		if(data[i] == nil) then
			if(i == 1) then
				data[i] = 0
			elseif(i == 2) then
				data[i] = 0
			elseif(i == 3) then
				data[i] = 0
			elseif(i == 4) then
				data[i] = 0
			elseif(i == 5) then
				data[i] = 0
            end
		end
	end
	health = tonumber(data[1])
	accountmoney = tonumber(data[2])
	bankmoney = tostring(data[3])
	job = tonumber(data[4])
	armor = tonumber(data[5])
end)