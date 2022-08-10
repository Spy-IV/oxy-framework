adm = {
"Teleport to waypoint"
}

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		PlayerName = GetPlayerName(GetPlayerId())
		if(PlayerName == "Admin") then -- [ ADMIN ACCOUNT NAME ]
			admin = 1
		end
        if(IsGameKeyboardKeyJustPressed(69)) then -- [ NUMLOCK ]
			if(admin == 1) then
                local menuresult = ActivateMenu("ADMIN PANNEL!", adm) 
                if(menuresult > 0) then
                    if(adm[menuresult] == "Teleport to waypoint") then -- [ If player press this option ]
						-- [ Credits K3RHNOS ]
						local blip = GetFirstBlipInfoId(8)

						if (DoesBlipExist(blip)) then
							local waypoint = GetBlipCoords(blip)
							RequestCollisionAtPosn(waypoint.x, waypoint.y, 0.0)
							LoadAllObjectsNow()
					
							for height = 1, 1000 do
								local pGroundZ, integer = GetGroundZFor3dCoord(waypoint.x, waypoint.y, height + 0.0)
					
								if pGroundZ > 0.0 then 
									SetCharCoordinates(GetPlayerChar(-1), waypoint.x, waypoint.y, pGroundZ) -- [ teleport ]
									SetCharHeading(0.0) 
									break
								end
							end
						else
							Citizen.Trace("Waypoint not found!\n")
						end
                    end
                end
            end
        end
    end
end)


ActivateMenu = function(title, items)
	local menuresult = 0
	local currlist = 1
	cursor = 1
	SetCamActive(GetGameCam(), false)
	SetPlayerControl(GetPlayerId(), false)
	items[#items+1] = "~r~Cancel"
	while true do
		Wait(0)
		SetTextScale(0.1500000,  0.3000000)
		SetTextDropshadow(0, 0, 0, 0, 0)
		SetTextFont(6)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextCentre(1)
		DisplayTextWithLiteralString(0.1, 0.01, "STRING", "" .. title)
		DrawRectLeftTopCenter(0.0, 0.0, 0.265, 0.03, 0, 0, 255, 255)
		if(#items > 10) then
			local templist = {}
			local number = #items
			local finalnum = 0
			
			::retry::
			finalnum = finalnum + 1
			number = number - 10
			if(number > 10) then
				goto retry
			else
				finalnum = finalnum + 1
			end
			
			for i=1,finalnum,1 do
				templist[i] = {}
				for j=1,10,1 do
					if(items[10*(i-1)+j] ~= nil) then
						templist[i][j] = items[10*(i-1)+j]
					end
				end
			end
			
			local sep = 10
			for i=1,#templist,1 do
				if(currlist == i) then
					for j=1,#templist[i],1 do
						SetTextScale(0.1500000,  0.3000000)
						SetTextDropshadow(0, 0, 0, 0, 0)
						SetTextFont(6)
						SetTextEdge(1, 0, 0, 0, 255)
						--SetTextWrap(0.0, 0.3)
						SetTextCentre(1)
						DisplayTextWithLiteralString(0.5, 0.71, "STRING", "Mouse Wheel to scroll - Page: " .. currlist .. "/" .. #templist)
						
						DrawRectLeftTopCenter(0.0, 0.03+0.36/sep*(j-1), 0.265, 0.36/sep, 0, 0, 0, 120)
						SetTextScale(0.1500000,  0.3000000)
						SetTextDropshadow(0, 0, 0, 0, 0)
						SetTextEdge(1, 0, 0, 0, 255)
						DisplayTextWithLiteralString(0.02, 0.03+0.36/sep*(j-1)+0.01, "STRING", "" .. templist[i][j])
						if(IsCursorInAreaLeftTopCenter(0.0, 0.03+0.36/sep*(j-1), 0.265, 0.36/sep)) then
							DrawRectLeftTopCenter(0.0, 0.03+0.36/sep*(j-1), 0.265, 0.36/sep, 0, 0, 0, 150) 
							if(IsMouseButtonJustPressed(1)) then
								if(10*(i-1)+j ~= #items) then
									menuresult = 10*(i-1)+j
								end
								cursor = 0
								SetCamActive(GetGameCam(), true)
								SetPlayerControl(GetPlayerId(), true)
								return menuresult
							end
						end
					end
				end
			end
			if(GetMouseWheel(_i) ~= 0) then
				if(GetMouseWheel(_i) ~= 127) then
					if(currlist < #templist) then
						currlist = currlist + 1
					end
				else
					if(currlist > 1) then
						currlist = currlist - 1
					end
				end
			end
		else
			local sep = 0
			if(#items <= 10) then
				sep = 10
			else
				sep = #items
			end
			for i=1,#items,1 do
				DrawRectLeftTopCenter(0.0, 0.03+0.36/sep*(i-1), 0.265, 0.36/sep, 0, 0, 0, 120)
				SetTextScale(0.1500000,  0.3000000)
				SetTextDropshadow(0, 0, 0, 0, 0)
				SetTextEdge(1, 0, 0, 0, 255)
				DisplayTextWithLiteralString(0.02, 0.03+0.36/sep*(i-1)+0.01, "STRING", "" .. items[i])
				if(IsCursorInAreaLeftTopCenter(0.0, 0.03+0.36/sep*(i-1), 0.265, 0.36/sep)) then
					DrawRectLeftTopCenter(0.0, 0.03+0.36/sep*(i-1), 0.265, 0.36/sep, 0, 0, 0, 150)
					if(IsMouseButtonJustPressed(1)) then
						if(i ~= #items) then
							menuresult = i
						end
						cursor = 0
						SetCamActive(GetGameCam(), true)
						SetPlayerControl(GetPlayerId(), true)
						return menuresult
					end
				end
			end
		end
	end
end

DrawRectLeftTopCenter = function(x, y, width, height, r, g, b, a)
	DrawRect(x+width/2, y+height/2, width, height, r, g, b, a)
end

DrawCurvedWindowLeftTopCenter = function(x, y, width, height, a)
	DrawCurvedWindow(x+width/2, y+height/2, width, height, a)
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