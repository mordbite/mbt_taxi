--	mbt_taxi
--	License: CC BY-NC-SA 4.0 – https://creativecommons.org/licenses/by-nc-sa/4.0/
--	Developed by Mordbite, 2025

local QBCore = exports['qb-core']:GetCoreObject()
local currentTours = {}
local currentTour = nil

local activeTourPeds = {}

local currentPickupBlip = nil
local currentPickupZone  = nil

local currentTargetBlip = nil
local currentDropoffZone = nil

local tourTimerActive = false
local tourTimeExceeded = false

local uiShouldOpen = false

local meterThread = nil
local meterIsOpen = false

local manualMeterIsActive = false
local manualMeterThread = nil
local manualDistance = 0.0
local manualFare = 0.0
local manualLastPos = nil

local lastPosition = nil

local previousSpawns = {}

--==========================================================
--                    TOUR SYSTEM
--==========================================================

-- #############
-- # FUNCTIONS #
-- #############

--- Prepares and opens the tour selection UI with enriched tour data.
-- Converts raw tour entries into detailed objects with location labels,
-- sends them to the NUI frontend, and enables UI focus for interaction.
function openTourUI()
	local enrichedTours = {}

	for _, t in ipairs(currentTours) do
		local from = Config.TourLocations[t.from]
		local to = Config.TourLocations[t.to]

		table.insert(enrichedTours, {
			id = t.id,
			npcs = t.npcs,
			urgency = t.urgency,
			from = {
				key = t.from,
				LabelDetail = from.LabelDetail,
				LabelStreet = from.LabelStreet,
				LabelDistrict = from.LabelDistrict
			},
			to = {
				key = t.to,
				LabelDetail = to.LabelDetail,
				LabelStreet = to.LabelStreet,
				LabelDistrict = to.LabelDistrict
			}
		})
	end

	SendNUIMessage({
		action = "openTourMenu",
		tours = enrichedTours
	})
	SetNuiFocus(true, true)
end

---Initializes a new taxi tour session.
-- Sets the current tour, creates pickup blip and interaction zone,
-- starts the fare meter with configured defaults, and updates the UI.
-- @param tour table A tour object containing 'from', 'to', and 'id' fields.
function startTour(tour)
	currentTour = tour
	if currentPickupBlip then
		RemoveBlip(currentPickupBlip)
	end

	local pickupCoords = Config.TourLocations[tour.from].coords
	currentPickupBlip = AddBlipForCoord(pickupCoords.x, pickupCoords.y, pickupCoords.z)

	SetBlipSprite(currentPickupBlip, 280) -- Taxi-Symbol (optional)
	SetBlipColour(currentPickupBlip, 5)   -- Gelb
	SetBlipScale(currentPickupBlip, 0.9)
	SetBlipRoute(currentPickupBlip, true)
	SetBlipRouteColour(currentPickupBlip, 5)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Lang:t('pickup-area'))
	EndTextCommandSetBlipName(currentPickupBlip)
	
	if currentPickupZone then
		currentPickupZone:destroy()
		currentPickupZone = nil
	end

	local coords = Config.TourLocations[tour.from].coords
	
	local offset = 3.0
	local heading = coords.w
	local rad = math.rad(heading)

	local forwardX = -math.sin(rad) * offset
	local forwardY =  math.cos(rad) * offset

	local zoneCenter = vector3(coords.x + forwardX, coords.y + forwardY, coords.z)

	currentPickupZone = BoxZone:Create(zoneCenter, 8.0, 10.0, {
		name = "taxi_pickup_" .. tour.id,
		heading = coords.w,
		debugPoly = Config.Debug,
		minZ = coords.z - 2.0,
		maxZ = coords.z + 2.0
	})
	
	SendNUIMessage({
		action = "startMeter",
		meterData = {
			defaultPrice = Config.Meter.defaultPrice or 50,
			currentFare = Config.Meter.startingPrice or 50,
			distanceTraveled = 0.0,
			tour = {
				id = tour.id,
				fromDetail = Config.TourLocations[tour.from].LabelDetail or "-",
				fromStreet = Config.TourLocations[tour.from].LabelStreet or "-",
				fromDistrict = Config.TourLocations[tour.from].LabelDistrict or "-",
				toDetail = Config.TourLocations[tour.to].LabelDetail or "-",
				toStreet = Config.TourLocations[tour.to].LabelStreet or "-",
				toDistrict = Config.TourLocations[tour.to].LabelDistrict or "-"
			}

		}
	})
	meterStarted = true
end

--- Begins the driving phase of the current taxi tour.
-- Sets the destination blip, updates tour status, starts dropoff zone and fare tracking,
-- and initializes urgency-based timer and vehicle damage monitoring if applicable.
function startDrivePhase()
	local targetCoords = Config.TourLocations[currentTour.to].coords

	currentTargetBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
	SetBlipSprite(currentTargetBlip, 280)
	SetBlipColour(currentTargetBlip, 5)
	SetBlipScale(currentTargetBlip, 0.85)
	SetBlipRoute(currentTargetBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Lang:t('dropoff-area'))
	EndTextCommandSetBlipName(currentTargetBlip)

	currentTour.status = "driving"

	SendNUIMessage({ action = "toggleMeter" })
	meterStarted = true
	
	startDropoffZone(targetCoords)
	startMeterTracking()
	listenForVehicleDamage()

	local urgencyCfg = Config.UrgencySettings[currentTour.urgency]
	if urgencyCfg.hasTimeLimit then
		startTourTimer(currentTour, urgencyCfg)
	end
end

--- Finalizes the taxi tour at the destination.
-- Stops fare tracking, removes dropoff zone and target blip,
-- handles passenger (ped) exit logic, resets vehicle state,
-- and notifies the server with final tour data.
function endTourAtDestination()
	stopMeterTracking()

	if currentDropoffZone then
		currentDropoffZone:destroy()
		currentDropoffZone = nil
	end
	if currentTargetBlip then
		RemoveBlip(currentTargetBlip)
		currentTargetBlip = nil
	end

	-- NPCs aussteigen lassen
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	local peds = activeTourPeds[currentTour.id] or {}
	for _, ped in ipairs(peds) do
		TaskLeaveVehicle(ped, vehicle, 0)
		FreezeEntityPosition(ped, false)
		SetEntityAsNoLongerNeeded(ped)
	end

	Wait(2000)
	local veh = GetVehiclePedIsIn(PlayerPedId(), false)
	if veh and veh ~= 0 then
		for i = 0, GetNumberOfVehicleDoors(veh) - 1 do
			SetVehicleDoorShut(veh, i, false)
		end
	end
	local distance = currentTour.distance or 0.0
	local baseFare = ((distance / 1000) * Config.Meter.defaultPrice) + (Config.Meter.startingPrice or 0.0)

	TriggerServerEvent("mbt_taxi:endTour", currentTour.id, {
		deliveryTime = GetGameTimer(),
		fare = baseFare,
		distance = distance,
		urgency = currentTour.urgency or 1
	})

end

--- Creates and monitors the dropoff interaction zone at the tour destination.
-- Calculates a forward offset from given coordinates to place the zone,
-- and starts a thread to detect player presence and interaction for tour completion.
-- @param coords table A vector4-style coordinate table with x, y, z, w (heading).
function startDropoffZone(coords)
	local offset = 3.0
	local heading = coords.w
	local rad = math.rad(heading)

	local forwardX = -math.sin(rad) * offset
	local forwardY =  math.cos(rad) * offset

	local zoneCenter = vector3(coords.x + forwardX, coords.y + forwardY, coords.z)

	currentDropoffZone = BoxZone:Create(zoneCenter, 8.0, 10.0, {
		name = "taxi_dropoff_" .. currentTour.id,
		heading = coords.w,
		debugPoly = Config.Debug,
		minZ = coords.z - 2.0,
		maxZ = coords.z + 2.0
	})

	CreateThread(function()
		while true do
			Wait(0)
			if currentDropoffZone and currentDropoffZone:isPointInside(GetEntityCoords(PlayerPedId())) then
				local ped = PlayerPedId()
				local veh = GetVehiclePedIsIn(ped, false)

				if IsPedInAnyVehicle(ped, false) and veh ~= 0 and IsDriver() then
					if IsVehicleStopped(veh) then
						ShowHelp(Lang:t('input-dropoff')) -- E
						if IsControlJustReleased(0, 38) or IsControlJustReleased(1, 38) then
							endTourAtDestination()
							break
						end
					else
						ShowHelp(Lang:t('vehicle-stationary'))
					end
				end
			end
		end
	end)
end

--- Instructs the server to start the tourtimer
function startTourTimer()
	TriggerServerEvent("mbt_taxi:startServerTimer", currentTour.id)
end

--- Instructs the server to stop the tourtimer
function stopTourTimer()
	tourTimerActive = false
	SendNUIMessage({ action = "stopTimer" })
end

--- Monitors vehicle health during an active tour and handles damage-related cancellations.
-- Starts a background thread that checks body health every second,
-- increments crash count on damage, and cancels the tour if thresholds are exceeded.
function listenForVehicleDamage()
	CrashCount = 0
	local lastVehicleHealth = nil

	CreateThread(function()
		while currentTour do
			Wait(1000)

			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			if vehicle and vehicle ~= 0 then
				local currentHealth = GetVehicleBodyHealth(vehicle)

				if currentHealth < Config.MinCabHealth then
					TriggerEvent('mbt_taxi:client:cancelTour')
					Notify(Lang:t('vehicle-too-damaged'), 'error')
					break
				end

				if lastVehicleHealth and currentHealth < lastVehicleHealth - Config.DamageThreshold then
					CrashCount = CrashCount + 1

					if CrashCount >= Config.MaxCrashesAllowed then
						TriggerEvent('mbt_taxi:client:cancelTour')
						Notify(Lang:t('too-many-accidents'), 'error')
						break
					else
						local remaining = Config.MaxCrashesAllowed - CrashCount
						local word = Lang:t(remaining == 1 and 'accident' or 'accidents')
						Notify(string.format(Lang:t('accidents-left'), remaining, word), 'error')
					end
				end

				lastVehicleHealth = currentHealth
			else
				lastVehicleHealth = nil
			end
		end
	end)
end


--- Cleans up NPC passengers associated with a given tour.
-- Marks all tour-related peds as no longer needed and removes them from the active ped list.
-- @param tourId string|number Unique identifier of the tour to clean up.

function cleanupTourPeds(tourId)
	if Config.Debug then print("cleanup startet") end
	if activeTourPeds[tourId] then
		for _, ped in ipairs(activeTourPeds[tourId]) do
			SetEntityAsNoLongerNeeded(ped)
		end
		activeTourPeds[tourId] = nil
	end
end


-- ###########################
-- # EVENT HANDLER FUNCTIONS #
-- ###########################

--- Handles the client-side logic when a new tour is started via event.
-- Displays a notification, logs debug output if enabled, and initiates the tour setup.
-- @param tourData table Tour data object received from the server.
function handleStartTourEvent(tourData)
	Notify(Lang:t('tour-started'), 'success')
	if Config.Debug then
		print("[CLIENT] Tourstart: " .. tourData.id)
	end
	startTour(tourData)
end

--- Checks whether a given position is sufficiently distant from previous spawns.
-- @param pos vector3 The position to validate.
-- @return boolean True if the position is far enough, false otherwise.
function isFarEnough(pos)
	for _, other in ipairs(previousSpawns) do
		if #(pos - other) < 0.8 then
			return false
		end
	end
	return true
end

--- Spawns NPC passengers at the tour's pickup location.
-- Loads a set of ped models, creates the specified number of NPCs at randomized offsets,
-- freezes them in place, and stores references. If the local player is the assigned driver,
-- the tour is started immediately.
-- @param tour table Tour object containing ID, pickup location, NPC count, and ownership.
function handleSpawnTourPeds(tour)
	local isDriver = tour.claimedBy == GetPlayerServerId(PlayerId())
	if not isDriver then return end
	local pedModels = Config.PedModels

	RequestModelBatch(pedModels)

	local coords = Config.TourLocations[tour.from].coords
	local peds = {}

	for i = 1, tour.npcs do
		local offset = vector3(
			math.random(-100, 100) / 100.0, 
			math.random(-100, 100) / 100.0,
			0.0
		)
		local pos
		repeat
			local offset = vector3(math.random(-200, 200) / 100.0, math.random(-200, 200) / 100.0, 0.0)
			pos = coords.xyz + offset
		until isFarEnough(pos)

		table.insert(previousSpawns, pos)
		local ped = CreatePed(4, GetHashKey(pedModels[math.random(#pedModels)]), pos.x, pos.y, pos.z-0.5, coords.w, true, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		SetEntityInvincible(ped, true)
		FreezeEntityPosition(ped, true)
		NetworkRegisterEntityAsNetworked(ped)

		table.insert(peds, ped)
	end

	activeTourPeds[tour.id] = peds
	print (activeTourPeds[tour.id])
	if isDriver then
		startTour(tour)
	end
end

--- Handles NPC passenger pickup at the start location.
-- Validates vehicle type and seat availability, assigns passengers to free seats,
-- and monitors boarding. Falls back to teleporting peds if they get stuck.
-- Destroys pickup zone and blip, then starts the drive phase upon success.
function handlePickupPassengers()
	if currentPickupZone then
		currentPickupZone:destroy()
		currentPickupZone = nil
	end
	if currentPickupBlip then
		RemoveBlip(currentPickupBlip)
		currentPickupBlip = nil
	end

	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)

	if vehicle == 0 then
		Notify(Lang:t('vehicle-needed'), "error")
		return
	end
	
	local model = GetEntityModel(vehicle)
	local allowed = false
	for _, v in pairs(Config.AllowedVehicles) do
		if model == GetHashKey(v.model) then
			allowed = true
			break
		end
	end

	if not allowed then
		Notify(Lang:t('wrong-vehicle'), "error")
		return
	end

	-- Präferierte Sitzreihenfolge: hinten rechts, hinten links, dann vorne rechts
	local seatOrder = { 2, 1, 0 }

	-- Finde alle freien Plätze
	local availableSeats = {}
		for _, seat in ipairs(seatOrder) do
			if IsVehicleSeatFree(vehicle, seat) then
				table.insert(availableSeats, seat)
			end
		end

	local peds = activeTourPeds[currentTour.id]
	for i, ped in ipairs(peds) do
		local seat = availableSeats[i]
		if seat then
			FreezeEntityPosition(ped, false)
			TaskEnterVehicle(ped, vehicle, -1, seat, 1.0, 1, 0)
		else
			Notify(Lang:t('not-enough-seats'), "error")
			break
		end
	end

	CreateThread(function()
		local entered = 0
		local timeout = GetGameTimer() + 20000 -- 20 Sekunden maximal
		local pedsStuck = false

		while entered < #peds and currentTour do
			entered = 0
			for _, ped in ipairs(peds) do
				if IsPedInVehicle(ped, vehicle, false) then
					entered = entered + 1
				end
			end

			if GetGameTimer() > timeout then
				pedsStuck = true
				break
			end

			Wait(500)
		end

		if pedsStuck then
			-- Optional: Spieler benachrichtigen
			Notify(Lang:t('passengers-stuck'), "primary")

			-- Fallback: Alle Peds zwangsweise ins Fahrzeug setzen
			for i, ped in ipairs(peds) do
				local seat = availableSeats[i]
				if seat then
					TaskWarpPedIntoVehicle(ped, vehicle, seat)
				end
			end
		end

		-- Weiter wie gehabt
		Notify(Lang:t('passengers-boarded'), "success")
		startDrivePhase()
		TriggerServerEvent("mbt_taxi:confirmPedEntry", currentTour.id)
	end)
end

--- Resets all client-side data and UI elements related to the active tour.
-- Clears blips, zones, and current tour data, and resets the fare meter and timer display.
function handleClearTour()
	Notify(Lang:t('tour-concluded'), 'success')
	if currentTour then
		currentTour = nil
	end
	if currentPickupBlip then
		RemoveBlip(currentPickupBlip)
		currentPickupBlip = nil
	end
	if currentPickupZone then
		currentPickupZone:destroy()
		currentPickupZone = nil
	end
	if currentTargetBlip then
		RemoveBlip(currentTargetBlip)
		currentTargetBlip = nil
	end

	SendNUIMessage({ action = 'resetMeter' })
	SendNUIMessage({ action = 'stopTimer' })
end

--- Performs full cleanup of all tour-related client data and UI elements.
-- Clears current tour state, blips, zones, UI panels, and active NPCs for the given tour.
-- @param tour table Tour object containing the tour ID to clean up associated peds.
function handleCleanupTour(tour)
		if currentTour then
		currentTour = nil
	end
	if activeTourPeds[tour.id] then
		cleanupTourPeds(tour.id)
	end
	if currentPickupBlip then
		RemoveBlip(currentPickupBlip)
		currentPickupBlip = nil
	end
	if currentPickupZone then
		currentPickupZone:destroy()
		currentPickupZone = nil
	end
	if currentTargetBlip then
		RemoveBlip(currentTargetBlip)
		currentTargetBlip = nil
	end

	SendNUIMessage({ action = 'resetMeter' })
	SendNUIMessage({ action = 'stopTimer' })
	SendNUIMessage({ action = 'closeAll' })
end

--- Updates the remaining time display on the tour timer UI.
-- Sends the remaining time (in ms or seconds, depending on UI logic) to the NUI frontend.
-- @param remaining number Time remaining until timeout.
function handleUpdateTimer(remaining)
	SendNUIMessage({
		action = "updateTimer",
		remaining = remaining
	})
end

--- Stops the time display on the tour timer UI.
function handleStopTimer()
	SendNUIMessage({ action = "stopTimer" })
end

--- Attempts to open the tour selection menu if the player meets the requirements.
-- Checks if the player is in a whitelisted taxi vehicle and sends a server request if valid.
-- Displays an error notification if conditions are not met.
function handleOpenTourSelector()
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then
		if whitelistedVehicle() then
			TriggerServerEvent("mbt_taxi:checkIfCanOpenTourMenu")
		else
			Notify(Lang:t('wrong-vehicle'), 'error')
		end
	else
		Notify(Lang:t('vehicle-needed'), 'error')
	end
end

--- Requests tour information and allowes the Player to Open the tour selector UI
function handleAllowOpenTourMenu()
	uiShouldOpen = true
	TriggerServerEvent("mbt_taxi:requestTours")
end

--- Informs all taxi-drivers about newly available tours
function handleNotifyTourRefresh()
	local player = QBCore.Functions.GetPlayerData()
	if player.job and player.job.name == "taxi" then
		Notify(Lang:t('new-tours'), "primary")
	end
end

--- Displays the post-tour summary UI with earnings and performance data.
-- Formats all numerical and fallback values, then sends a summary payload to the NUI.
-- Enables NUI focus for user interaction.
-- @param data table Contains tour results such as earnings, distance, passengers, urgency, and timing.
function handleShowSummary(data)
	if data.bonus == -1 then
		data.bonus = 0
	end

	local timeLimit = (data.timeLimit and data.timeLimit ~= "?") and data.timeLimit or "–"
	local timeLeft = data.timeLeft or "–"

	local bonusFormatted = math.floor(data.bonus) or 0
	local baseFormatted = math.floor(data.baseEarnings) or 0
	local totalFormatted = math.floor(data.earnings) or 0
	local distanceFormatted = tostring(data.distance or "0.00")

	SendNUIMessage({
		action = "showSummary",
		from = data.from,
		to = data.to,
		bonus = bonusFormatted,
		earnings = totalFormatted,
		baseEarnings = baseFormatted,
		distance = distanceFormatted,
		passengers = data.passengers or 1,
		urgency = data.urgency or 1,
		timeLimit = timeLimit,
		timeLeft = timeLeft
	})

	SetNuiFocus(true, true)
end

-- Instructs the Server to cancel the current Tour
function handleCancelTour()
	TriggerServerEvent("mbt_taxi:cancelTour")
end

--- Synchronizes available tours received from the server and opens the UI if pending.
-- Stores the tour list locally, optionally opens the tour selection UI, and logs debug info if enabled.
-- @param tours table[] Array of tour objects with location and configuration data.
function handleSyncTours(tours)
	currentTours = tours
	if uiShouldOpen then
		uiShouldOpen = false
		openTourUI()
	end
	if Config.Debug then
		print("[CLIENT] Tourdaten empfangen:")
		for i, t in ipairs(tours) do
			local from = Config.TourLocations[t.from]
			local to = Config.TourLocations[t.to]
			print(string.format("[Tour %s] %s, %s, %s > %s, %s, %s | %d NPCs | Urgency: %d",
				t.id,
				from.LabelDetail,
				from.LabelStreet,
				from.LabelDistrict,
				to.LabelDetail,
				to.LabelStreet,
				to.LabelDistrict,
				t.npcs,
				t.urgency
			))
		end
	end
end

-- ##########
-- # EVENTS #
-- ##########

RegisterNetEvent("mbt_taxi:startTour", handleStartTourEvent)
RegisterNetEvent("mbt_taxi:spawnTourPeds", handleSpawnTourPeds)
RegisterNetEvent("mbt_taxi:pickupPassengers", handlePickupPassengers)
RegisterNetEvent("mbt_taxi:client:clearTour", handleClearTour)
RegisterNetEvent("mbt_taxi:cleanupTour", handleCleanupTour)
RegisterNetEvent("mbt_taxi:client:updateTimer", handleUpdateTimer)
RegisterNetEvent("mbt_taxi:client:stopTimer", handleStopTimer)
RegisterNetEvent("mbt_taxi:client:openTourSelector", handleOpenTourSelector)
RegisterNetEvent("mbt_taxi:allowOpenTourMenu", handleAllowOpenTourMenu)
RegisterNetEvent("mbt_taxi:notify_TourRefresh", handleNotifyTourRefresh)
RegisterNetEvent("mbt_taxi:client:showSummary", handleShowSummary)
RegisterNetEvent("mbt_taxi:client:cancelTour", handleCancelTour)
RegisterNetEvent("mbt_taxi:syncTours", handleSyncTours)

-- ###########
-- # THREADS #
-- ###########

--- Continuous pickup zone monitor thread.
-- Checks if the player is inside the pickup zone and in a valid, stopped taxi.
-- If conditions are met and the interaction key is pressed, triggers passenger pickup.
-- Cancels the tour if vehicle damage exceeds the allowed threshold.
CreateThread(function()
	while true do
		Wait(0)
		if currentPickupZone and currentPickupZone:isPointInside(GetEntityCoords(PlayerPedId())) then
			local ped = PlayerPedId()
			local veh = GetVehiclePedIsIn(ped, false)

			if IsPedInAnyVehicle(ped, false) and veh ~= 0 and IsDriver() then
				if IsVehicleStopped(veh) then
					local currentHealth = GetVehicleBodyHealth(veh)

					if currentHealth < Config.MinCabHealth then
						TriggerEvent('mbt_taxi:client:cancelTour')
						Notify(Lang:t('vehicle-too-damaged'), 'error')
						break
					else
						ShowHelp(Lang:t('input-pickup'))
						if IsControlJustReleased(0, 38) or IsControlJustReleased(1, 38) then
							TriggerEvent("mbt_taxi:pickupPassengers")
						end
					end
				else
					ShowHelp(Lang:t('vehicle-stationary'))
				end
			end
		end
	end
end)

-- ################
-- # NUI CALLBACK #
-- ################

RegisterNUICallback("selectTour", function(data, cb)
	local tourId = data.id
	if Config.Debug then
		print("[CLIENT] Tour angenommen: " .. tostring(tourId))
	end
	TriggerServerEvent("mbt_taxi:selectTour", tourId)
	cb({ status = "ok" })
end)

RegisterNUICallback("closeUI", function(_, cb)
	SetNuiFocus(false, false)
	cb({})
end)


--==========================================================
--                   METER SYSTEM
--==========================================================



-- #############
-- # FUNCTIONS #
-- #############

function ToggleMeterVisibility()
	SendNUIMessage({ action = "toggleMeter" })
end

--- Starts a background thread to track tour distance and update the fare meter.
-- Calculates distance traveled using the GPS route length and updates the NUI every second.
-- Only runs if the player is the driver and in a valid vehicle. Prevents multiple instances.
function startMeterTracking()
	if meterThread then return end

	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	if vehicle == 0 then return end

	lastPosition = GetEntityCoords(playerPed)
	local routeInitialized = false
	local startingLength = 0.0
	local distanceLeft = 0.0

	meterThread = CreateThread(function()
		while currentTour and currentTour.status == "driving" do
			Wait(1000)

			if not IsPedInAnyVehicle(playerPed, false) or not IsDriver() then
				goto continue
			end

			if not routeInitialized then
				startingLength = GetGpsBlipRouteLength()
				routeInitialized = true
			end

			local currentLength = GetGpsBlipRouteLength()
			if currentLength == 0 then goto continue end
			if currentLength > distanceLeft and distanceLeft ~= 0 then goto continue end

			distanceLeft = currentLength
			local distanceTraveled = startingLength - distanceLeft
			if distanceTraveled < 0 then distanceTraveled = 0 end

			currentTour.distance = distanceTraveled
			currentTour.fare = ((distanceTraveled / 1000) * Config.Meter.defaultPrice) + (Config.Meter.startingPrice or 0.0)

			SendNUIMessage({
				action = "updateMeter",
				meterData = {
					currentFare = currentTour.fare,
					distanceTraveled = distanceTraveled / 1000
				}
			})

			::continue::
		end
	end)
end

--- Stops the active fare meter tracking thread.
-- Terminates the thread responsible for distance and fare calculation and resets the reference.
function stopMeterTracking()
	if meterThread then
		TerminateThread(meterThread)
		meterThread = nil
		meterStarted = false
	end
end

-- ###########################
-- # EVENT HANDLER FUNCTIONS #
-- ###########################

--- Toggles the visibility of the taximeter UI outside of active tours.
-- Displays an error if a tour is currently in progress; otherwise toggles UI visibility.
function handleToggleMeterVisibility()
	if currentTour then
		Notify(Lang:t('denied-active-tour'), "error")
		return
	end
	ToggleMeterVisibility()
end

--- Resets the manual fare meter when no tour is active.
-- Clears distance and fare values, sets new starting position, and updates the UI.
-- Displays an error if a tour is currently active.
function handleResetManualMeter()
	if currentTour then
		Notify(Lang:t('denied-active-tour'), "error")
		return
	end

	manualDistance = 0.0
	manualFare = Config.Meter.startingPrice or 0.0
	manualLastPos = GetEntityCoords(PlayerPedId())

	SendNUIMessage({
		action = "updateMeter",
		meterData = {
			currentFare = manualFare,
			distanceTraveled = 0.0
		}
	})

	Notify(Lang:t('meter-reset'), "primary")
end

--- Toggles the manual fare meter for non-tour rides.
-- Starts or stops fare tracking based on distance traveled while driving a valid taxi vehicle.
-- Rejects manual activation if a tour is active or player conditions aren't met.
-- Also mirrors fare data to all passengers in the vehicle.
function handleToggleManualMeter()
	if currentTour then
		Notify(Lang:t('denied-active-tour'), "error")
		return
	end

	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped, false) or not IsDriver() or not whitelistedVehicle() then
		Notify(Lang:t('cab-needed'), "error")
		return
	end

	if not manualMeterIsActive then
		manualLastPos = GetEntityCoords(ped)
		manualDistance = 0.0
		manualFare = Config.Meter.startingPrice or 0.0

		SendNUIMessage({
			action = "startMeter",
			meterData = {
				defaultPrice = Config.Meter.defaultPrice or 3.5,
				currentFare = manualFare,
				distanceTraveled = 0.0,
				tour = {
					id = "Manual",
					from = "-",
					to = "-"
				}
			}
		})

		manualMeterIsActive = true

		manualMeterThread = CreateThread(function()
			while manualMeterIsActive do
				Wait(1000)

				local currentPos = GetEntityCoords(PlayerPedId())
				local dist = #(manualLastPos - currentPos)
				manualLastPos = currentPos
				manualDistance = manualDistance + dist
				manualFare = ((manualDistance / 1000.0) * Config.Meter.defaultPrice) + Config.Meter.startingPrice

				SendNUIMessage({
					action = "updateMeter",
					meterData = {
						currentFare = manualFare,
						distanceTraveled = manualDistance / 1000.0
					}
				})

				local veh = GetVehiclePedIsIn(PlayerPedId(), false)
				local seats = {}

				for i = -1, GetVehicleMaxNumberOfPassengers(veh) do
					local ped = GetPedInVehicleSeat(veh, i)
					if ped ~= 0 and ped ~= PlayerPedId() then
						table.insert(seats, GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)))
					end
				end

				for _, id in ipairs(seats) do
					TriggerServerEvent("mbt_taxi:mirrorMeterTo", id, {
						fare = manualFare,
						distance = manualDistance / 1000.0
					})
				end

				TriggerServerEvent("mbt_taxi:syncMeterToPassengers", {
					fare = manualFare,
					distance = manualDistance / 1000.0
				})
			end
		end)

		Notify(Lang:t('meter-started'), "success")
	else
		manualMeterIsActive = false
		Notify(Lang:t('meter-stopped'), "error")
	end
end

--- Starts or updates the fare meter UI for passengers based on mirrored data.
-- Receives fare and distance information from the driver's manual meter and updates the display.
-- @param data table Contains 'fare' (number) and 'distance' (number in km).
function handleMirrorMeter(data)
	SendNUIMessage({
		action = "startMeter",
		meterData = {
			currentFare = data.fare,
			distanceTraveled = data.distance,
			tour = {
				id = "PassengerView",
				from = "-",
				to = "-"
			}
		}
	})
end

-- ##########
-- # EVENTS #
-- ##########

RegisterNetEvent("mbt_taxi:client:toggleMeterVisibility", handleToggleMeterVisibility)
RegisterNetEvent("mbt_taxi:client:resetManualMeter", handleResetManualMeter)
RegisterNetEvent("mbt_taxi:client:toggleManualMeter", handleToggleManualMeter)
RegisterNetEvent("mbt_taxi:client:mirrorMeter", handleMirrorMeter)

-- ###########
-- # THREADS #
-- ###########


--- Continuous UI sync thread for the active fare meter.
-- Sends current fare and distance data to the NUI every 100 ms during an active tour.
-- Ensures the meter display remains up to date regardless of internal tracking frequency.
CreateThread(function()
	while true do
		Wait(100)
		if currentTour and meterStarted then
			SendNUIMessage({
				action = "updateMeter",
				meterData = {
					currentFare = currentTour.fare or 0.0,
					distanceTraveled = (currentTour.distance or 0.0) / 1609.34
				}
			})
		end
	end
end)

--- Monitors player death state to cancel active tours if the player dies.
-- Runs every second and triggers a server event when the player dies during a tour.
-- Resets the internal state once the player respawns or is revived.
CreateThread(function()
	while true do
		Wait(1000) -- 1 Sekunde reicht
		local ped = PlayerPedId()
		local isDead = IsEntityDead(ped)

		if isDead and not wasDead then
			wasDead = true
			if currentTour then
				TriggerServerEvent("mbt_taxi:playerDied", currentTour.id)
			end
		elseif not isDead and wasDead then
			wasDead = false
		end
	end
end)

--- Periodically checks for vehicle presence during an active tour.
-- If the player is not in a vehicle and their last vehicle no longer exists,
-- a cancellation is triggered and the player is notified.
CreateThread(function()
	while true do
		Wait(2000)

		if currentTour and currentTour.status ~= "completed" then
			local ped = PlayerPedId()
			local veh = GetVehiclePedIsIn(ped, false)

			-- Falls Spieler nicht im Fahrzeug, aber ein Fahrzeug gespeichert ist
			if veh == 0 then
				-- Suche gespeichertes Fahrzeug über Sitz oder vorherige Referenz
				local lastVeh = GetVehiclePedIsTryingToEnter(ped)

				if not DoesEntityExist(lastVeh) then
					Notify(Lang:t('vehicle-lost'), "error")
					TriggerServerEvent("mbt_taxi:cancelTour")
				end
			end
		end
	end
end)