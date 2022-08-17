local shop = 0
local linemenu = 0
local shopitems = {
------food
"Energy_bar",
"Burger",
"Bread",
------drink
"Cola",
"redbull",
"Water",
------health
}
local shopprices = {
50, --bar
200, --burger
60, --bread
80, --cola
150, --redbull
30, --water
}

function IsPlayerNearCoords(x, y, z, radius)
    local pos = table.pack(GetCharCoordinates(GetPlayerChar(-1)))
    local dist = GetDistanceBetweenCoords3d(x, y, z, pos[1], pos[2], pos[3])
    if(dist < radius) then return true
    else return false
    end
end

Citizen.CreateThread(function()
	shopblip1 = AddBlipForCoord(-234.80284, 49.28598, 15.70512)
	shopblip2 = AddBlipForCoord(-1006.328, 1625.91931, 24.31901)
	shopblip3 = AddBlipForCoord(1110.24011, 1586.60278, 16.91252)
	shopblip4 = AddBlipForCoord(1188.46545, 1701.63538, 17.72698)
	shopblip5 = AddBlipForCoord(-123.3668, 69.24851, 14.80807)
	shopblip6 = AddBlipForCoord(-172.55797, 287.94949, 14.87685)
	shopblip7 = AddBlipForCoord(-435.29657, 452.99026, 10.39999)
	shopblip8 = AddBlipForCoord(17.61743, 980.60443, 15.64598)
	shopblip9 = AddBlipForCoord(-428.76257, 1194.89233, 13.09649)
	shopblip10 = AddBlipForCoord(1639.43152, 225.50542, 25.26853)
	ChangeBlipSprite(shopblip1, 57)
	ChangeBlipSprite(shopblip2, 57)
	ChangeBlipSprite(shopblip3, 57)
	ChangeBlipSprite(shopblip4, 57)
	ChangeBlipSprite(shopblip5, 57)
	ChangeBlipSprite(shopblip6, 57)
	ChangeBlipSprite(shopblip7, 57)
	ChangeBlipSprite(shopblip8, 57)
	ChangeBlipSprite(shopblip9, 57)
	ChangeBlipSprite(shopblip10, 57)
	ChangeBlipNameFromAscii(shopblip1, "Shop")
	ChangeBlipNameFromAscii(shopblip2, "Shop")
	ChangeBlipNameFromAscii(shopblip3, "Shop")
	ChangeBlipNameFromAscii(shopblip4, "Shop")
	ChangeBlipNameFromAscii(shopblip5, "Shop")
	ChangeBlipNameFromAscii(shopblip6, "Shop")
	ChangeBlipNameFromAscii(shopblip7, "Shop")
	ChangeBlipNameFromAscii(shopblip8, "Shop")
	ChangeBlipNameFromAscii(shopblip9, "Shop")
	ChangeBlipNameFromAscii(shopblip10, "Shop")
	SetBlipAsShortRange(shopblip1, true)
	SetBlipAsShortRange(shopblip2, true)
	SetBlipAsShortRange(shopblip3, true)
	SetBlipAsShortRange(shopblip4, true)
	SetBlipAsShortRange(shopblip5, true)
	SetBlipAsShortRange(shopblip6, true)
	SetBlipAsShortRange(shopblip7, true)
	SetBlipAsShortRange(shopblip8, true)
	SetBlipAsShortRange(shopblip9, true)
	SetBlipAsShortRange(shopblip10, true)
	ChangeBlipScale(shopblip1, 0.6)
	ChangeBlipScale(shopblip2, 0.6)
	ChangeBlipScale(shopblip3, 0.6)
	ChangeBlipScale(shopblip4, 0.6)
	ChangeBlipScale(shopblip5, 0.6)
	ChangeBlipScale(shopblip6, 0.6)
	ChangeBlipScale(shopblip7, 0.6)
	ChangeBlipScale(shopblip8, 0.6)
	ChangeBlipScale(shopblip9, 0.6)
	ChangeBlipScale(shopblip10, 0.6)
	while true do
		Citizen.Wait(0)
		if(IsPlayerNearCoords(-234.80284, 49.28598, 15.70512, 30.0) or IsPlayerNearCoords(1639.43152, 225.50542, 25.26853, 30.0) or IsPlayerNearCoords(-123.3668, 69.24851, 14.80807, 30.0) or IsPlayerNearCoords(-172.55797, 287.94949, 14.87685, 30.0) or IsPlayerNearCoords(-435.29657, 452.99026, 10.39999, 30.0) or IsPlayerNearCoords(17.61743, 980.60443, 15.64598, 30.0) or IsPlayerNearCoords(-428.76257, 1194.89233, 13.09649, 30.0) or IsPlayerNearCoords(1110.24011, 1586.60278, 16.91252, 30.0) or IsPlayerNearCoords(1188.46545, 1701.63538, 17.72698, 30.0)) then
			DrawCheckpointWithAlpha(-234.80284, 49.28598, 15.70513, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(-1006.328, 1625.91931, 24.31902, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(1110.24011, 1586.60278, 16.91253, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(1188.46545, 1701.63538, 17.72699, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(-123.3668, 69.24851, 14.80808, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(-172.55797, 287.94949, 14.87686, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(-435.29657, 452.99026, 10.39999, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(17.61743, 980.60443, 15.64598, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(-428.76257, 1194.89233, 13.09649, 1.0, 255, 0, 0, 100)
			DrawCheckpointWithAlpha(1639.43152, 225.50542, 25.26853, 1.0, 255, 0, 0, 100)
		end
		if(shop == 0) then
			if(IsPlayerNearCoords(-234.80284, 49.28598, 15.70512, 0.5) or IsPlayerNearCoords(1639.43152, 225.50542, 25.26853, 0.5) or IsPlayerNearCoords(-123.3668, 69.24851, 14.80807, 0.5) or IsPlayerNearCoords(-172.55797, 287.94949, 14.87685, 0.5) or IsPlayerNearCoords(-435.29657, 452.99026, 10.39999, 0.5) or IsPlayerNearCoords(17.61743, 980.60443, 15.64598, 0.5) or IsPlayerNearCoords(-428.76257, 1194.89233, 13.09649, 0.5) or IsPlayerNearCoords(1110.24011, 1586.60278, 16.91252, 0.5) or IsPlayerNearCoords(1188.46545, 1701.63538, 17.72698, 0.5)) then
				PrintStringWithLiteralStringNow("STRING", "~g~Press E to open shop menu", 1000, 1)
				if(IsGameKeyboardKeyJustPressed(18)) then
					shop = 1
					cursor = 1
					SetCamActive(GetGameCam(), false)
					SetPlayerControl(GetPlayerId(), false)
				end
			end
		else
			if(IsGameKeyboardKeyJustPressed(18)) then
				shop = 0
				cursor = 0
				SetCamActive(GetGameCam(), true)
				SetPlayerControl(GetPlayerId(), true)
			end
		end
		if(shop == 1) then
			MenuUi(shopitems, shopprices)
			if(IsMouseButtonJustPressed(1)) then
				for i=1,#shopitems,1 do
					if(IsCursorInArea(0.8, 0.1+(0.8/#shopitems/2)+(0.8/#shopitems*(i-1)), 0.2, 0.8/#shopitems)) then
						if(exports.oxygen:GetAccountMoney() >= shopprices[i]) then
							exports.oxygen:RemoveAccountMoney(shopprices[i])
							exports.oxygen:SetHealth("+", shopprices[i])
							PrintStringWithLiteralStringNow("STRING", "~g~Purchase is successful", 1000, 1)
						else
							PrintStringWithLiteralStringNow("STRING", "~r~You don't have enough money", 1000, 1)
						end
					end
				end
			end
		end
	end
end)
MenuUi = function(shopitems, shopprices)
	DrawRect(0.8, 0.5, 0.2, 0.8, 96, 96, 96, 100) --[ UI BACKGROUND COLOUR]
	for i=1,#shopitems,1 do
		if(IsCursorInArea(0.8, 0.1+(0.8/#shopitems/2)+(0.8/#shopitems*(i-1)), 0.2, 0.8/#shopitems)) then
			DrawRect(0.8, 0.1+(0.8/#shopitems/2)+(0.8/#shopitems*(i-1)), 0.2, 0.8/#shopitems, 255, 0, 0, 255) --[ UI COLOUR]
		end
	end
	for i=1,#shopitems,1 do
		SetTextScale(0.200000,  0.3000000)
		SetTextDropshadow(0, 0, 0, 0, 0)
		SetTextFont(6)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextWrap(0.0, 0.8)
		SetTextCentre(1)
		DisplayTextWithLiteralString(0.6, 0.9, "STRING", "Mouse_-_Navigate LMB_-_Select E_-_Exit")
		
		SetTextScale(0.1500000,  0.3000000)
		SetTextDropshadow(0, 0, 0, 0, 0)
		SetTextFont(6)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextWrap(0.0, 0.8)
		SetTextCentre(1)
		DisplayTextWithLiteralString(0.8, (0.12+(0.8/#shopitems/2)+(0.8/#shopitems*(i-1))), "STRING", shopitems[i] .. ":_" .. shopprices[i] .. ".Rs")
	end
end

cursor = 0
local mouseX = 0
local mouseY = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(not HasStreamedTxdLoaded("cursor")) then
			RequestStreamedTxd("cursor")
			while not HasStreamedTxdLoaded("cursor") do
				RequestStreamedTxd("cursor")
				Citizen.Wait(0)
			end
			cur = GetTextureFromStreamedTxd("cursor", "cursor")
		end
		if(cursor == 1) then
			mouseX,mouseY = GetMousePosition()
			if(mouseX>0.99 or mouseY>0.99) then
			
			else
				if(HasStreamedTxdLoaded("cursor")) then
					DrawSprite(cur, mouseX, mouseY, 0.02, 0.04, 0.0, 255, 255, 255, 255)
				else
					DrawRect(mouseX, mouseY, 0.01, 0.02, 255, 255, 255, 255)
				end
			end
		end
	end
end)

IsCursorInArea = function(x, y, width, height)
	local point1x = x - width/2
	local point1y = y - height/2
	local point2x = x + width/2
	local point2y = y + height/2
	if(mouseX>=point1x and mouseX<=point2x and mouseY>=point1y and mouseY<=point2y) then
		return true
	else
		return false
	end
end

IsCursorInAreaLeftTopCenter = function(x, y, width, height)
	local point1x = x
	local point1y = y
	local point2x = x + width
	local point2y = y + height
	if(mouseX>=point1x and mouseX<=point2x and mouseY>=point1y and mouseY<=point2y) then
		return true
	else
		return false
	end
end