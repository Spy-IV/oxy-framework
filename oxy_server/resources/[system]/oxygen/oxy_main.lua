local result = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerChar(-1)
		---------------------------[Money Hud]---------------------------
		if(IsGameKeyboardKeyJustPressed(18)) then
			camera = AddCam(-223.96559, 432.8945, 14.81632+8)
		end
		if(DoesCamExist(camera)) then
			local gx, gy, gz = GetCamRot(GetGameCam())
			SetCamRot(camera, 5.0, 5.0, gz)
		end
		if(enableMoneyHud == true) then
			DisplayText(0.897, 0.10-0.08, GetAccountMoney() .. ' $',  255, 255, 255, 255)
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