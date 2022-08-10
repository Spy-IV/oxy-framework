Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if(exports.oxygen:GetVcMode() == "Proximity") then
            for i=0,31,1 do
                if(IsNetworkPlayerActive(i)) then
                    if(ConvertIntToPlayerindex(i) ~= ConvertIntToPlayerindex(GetPlayerId())) then
                        local px,py,pz = GetCharCoordinates(GetPlayerChar(i))
                        if(exports.oxygen:IsCharNearCoords(GetPlayerChar(-1), px, py, pz, exports.oxygen:GetVcRadius())) then
                            exports.voicechat:SetPlayerVolume(i, 0.99)
                        else
                            exports.voicechat:SetPlayerVolume(i, 0.0)
                        end
                    end
                end
            end
        end
    end
end)