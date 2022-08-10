---------------------------[ Saves/Updates player server databse ]---------------------------
RegisterServerEvent('SaveData')
AddEventHandler('SaveData', function(data)
	local playername = GetPlayerName(source)
	
	os.remove("resources/[system]/oxygen/oxy_account/" .. playername .. ".db")
	
	local tempstring = ""
	for i=1,#data,1 do
		if(i ~= #data) then
			tempstring = tempstring .. data[i] .. ","
		else
			tempstring = tempstring .. data[i]
		end
	end
	
	local f,err = io.open("resources/[system]/oxygen/oxy_account/" .. playername .. ".db", "w")
    if not f then return print(err) end
    f:write(tempstring)
    f:close()
end)

---------------------------[ Loads player server databse ]---------------------------
RegisterServerEvent('playerActivated')
AddEventHandler('playerActivated', function()
    local playername = GetPlayerName(source)
	local file1 = io.open("resources/[system]/oxygen/oxy_account/" .. playername .. ".db", "r")
	if file1 then
		io.input(file1)
		local lines = io.read()
		local parts = Split(lines, ",")
		TriggerClientEvent('updStats', source, parts)
		print("SERVER: " .. playername .. ".db has been loaded.")
	end
	io.close(file1)
end)

---------------------------[ Save player last position server event ]---------------------------
RegisterServerEvent('savePlayerPos')
AddEventHandler('savePlayerPos', function(posX, posY, posZ)
	local playername = GetPlayerName(source)
   local f, err = io.open("resources/[system]/oxygen/oxy_account/" .. playername .. ".pos", "w")

    if not f then
        return print(err)
    end

    f:write(posX .. "," .. posY .. "," .. posZ .. "," .. hey)
    f:close()
end)

---------------------------[ Loads player last position ]---------------------------
RegisterServerEvent('playerActivated')
AddEventHandler('playerActivated', function()
	local playername = GetPlayerName(source)
   local file100 = io.open("resources/[system]/oxygen/oxy_account/" .. playername .. ".pos", "r")

    if file100 then
        io.input(file100)
        local lines = io.read()
        local parts = lines:Split(",")

        TriggerClientEvent('loadPlayerPos', source, parts[0], parts[1], parts[2])
        print("SERVER: " .. GetPlayerName(source) .. ".account has been loaded.")
	end
	io.close(file100)
end)

---------------------------[ Loads account password ]---------------------------
RegisterServerEvent('playerActivated')
AddEventHandler('playerActivated', function()
	local playername = GetPlayerName(source)
	
	local filepass = io.open("resources/[system]/oxygen/oxy_account/" .. playername .. ".password", "r")
	if filepass then
		io.input(filepass)
		local password = io.read()
		TriggerClientEvent('updPassword', source, password)
	end
	io.close(filepass)
end)

---------------------------[ Saves account password ]---------------------------
RegisterServerEvent('savePassword')
AddEventHandler('savePassword', function(password)
	local playername = GetPlayerName(source)
	
	os.remove("resources/[system]/oxygen/oxy_account/" .. playername .. ".password")
	
	local f,err = io.open("resources/[system]/oxygen/oxy_account/" .. playername .. ".password", "w")
    if not f then return print(err) end
    f:write(password)
    f:close()
end)

---------------------------[ Kick player server event ]---------------------------
RegisterServerEvent('kickPlayer')
AddEventHandler('kickPlayer', function()
	DropPlayer(source, "Wrong password")
end)

function Split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end
