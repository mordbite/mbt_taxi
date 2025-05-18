local QBCore = exports['qb-core']:GetCoreObject()
--- QBCore-Notify Helper
function Notify(msg, type)
	QBCore.Functions.Notify(msg, type or "inform")
end

--- GTA-Native help Text Helper
function ShowHelp(msg)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandDisplayHelp(0, false, true, -1)
end

--- Checks if the local player is currently the driver of their vehicle.
-- @return boolean True if the player is seated in the driver seat, false otherwise.
function IsDriver()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	return GetPedInVehicleSeat(veh, -1) == ped
end

--- Determines whether the player is in a whitelisted taxi vehicle.
-- Compares the current vehicle's model against the configured list of allowed taxi models.
-- @return boolean True if the vehicle is whitelisted, false otherwise.
function whitelistedVehicle()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	if veh == 0 then return false end

	local model = GetEntityModel(veh)
	for _, v in pairs(Config.AllowedVehicles) do
		if model == GetHashKey(v.model) then
			return true
		end
	end
	return false
end

--- Loads a list of models synchronously before use.
-- Iterates through the given model names, requests each one, and waits until it's fully loaded.
-- @param models string[] Array of model names to load.
function RequestModelBatch(models)
	for _, model in ipairs(models) do
		local hash = GetHashKey(model)
		RequestModel(hash)
		while not HasModelLoaded(hash) do Wait(10) end
	end
end