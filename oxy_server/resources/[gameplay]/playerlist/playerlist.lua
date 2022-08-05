CreateThread(function()
    while true do
        Wait(0)
        if IsGameKeyboardKeyPressed(15) then
		    local players = GetPlayers()
		    local playeramount = GetNumberOfPlayers()
            local y = 0.034
		
			DrawRect(0.5, 0.14, 0.3, 0.03, 255, 0, 0, 200)

			SetTextFont(6)
			SetTextBackground(0)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextScale(0.28000000, 0.30000000)
			DisplayTextWithLiteralString(0.36, 0.130, "STRING", "Name")
			SetTextFont(6)
			SetTextBackground(0)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextWrap(0.0, 0.64)
			SetTextRightJustify(1)
			SetTextScale(0.28000000, 0.30000000)
			DisplayTextWithLiteralString(0.64, 0.130, "STRING", "ID")
			SetTextFont(6)
			SetTextBackground(0)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextWrap(0.0, 0.64)
			SetTextRightJustify(1)
			SetTextScale(0.28000000, 0.30000000)
			SetTextColour(255, 0, 0, 255)
			DisplayTextWithLiteralString(0.45, 0.120, "STRING", "Oxygen")
			
			for _, player in ipairs(players) do
				local r, g, b = GetPlayerRgbColour(player)
				if(IsNetworkPlayerActive(player)) then
					local r, g, b = GetPlayerRgbColour(i)	
					DrawRect(0.5, 0.14 + y, 0.3, 0.03, 96, 96, 96, 100)

					SetTextFont(6)
					SetTextBackground(0)
					SetTextDropshadow(0, 0, 0, 0, 255)
					SetTextEdge(1, 0, 0, 0, 255)
					SetTextColour(r, g, b, 255)
					SetTextScale(0.28000000, 0.30000000)
					DisplayTextWithLiteralString(0.36, 0.125 + y + 0.005, "STRING", "" .. GetPlayerName(player))

					SetTextScale(0.28000000, 0.30000000)
					SetTextDropshadow(0, 0, 0, 0, 0)
					--SetTextColour(255, 255, 0, 255)
					SetTextFont(6)
					SetTextWrap(0.0, 0.64)
					SetTextRightJustify(1)
					SetTextEdge(1, 0, 0, 0, 255)
					DisplayTextWithLiteralString(0.64, 0.125 + y + 0.005, "STRING", "" .. tostring(GetPlayerServerId(player)))
					y = y + 0.034
				end
			end
        end
	end
end)