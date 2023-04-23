RegisterNetEvent('restartScript')
AddEventHandler('restartScript', function(script)
	TerminateAllScriptsWithThisName(script)
	RequestScript(script)
	while not HasScriptLoaded(script) do
		Wait(0)
	end
	StartNewScript(script, 1024)
end)

local update = false
CreateThread(function()
	while true do
		Wait(0)
		if update then
			::again::
			update = false
			Wait(1000)
			if update then
				goto again
			end
			TriggerServerEvent('restartScript', "cleanup")
		end
	end
end)

SpawnCar = function(model, x, y, z, h)
	update = true
	if(HasModelLoaded(model)) then
		return exports.cleanup:SpawnCar(model, x, y, z, h)
	end
end

SpawnPed = function(model, x, y, z, h, k)
	update = true
	if(HasModelLoaded(model)) then
		return exports.cleanup:SpawnPed(model, x, y, z, h, k)
	end
end

SpawnRandomPed = function(model, x, y, z, h, k)
	update = true
	return exports.cleanup:SpawnRandomPed(model, x, y, z, h, k)
end

SpawnObject = function(model, x, y, z, h, k)
	update = true
	if(HasModelLoaded(model)) then
		return exports.cleanup:SpawnObject(model, x, y, z, h, k)
	end
end

CreateThread(function()
	while true do
		Wait(0)
		if(IsPlayerControlOn(GetPlayerId())) then
			if(not IsCharInAnyCar(GetPlayerChar(GetPlayerId()))) then
				BlockPedWeaponSwitching(GetPlayerChar(GetPlayerId()), true)
				local gw,cw = GetCurrentCharWeapon(GetPlayerChar(GetPlayerId()))
				local weps = {}
				for i=0,46,1 do
					if(HasCharGotWeapon(GetPlayerChar(GetPlayerId()), i)) then
						weps[#weps+1] = i
					end
				end
				if(not IsControlPressed(0, 87)) then
					if(IsControlJustPressed(0, 8)) then
						for i=1,#weps,1 do
							if(weps[i] == cw) then
								if weps[i+1] then
									SetCurrentCharWeapon(GetPlayerChar(GetPlayerId()), weps[i+1], true)
								else
									SetCurrentCharWeapon(GetPlayerChar(GetPlayerId()), weps[1], true)
								end
								break
							end
						end
					end
					if(IsControlJustPressed(0, 9)) then
						for i=1,#weps,1 do
							if(weps[i] == cw) then
								if weps[i-1] then
									SetCurrentCharWeapon(GetPlayerChar(GetPlayerId()), weps[i-1], true)
								else
									SetCurrentCharWeapon(GetPlayerChar(GetPlayerId()), weps[#weps], true)
								end
								break
							end
						end
					end
				end
			else
				BlockPedWeaponSwitching(GetPlayerChar(GetPlayerId()), false)
			end
		end
	end
end)

local gunfire = {
{7, "gun@handgun", 0.83, 0.9, 300},
{9, "gun@deagle", 0.83, 0.92, 300},
{10, "gun@shotgun", 0.45, 0.89},
{11, "gun@baretta", 0.86, 0.92, 200},
{12, "gun@uzi", 0.85, 0.90, 100},
{13, "gun@mp5k", 0.8, 0.85, 100},
{14, "gun@ak47", 0.8, 0.85, 200},
{15, "gun@ak47", 0.8, 0.85, 200},
{22, "gun@test_gun", 0.82, 0.85, 300},
{26, "gun@sawnoff", 0.71, 0.78},
{27, "gun@cz75", 0.82, 0.85, 100},
{29, "gun@44A", 0.76, 0.85, 300},
{30, "gun@aa12", 0.7, 0.75, 300},
{31, "gun@aa12", 0.7, 0.75, 300},
{32, "gun@p90", 0.8, 0.85, 100},
{33, "gun@GOLD_UZI", 0.8, 0.85, 100},
{34, "gun@m249", 0.8, 0.85, 100}
}
CreateThread(function()
	while true do
		Wait(0)
		if(IsControlPressed(0, 87)) then
			if(IsControlPressed(0, 4)) then
				local ped = GetPlayerChar(GetPlayerId())
				local gw,cw = GetCurrentCharWeapon(ped)
				for i=1,#gunfire,1 do
					if(cw == gunfire[i][1]) then
						local ammo = GetAmmoInClip(ped, cw)
						if(type(ammo) == "number") then
							if(ammo > 0) then
								if(not IsCharDucking(ped)) then
									if(GetCharAnimCurrentTime(ped, gunfire[i][2], "fire") >= gunfire[i][4]) then
										SetCharAnimCurrentTime(ped, gunfire[i][2], "fire", gunfire[i][3])
									end
								else
									if(GetCharAnimCurrentTime(ped, gunfire[i][2], "fire_crouch") >= gunfire[i][4]) then
										SetCharAnimCurrentTime(ped, gunfire[i][2], "fire_crouch", gunfire[i][3])
									end
								end
							end
							break
						end
					end
				end
			end
		end
	end
end)
CreateThread(function()
	local anims = {
	{"jump_std", "jump_takeoff_l"},
	{"jump_std", "jump_takeoff_r"},
	{"jump_rifle", "jump_takeoff_l"},
	{"jump_rifle", "jump_takeoff_r"}
	}
	while true do
		Wait(0)
		local ped = GetPlayerChar(GetPlayerId())
		for i=1,#anims,1 do
			if(IsCharPlayingAnim(ped, anims[i][1], anims[i][2])) then
				if(GetCharAnimCurrentTime(ped, anims[i][1], anims[i][2]) > 0.9) then
					Wait(100)
					if(IsCharPlayingAnim(ped, anims[i][1], anims[i][2])) then
						ClearCharTasksImmediately(ped)
					end
				end
			end
		end
	end
end)