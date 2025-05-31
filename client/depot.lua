--	mbt_taxi
--	License: CC BY-NC-SA 4.0 – https://creativecommons.org/licenses/by-nc-sa/4.0/
--	Developed by Mordbite, 2025

local QBCore = exports['qb-core']:GetCoreObject()
local depotPed = nil
local depotBlip = nil
local isPlayerInsideZone = false
local shouldShowHelp = false

-- #############
-- # FUNCTIONS #
-- #############

--- Spawns or reinitializes the static depot NPC used for taxi access.
-- Removes any existing nearby non-player peds, then creates an interactive ped
-- using qb-target with a depot interaction menu.

function setupDepotPed()
	if depotPed then return end

	local depotPos = vector3(Config.DepotPed.x, Config.DepotPed.y, Config.DepotPed.z)

	for _, ped in pairs(GetGamePool('CPed')) do
		local pos = GetEntityCoords(ped)
		if #(vector3(pos.x, pos.y, pos.z) - depotPos) < 3.0 and not IsPedAPlayer(ped) then
			DeleteEntity(ped)
		end
	end

	if not depotBlip then
		CreateThread(function()
			depotBlip = AddBlipForCoord(depotPos)

			SetBlipSprite(depotBlip, 198)
			SetBlipDisplay(depotBlip, 4)
			SetBlipScale(depotBlip, 1.0)
			SetBlipColour(depotBlip, 5)
			SetBlipAsShortRange(depotBlip, false)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Fahrzeugdepot")
			EndTextCommandSetBlipName(depotBlip)
		end)
	end

	CreateThread(function()
		depotPed = exports['qb-target']:SpawnPed({
			model = 'a_m_m_indian_01',
			coords = Config.DepotPed,
			scenario = 'WORLD_HUMAN_AA_COFFEE',
			target = {
				options = {{
					type = 'client',
					event = 'mbt_taxi:client:openDepotMenu',
					icon = 'fas fa-taxi',
					label = Lang:t('request-cab'),
				}},
				distance = 2.5,
			},
			spawnNow = true,
		})
	end)
end

--- Defines the taxi depot parking zone and interaction logic.
-- Creates a BoxZone for detecting player presence and sets flags for UI hints
-- based on vehicle eligibility and player position.
function setupCabParkingLocation()
	local taxiParking = BoxZone:Create(vector3(908.62, -173.82, 74.51), 11.0, 38.2, {
		name = 'qb-taxi',
		heading = 55,
		debugPoly = Config.Debug
	})

	taxiParking:onPlayerInOut(function(isInside)
		isPlayerInsideZone = isInside
		shouldShowHelp = isInside and whitelistedVehicle()
	end)
end

--- Finds the nearest available taxi spawn point that is not blocked by another vehicle.
-- Iterates through configured spawn locations, checks proximity to player, and filters out occupied spots.
-- @return table|nil The closest unoccupied spawn location, or nil if none are free.
function getNearestFreeCabSpawn()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	local nearest = nil
	local shortestDist = 10000

	for _, v in pairs(Config.CabSpawns) do
		local spawnPos = vector3(v.x, v.y, v.z)
		local isClear = true

		for _, veh in pairs(GetGamePool('CVehicle')) do
			if #(spawnPos - GetEntityCoords(veh)) < 2.5 then
				isClear = false
				break
			end
		end

		if not isClear then goto continue end
		local dist = #(pos - spawnPos)
		if dist < shortestDist then
			shortestDist = dist
			nearest = v
		end
		::continue::
	end

	return nearest
end

-- ###########################
-- # EVENT HANDLER FUNCTIONS #
-- ###########################

--- Opens the taxi depot vehicle selection menu for eligible players.
-- Verifies the player's job as 'taxi', then displays a list of allowed vehicles using qb-menu.
-- Provides vehicle spawn options and a menu close action.
function handleOpenDepotMenu()
	if QBCore.Functions.GetPlayerData().job.name ~= "taxi" then
		return QBCore.Functions.Notify(Lang:t('wrong-job'), "error")
	end

	local menu = {}
	for _, v in pairs(Config.AllowedVehicles) do
		table.insert(menu, {
			header = v.label,
			params = {
				event = 'mbt_taxi:client:spawnTaxi',
				args = v.model
			}
		})
	end

	table.insert(menu, {
		header = Lang:t('close'),
		event = 'qb-menu:client:closeMenu'
	})

	exports['qb-menu']:openMenu(menu)
end

--- Spawns a taxi vehicle for the player at the nearest available depot location.
-- Validates spawn point availability, requests vehicle spawn via server callback,
-- sets initial properties (heading, plate, fuel, keys), and places the player in the driver seat.
-- @param model string Vehicle model name to spawn.
function handleSpawnTaxi(model)
	local spawn = getNearestFreeCabSpawn()
	if not spawn then
		return QBCore.Functions.Notify(Lang:t('no-spawn'), "error")
	end

	local coords = vector3(spawn.x, spawn.y, spawn.z)

	QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
		local veh = NetToVeh(netId)
		SetEntityHeading(veh, spawn.w)
		SetVehicleNumberPlateText(veh, 'TAXI' .. math.random(1000, 9999))
		TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
		SetVehicleEngineOn(veh, true, true)
		exports['LegacyFuel']:SetFuel(veh, 100.0)
		TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
	end, model, coords, true)
end

-- ##########
-- # EVENTS #
-- ##########

RegisterNetEvent('mbt_taxi:client:openDepotMenu', handleOpenDepotMenu)
RegisterNetEvent('mbt_taxi:client:spawnTaxi', function(model)
	handleSpawnTaxi(model)
end)

RegisterNetEvent('mbt_taxi:client:initDepot', function()
	setupDepotPed()
	setupCabParkingLocation()
end)

-- ###########
-- # THREADS #
-- ###########

--- Continuous thread to display parking interaction help text.
-- Shows a contextual help prompt when the player is inside the depot parking zone
-- and in a valid taxi vehicle.
CreateThread(function()
	while true do
		Wait(0)
		if shouldShowHelp then
			BeginTextCommandDisplayHelp("STRING")
			AddTextComponentSubstringPlayerName(Lang:t('input-garage'))
			EndTextCommandDisplayHelp(0, false, true, -1)
		end
	end
end)

--- Continuous thread to handle depot vehicle return interaction.
-- Allows players inside the depot parking zone and in a whitelisted taxi
-- to return their vehicle by pressing the interaction key (~INPUT_CONTEXT~).
-- Deletes the vehicle and shows a confirmation notification.
CreateThread(function()
	while true do
		Wait(0)
		if isPlayerInsideZone and whitelistedVehicle() then
			if IsControlJustReleased(0, 38) or IsControlJustReleased(1, 38) then
				local veh = GetVehiclePedIsIn(PlayerPedId(), false)
				TaskLeaveVehicle(PlayerPedId(), veh, 0)
				Wait(1500)
				DeleteEntity(veh)
				QBCore.Functions.Notify(Lang:t('cab-returned'), "success")
				shouldShowHelp = false
			end
		end
	end
end)