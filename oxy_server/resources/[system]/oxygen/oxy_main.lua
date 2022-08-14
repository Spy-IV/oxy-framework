local result = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerChar(-1)
			
		---------------------------[Money Hud]---------------------------
		if(enableMoneyHud == true) then
			DisplayText(0.897, 0.10-0.08, GetAccountMoney() .. ' $',  255, 255, 255, 255)
		end

		---------------------------[Disable NPCS]---------------------------

		if(NpcsEnabled == false) then
			SetCarDensityMultiplier(0.0)
			SetPedDensityMultiplier(0.0)
			SetRandomCarDensityMultiplier(0.0)
			SetParkedCarDensityMultiplier(0.0)
			SetScenarioPedDensityMultiplier(0.0, 0.0)
			local x, y, z = GetCharCoordinates(GetPlayerChar(-1))
			RemoveCarsFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
			SwitchGarbageTrucks(0)
			SwitchRandomBoats(0)
		end

		---------------------------[Never Wanted]---------------------------
		if(NeverWanted = true) then
			ClearWantedLevel(GetPlayerId())
		end

        ---------------------------[Job name var]---------------------------
		if(enableJobs == true) then
			if(job == 1) then
				jobname = "Police"
			elseif(job == 2) then
				jobname = "Medic"
			elseif(job == 3) then
				jobname = "Mechanic"
			elseif(job == 4) then
				jobname = "Gang"
			else
				jobname = "Unemployed"
			end
		end

		---------------------------[Job Display]---------------------------
		if(enableJobDisplay == true) then
			DisplayText(0.15, 0.97, "Job: " .. jobname, 255, 255, 255, 255)
		end

		---------------------------[Player Names]---------------------------
		if(EnablePlayerNames == false) then
			for i=0,31,1 do
				if(IsNetworkPlayerActive(i)) then
					if(ConvertIntToPlayerindex(i) ~= ConvertIntToPlayerindex(GetPlayerId())) then
						SetDisplayPlayerNameAndIcon(i, false)
					end
				end
			end
		end
		if(EnableWalkmode == true) then
			if(not IsGameKeyboardKeyPressed(42)) then
				SetNetworkWalkModeEnabled(false)
			else
				SetNetworkWalkModeEnabled(true)
			end
		end
    end
end)
 
--exports.oxygen:GetFunc()
