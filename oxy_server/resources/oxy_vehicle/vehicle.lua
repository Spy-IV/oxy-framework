Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local engine = nil
        local ped = GetPlayerChar(-1)
        local px, py, pz = GetCharCoordinates(ped)
        local closestcar = GetClosestCar(px, py, pz, 10.0, false, 70)

		---------------------------[Basic digital speedometer]---------------------------
		if(IsCharInAnyCar(ped)) then 
			if(exports.oxygen:GetSpeedoStatus() == true) then
				
				RequestStreamedTxd("speedometer")
				while not HasStreamedTxdLoaded("speedometer") do
					Citizen.Wait(0)
				end
				local speedometer = GetTextureFromStreamedTxd("speedometer", "speedometer")
				local arrow= GetTextureFromStreamedTxd("speedometer", "arrow")
				local car = GetCarCharIsUsing(ped)
				local speedinmeters = GetCarSpeed(car)
				local speed = math.floor(speedinmeters*3600/1000)

				if(exports.oxygen:GetSpeedoType() == "digital") then
					DisplayText(0.15,0.935,'' .. round(speedinmeters, 0).. ' Km/h',  255, 255, 255, 255)
				else
					SetTextScale(0.500000,  0.7000000)
					SetTextDropshadow(0, 0, 0, 0, 0)
					SetTextFont(6)
					SetTextColour(255, 255, 255, 255)
					SetTextCentre(1)
					SetTextWrap(0.0, 0.8)
					DisplayTextWithLiteralString(0.5, 0.96, "STRING", "       " ..round(speedinmeters*3.7, 0).. "")
					DrawSprite(speedometer, 0.5, 0.91, 0.09, 0.18, 0.0, 255, 255, 255, 255)----
					DrawSpriteWithFixedRotation(arrow, 0.5, 0.95, 0.13, 0.26, -10.1+((190.0/320)*speed), 255, 255, 255, 255)
				end
			end
			---------------------------[Scripted car brakes]---------------------------
			local petrol = GetPetrolTankHealth(vehicle)
			local vehicle = (GetCarCharIsUsing(GetPlayerChar(-1))) 
			local getActualSpeed = GetCarSpeed(vehicle)
			if(DoesVehicleExist(vehicle)) then
				if(GetDriverOfCar(vehicle) == GetPlayerChar(-1)) then
					if(IsCarModel(vehicle, GetHashKey("POLICE")) or IsCarModel(vehicle, GetHashKey("POLICE2"))) then
						if IsGameKeyboardKeyPressed(57) then
							if(not IsCarInAirProper(vehicle)) then
								if(GetCarSpeed(vehicle) > 1) then
									SetCarForwardSpeed(vehicle, getActualSpeed - 1)
								end
							end
						end
					end
				end
			end
			
			---------------------------[Start/stop vehicle]---------------------------
			if(IsGameKeyboardKeyJustPressed(45)) then --[[X]]--
				if(engine == false) then
					engine = true
					PrintStringWithLiteralStringNow("STRING", "Vehicle started", 2000, 1)
				else
					PrintStringWithLiteralStringNow("STRING", "Vehicle stopped", 2000, 1)
					engine = false
				end
			end

			if(IsCharInAnyCar(GetPlayerChar(-1))) then
				if(DoesVehicleExist(vehicle)) then
					if(engine == false) then
						PrintStringWithLiteralStringNow("STRING", "Press X to start the engine", 1000, 1)
						if(DoesVehicleExist(vehicle)) then
							SetCarEngineOn(vehicle, 0, 0)
						end
					else
						if(DoesVehicleExist(vehicle)) then
							SetCarEngineOn(vehicle, 1, 1)
						end
					end
				end
			end

			---------------------------[vehicle's engine will stop working insted of blasting]---------------------------
			if(DoesVehicleExist(vehicle)) then
				if(petrol <= 999) then
					SetPetrolTankHealth(vehicle, 1000)
					SetCarHealth(vehicle, 0)
					SetEngineHealth(vehicle, 0)
					engine = 0
				end
			end	
		else
			engine = false
		end
		---------------------------[Lock Car From OutSide/InSide]---------------------------
		if(IsCharInAnyCar(ped)) then 
			if(IsGameKeyboardKeyJustPressed(22)) then --[ U ]--
				if(lockin == false) then
					lockin = true
					exports.oxygen:Notify("locked", 3000)
					LockCarDoors(vehicle, 3)
				else
					lockin = false
					exports.oxygen:Notify("Unlocked", 3000)
					LockCarDoors(vehicle, 0)
				end
			end
		end
				
		if(IsGameKeyboardKeyJustPressed(22)) then --[ U ]--
			---if(closestcar == ownedcar--[[This variable must be changed to your server's saved car variable]]) then
				if(DoesVehicleExist(closestcar)) then
					if(lock == false) then
						lock = true
						exports.oxygen:Notify("locked", 3000)
						LockCarDoors(closestcar, 3)
					else
						lock = false
						exports.oxygen:Notify("Unlocked", 3000)
						LockCarDoors(closestcar, 0)
					end
				end
            --end
        end
	end
end)

round = function(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
