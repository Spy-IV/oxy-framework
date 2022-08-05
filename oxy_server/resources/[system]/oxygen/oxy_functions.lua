CreateBlipAtCoord = function(x, y, z, text, sprite, color, range, scale)
	local blip = AddBlipForCoord(x, y, z)
	ChangeBlipSprite(blip, sprite)
	ChangeBlipColour(blip, color)
	ChangeBlipScale(blip, scale)
	ChangeBlipNameFromAscii(blip, text)
	SetBlipAsShortRange(blip, range)
	return blip
end

DrawCheckpointWithDist = function(x, y, z, radius, r, g, b, a)
	if(IsPlayerNearCoords(x, y, z, 50)) then
		DrawCheckpointWithAlpha(x, y, z, radius, r, g, b, a)
	end
end

AddAccountMoney = function(amount)
	accountmoney = accountmoney + tonumber(amount)
	SaveData()
end

RemoveAccountMoney = function(amount)
	accountmoney = accountmoney - tonumber(amount)
	SaveData()
end

Print = function(text)
TriggerServerEvent('PrintText', text)
end

AddBankMoney = function(amount)
	bankmoney = bankmoney + tonumber(amount)
	SaveData()
end

RemoveBankMoney = function(amount)
	bankmoney = bankmoney - tonumber(amount)
	SaveData()
end

GetAccountMoney = function()
	return accountmoney
end

GetBankMoney = function()
	return bankmoney
end

SetSkin = function(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
		FreezeCharPosition(GetPlayerChar(-1), false)
	end
	ChangePlayerModel(GetPlayerId(), model)
end

round = function(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

SpawnCar = function(model, x, y, z, h, tp)
	RequestModel(model)
	while not HasModelLoaded(model) do 
		Citizen.Wait(0) 
	end
	RequestCollisionAtPosn(x, y, z)
	local veh = CreateCar(model, x, y, z, true)
	MarkModelAsNoLongerNeeded(model)
	SetCarHeading(veh, h)
	SetCarOnGroundProperly(veh)
	SetVehicleDirtLevel(veh, 0.0)
	WashVehicleTextures(veh, 255)
	SetCarEngineOn(veh, 1, 1)
	MarkCarAsNoLongerNeeded(veh)
	if(tp == true) then
		WarpCharIntoCarAsPassenger(GetPlayerChar(-1), veh)
	end
	return veh
end

SpawnObject = function(model, x, y, z, h)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
	obj = CreateObject(model, x, y, z, 1)
	MarkModelAsNoLongerNeeded(model)
	SetObjectHeading(obj, h)
	return obj
end

SpawnPed = function(model, x, y, z, h)
	RequestModel(model)
	while not HasModelLoaded(model) do 
		Citizen.Wait(0) 
	end
	RequestCollisionAtPosn(x, y, z)
	local ped = CreateChar(1, model, x, y, z, true)
	MarkModelAsNoLongerNeeded(model)
	SetCarHeading(ped, h)
	MarkCarAsNoLongerNeeded(ped)
	return ped
end

PlayAnim = function(anim, animset, mode) -- 0 - default | 1 - looped | 2 - freeze at last frame
	Citizen.CreateThread(function()
		RequestAnims(animset)
		while not HaveAnimsLoaded(animset) do
			Citizen.Wait(0)
		end
		TaskPlayAnimWithFlags(GetPlayerChar(-1), anim, animset, 8.0, 0, 0)
		if(mode == 0) then
			TaskPlayAnimWithFlags(GetPlayerChar(GetPlayerId()), anim, animset, 8.0, 0, 0)
		elseif(mode == 1) then
			TaskPlayAnimWithFlags(GetPlayerChar(GetPlayerId()), anim, animset, 8.0, 3000000, 0)
		elseif(mode == 2) then
			TaskPlayAnimWithFlags(GetPlayerChar(GetPlayerId()), anim, animset, 8.0, 0, 0x20)
		end
	end)
end

IsCharNearCoords = function(ped, x, y, z, radius) --can be used for both players and peds
	local px,py,pz = GetCharCoordinates(ped)
	local dist = GetDistanceBetweenCoords3d(px, py, pz, x, y, z)
	if(dist < radius) then
		return true
	else
		return false
	end
end

SetJob = function(jobid)
	job = tonumber(jobid)
	rank = 0
	SaveData()
end

SetRank = function(rank)
	rank = tonumber(rank)
	SaveData()
end

GetJob = function()
	if(job == 1) then
		jobid = "Police"
	elseif(job == 2) then
		jobid = "Medic"
	elseif(job == 3) then
		jobid = "Mechanic"
	elseif(job == 4) then
		jobid = "Gang"
	else
		jobid = "Unemployed"
	end
	return jobid
end

DrawRectLeftTopCenter = function(x, y, width, height, r, g, b, a)
	DrawRect(x+width/2, y+height/2, width, height, r, g, b, a)
end

DrawCurvedWindowLeftTopCenter = function(x, y, width, height, a)
	DrawCurvedWindow(x+width/2, y+height/2, width, height, a)
end

GetRank = function()
	if(job == 1) then
		if(rank == 1) then
			rankid = "Constable"
		elseif(rank == 2) then
			rankid = "Sub Insprector"
		elseif(rank == 3) then
			rankid = "Chief Insprector"
		elseif(rank == 4) then
			rankid = "IPS"
		elseif(rank == 5) then
			rankid = "DGP"
		end
	elseif(job == 2) then
		if(rank == 1) then
			rankid = "Ambulance Driver"
		elseif(rank == 2) then
			rankid = "Nurse"
		elseif(rank == 3) then
			rankid = "Junior Doctor"
		elseif(rank == 4) then
			rankid = "Senior Doctor"
		elseif(rank == 5) then
			rankid = "Cheif Doctor"
		end
	elseif(job == 3) then
		if(rank == 1) then
			rankid = "Trainie"
		elseif(rank == 2) then
			rankid = "Jr Mechanic"
		elseif(rank == 3) then
			rankid = "Cheif Mechanic"
		end
	elseif(job == 4) then
		if(rank == 1) then
			rankid = "Newbie"
		elseif(rank == 2) then
			rankid = "Worker"
		elseif(rank == 3) then
			rankid = "Security"
		elseif(rank == 4) then
			rankid = "Member"
		elseif(rank == 5) then
			rankid = "Co-Leader"
		elseif(rank == 6) then
			rankid = "Leader"
		end
	else
		rankid = "Unemployed"
	end
	return rankid
end

GetPlayerIdByName = function(name)
	for i=0,31,1 do
		if(IsNetworkPlayerActive(i)) then
			if(GetPlayerName(i, _s) == name) then
				return i
			end
		end
	end
end

Revive = function()
	local px,py,pz = GetCharCoordinates(GetPlayerChar(-1))
	local ph = GetCharHeading(GetPlayerChar(-1), _f)
	ResurrectNetworkPlayer(GetPlayerId(), px, py, pz, ph)
	SetCharHealth(GetPlayerChar(-1), 200)
end

DisplayImage = function(txd, texture, width, height, x, y, angle, r, g, b, a)
	RequestStreamedTxd(txd)
	while not HasStreamedTxdLoaded(txd) do
		Citizen.Wait(0)
	end
	local tex = GetTextureFromStreamedTxd(txd, texture)
	DrawSprite(tex, width, height, x, y, angle, r, g, b, a)
end

AddCam = function(x, y, z, lookx, looky, lookz)
	local camera = CreateCam(14)
	SetCamPropagate(camera, 1)
	SetCamPos(camera, x, y, z)
	SetCamActive(camera, true)
	ActivateScriptedCams(1, 1)
	PointCamAtCoord(camera, lookx, looky, lookz)
	return camera
end

SendEveryoneMessage = function(m1, m2)
	TriggerServerEvent('sendMessageToEveryone', m1, m2)
end

SendPlayerMessage = function(name, m1 , m2)
	TriggerServerEvent('sendMessageToPlayer', name, m1 , m2)
end

SaveData = function()
	if(IsScreenFadedIn()) then
		local data = {}
		data[1] = health
		data[2] = accountmoney
		data[3] = bankmoney
		data[4] = job
        data[5] = armor
		TriggerServerEvent('SaveData', data)
	end
end

RegisterNetEvent('sendMessageToPlayer')
AddEventHandler('sendMessageToPlayer', function(name, m1, m2)
	if(GetPlayerName(GetPlayerId()) == name) then
		TriggerEvent('chatMessage', '' .. m1, {255, 0, 0}, '' .. m2)
	end
end)
RegisterNetEvent('sendMessageToEveryone')
AddEventHandler('sendMessageToEveryone', function(m1, m2)
	TriggerEvent('chatMessage', '' .. m1, {255, 0, 0}, '' .. m2)
end)

setUpDraw2 = function(width,height,r,g,b,a,isToggle,isNumber)

  SetTextFont(3)
  SetTextBackground(0)
  SetTextDropshadow(0, 0, 0, 0, 255);
  SetTextEdge(0, 0, 0, 0, 255);

  SetTextColour(r, g, b, a)
  SetTextScale(width, height)
  SetTextProportional(1)

  SetTextJustify(0)
  SetTextCentre(0)

  if isToggle then

    SetTextRightJustify(1)
    SetTextWrap(0.0000, 0.2040)

  elseif isNumber then

    SetTextRightJustify(1)
    SetTextWrap(0.0000, 0.1920)

  else

    SetTextRightJustify(0)

  end

 SetTextUseUnderscore(1)

end

DisplayText = function(x,y,text,r,g,b,a)

 setUpDraw2(0.28000000, 0.39000000, r, g, b, a, false, false)

 DisplayTextWithLiteralString(x, y,"STRING", text)

end

ShowText = function(text, timeout)
    if(timeout == nil) then PrintStringWithLiteralStringNow("STRING", text, 2000, 1)
    else PrintStringWithLiteralStringNow("STRING", text, timeout, 1)
    end
end


local cp = {}
CreateCheckpoint = function(x, y, z, radius, r, g, b, a, message)
	cp[#cp+1] = {x = x, y = y, z = z, radius = radius, r = r, g = g, b = b, a = a, message = message}
	return #cp
end

DeleteCheckpoint = function(id)
	if(cp[id] ~= nil) then
		cp[id] = {}
	end
end

DoesCheckpointExist = function(id)
	if(id ~= nil) then
		if(type(id) == "number") then
			if(cp[id] == nil) then
				return false
			else
				if(#cp[id] > 0) then
					return true
				else
					return false
				end
			end
		end
	end
end

IsPlayerAtCheckpoint = function(id)
	if(id ~= nil) then
		if(type(id) == "number") then
			if(cp[id] ~= nil) then
				if(#cp[id] > 0) then
					if(IsPlayerNearCoords(cp[id].x, cp[id].y, cp[id].z, cp[id].radius)) then
						return true
					else
						return false
					end
				end
			end
		end
	end
end

Notify = function(text, time)

	notification = true
	timeout = time
	PlaySoundFrontend(-1, "FRONTEND_MENU_BACK")

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if(notification == true) then
				SetTextScale(0.1500000-0.03,  0.2000000-0.03)
				SetTextFont(6)
				SetTextWrap(0.0, 0.1)
				SetTextEdge(1, 0, 0, 0, 255)
				SetTextDropshadow(0, 0, 0, 0, 0)
				SetTextEdge(1, 0, 0, 0, 255)
				SetTextCentre(1)
				DisplayTextWithLiteralString(0.1, 0.65, "STRING", text)

				SetTextScale(0.1500000-0.03,  0.2000000-0.03)
				SetTextFont(6)
				SetTextEdge(1, 0, 0, 0, 255)
				SetTextCentre(1)
				SetTextColour(3, 138, 255, 255)
				DisplayTextWithLiteralString(0.1, 0.62, "STRING", "Notification")
				DrawCurvedWindow(0.01, 0.6, 0.2, 0.1, 100)
			end
		end
	end)
	
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(notification == true) then
			Citizen.Wait(timeout)
			timeout = 0
			notification = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i=1,#cp,1 do
			if(#cp[i] > 0) then
				DrawCheckpointWithDist(cp[i].x, cp[i].y, cp[i].z, cp[i].radius*2, cp[i].r, cp[i].g, cp[i].b, cp[i].a)
				if(IsPlayerNearCoords(cp[i].x, cp[i].y, cp[i].z, cp[i].radius)) then
					PrintStringWithLiteralStringNow("STRING", cp[i].message, 1, 1)
				end
			end
		end
	end
end)

---------------------------[ Funtions for export ]---------------------------

function GetRespawnTimer()
	return RespawnTimer
end

function GetRespawnStatus()
	return AutoRespawn
end

function IsLocalChatEnabled()
	return EnableLocalChat
end

function GetChatKey()
	return ChatKey
end

function GetChatRadius()
	return LocalChatRadius
end

function GetAdmin()
	return ServerAdmin
end