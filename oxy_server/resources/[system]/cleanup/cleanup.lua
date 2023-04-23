local cars = {}
local peds = {}
local objs = {}

SpawnCar = function(model, x, y, z, h)
	RequestCollisionAtPosn(x, y, z)
	cars[#cars+1] = CreateCar(model, x, y, z, true)
	MarkModelAsNoLongerNeeded(model)
	SetCarHeading(cars[#cars], h)
	SetCarOnGroundProperly(cars[#cars])
	SetVehicleDirtLevel(cars[#cars], 0.0)
	WashVehicleTextures(cars[#cars], 255)
	SetCarEngineOn(cars[#cars], 1, 1)
	--SetNetworkIdCanMigrate(GetNetworkIdFromVehicle(cars[#cars]), false)
	SetCarAsMissionCar(cars[#cars], true)
	SetCarExistsOnAllMachines(cars[#cars], true)
	SetNetworkIdExistsOnAllMachines(GetNetworkIdFromVehicle(cars[#cars]), true)
	return cars[#cars]
end

SpawnPed = function(model, x, y, z, h, k)
	RequestCollisionAtPosn(x, y, z)
	peds[#peds+1] = CreateChar(1, model, x, y, z, true)
	MarkModelAsNoLongerNeeded(model)
	if k then
		ActivateInterior(GetInteriorAtCoords(x, y, z, _i), true)
		LoadSceneForRoomByKey(GetInteriorAtCoords(x, y, z), k)
		SetRoomForCharByKey(peds[#peds], k)
	end
	SetCharHeading(peds[#peds], h)
	--SetNetworkIdCanMigrate(GetNetworkIdFromPed(peds[#peds]), false)
	SetCharAsMissionChar(peds[#peds], true)
	SetPedExistsOnAllMachines(peds[#peds], true)
	SetNetworkIdExistsOnAllMachines(GetNetworkIdFromPed(peds[#peds]), true)
	return peds[#peds]
end

SpawnObject = function(model, x, y, z, h, k)
	RequestCollisionAtPosn(x, y, z)
	objs[#objs+1] = CreateObjectNoOffset(model, x, y, z, 1)
	MarkModelAsNoLongerNeeded(model)
	if k then
		ActivateInterior(GetInteriorAtCoords(x, y, z, _i), true)
		LoadSceneForRoomByKey(GetInteriorAtCoords(x, y, z), k)
		AddObjectToInteriorRoomByKey(objs[#objs], k)
	end
	SetObjectHeading(objs[#objs], h)
	--SetNetworkIdCanMigrate(GetNetworkIdFromObject(objs[#objs]), false)
	SetObjectExistsOnAllMachines(objs[#objs], true)
	SetNetworkIdExistsOnAllMachines(GetNetworkIdFromObject(objs[#objs]), true)
	return objs[#objs]
end

SpawnRandomPed = function(x, y, z, h, k)
	RequestCollisionAtPosn(x, y, z)
	peds[#peds+1] = CreateRandomChar(x, y, z)
	MarkModelAsNoLongerNeeded(model)
	if k then
		ActivateInterior(GetInteriorAtCoords(x, y, z, _i), true)
		LoadSceneForRoomByKey(GetInteriorAtCoords(x, y, z), k)
		SetRoomForCharByKey(peds[#peds], k)
	end
	SetCharHeading(peds[#peds], h)
	--SetNetworkIdCanMigrate(GetNetworkIdFromPed(peds[#peds]), false)
	SetCharAsMissionChar(peds[#peds], true)
	SetPedExistsOnAllMachines(peds[#peds], true)
	SetNetworkIdExistsOnAllMachines(GetNetworkIdFromPed(peds[#peds]), true)
	return peds[#peds]
end