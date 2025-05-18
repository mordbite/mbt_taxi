-- ########
-- # INIT #
-- ########

local QBCore = exports['qb-core']:GetCoreObject()

local tourCounter = 0
local activeTours = {}
local lastTourRefreshTime = 0


-- ###############
-- # ID & LOOKUP #
-- ###############

function CountTourLocations()
	local count = 0
	for _ in pairs(Config.TourLocations) do
		count = count + 1
	end
	return count
end

function GenerateTourID()
	tourCounter = tourCounter + 1
	return string.format("T%04d", tourCounter)
end

function GetActiveTour(tourId)
	for _, t in ipairs(activeTours) do
		if t.id == tourId then
			return t
		end
	end
	return nil
end

-- ################################
-- # TOUR GENERATION & VALIDATION #
-- ################################

--- Validates whether the distance between two tour locations meets the minimum requirement.
-- Returns false if the locations are identical, or if the distance is below the configured threshold.
-- @param fromKey string Key of the starting location in Config.TourLocations.
-- @param toKey string Key of the destination location in Config.TourLocations.
-- @return boolean True if the distance is valid, false otherwise.
function CheckDistance(fromKey, toKey)
	if fromKey == toKey then return false end

	local a = Config.TourLocations[fromKey].coords
	local b = Config.TourLocations[toKey].coords
	local dist = #(vector3(a.x, a.y, a.z) - vector3(b.x, b.y, b.z))

	if Config.Debug then
		print(("[DIST] %s → %s = %.2f m"):format(fromKey, toKey, dist))
	end

	return dist >= Config.MinTourDistance
end


--- Returns a randomly selected urgency level based on configured weights.
-- Uses weighted randomness to favor certain urgency levels over others,
-- as defined in `Config.UrgencyWeights`.
-- @return number The selected urgency level (e.g. 1–5).
function GetWeightedUrgency()
	local totalWeight = 0
	for _, weight in pairs(Config.UrgencyWeights) do
		totalWeight = totalWeight + weight
	end

	local rand = math.random(1, totalWeight)
	local cumulative = 0

	for urgency, weight in pairs(Config.UrgencyWeights) do
		cumulative = cumulative + weight
		if rand <= cumulative then
			return urgency
		end
	end

	return 1
end

--- Determines if a tour start–end pair is valid for generation.
-- Ensures the locations are distinct, not already used, and meet minimum distance requirements.
-- @param from string Start location key.
-- @param to string Destination location key.
-- @param existingPairs table Set of already used tour pairs in the format "from_to".
-- @return boolean True if the pair is valid, false otherwise.
function IsValidTourPair(from, to, existingPairs)
	if from == to then return false end
	if existingPairs[from .. "_" .. to] then return false end
	if not CheckDistance(from, to) then return false end
	return true
end

--- Checks whether a given start location has already been used in tour generation.
-- Prevents reuse of the same `from` location within a batch.
-- @param from string Start location key to check.
-- @param usedFrom table Set or map of already used 'from' locations.
-- @return boolean True if the location is available, false if already used.
function IsFromLocationAvailable(from, usedFrom)
	return not usedFrom[from]
end

--- Constructs a new tour table with randomized and default parameters.
-- Generates a unique ID, assigns start and end locations, randomizes passenger count (1–3),
-- and selects an urgency level using weighted randomness.
-- @param from string Start location key.
-- @param to string Destination location key.
-- @return table A fully initialized tour object.
local function BuildTour(from, to)
	return {
		id = GenerateTourID(),
		from = from,
		to = to,
		npcs = math.random(1, 3),
		urgency = GetWeightedUrgency(),
		claimedBy = nil
	}
end

--- Generates a set of unique taxi tours and adds them to the active pool.
-- Retains currently claimed tours, avoids duplicate start–end pairs and reused 'from' locations,
-- and builds new valid tours up to the specified count or a capped number of attempts.
-- Broadcasts the updated tour list to all clients upon completion.
-- @param count number Number of new tours to generate.
function GenerateTours(count)
	local retained = {}
	local existingPairs = {}
	local usedFrom = {}

	for _, t in ipairs(activeTours) do
		if t.claimedBy then
			table.insert(retained, t)
		else
			existingPairs[t.from .. "_" .. t.to] = true
			usedFrom[t.from] = true
		end
	end

	activeTours = retained
	local startingCount = #retained

	local locationKeys = {}
	for k in pairs(Config.TourLocations) do
		table.insert(locationKeys, k)
	end

	local tries = 0
	local maxTries = count * 10

	while #activeTours < startingCount + count and tries < maxTries do
		tries = tries + 1

		local from = locationKeys[math.random(#locationKeys)]
		local to = locationKeys[math.random(#locationKeys)]

		if IsValidTourPair(from, to, existingPairs) and IsFromLocationAvailable(from, usedFrom) then
			local tour = BuildTour(from, to)
			table.insert(activeTours, tour)
			existingPairs[from .. "_" .. to] = true
			usedFrom[from] = true
		end
	end

	if #activeTours < startingCount + count and Config.Debug then
		print(("\27[33m[WARNUNG]\27[0m Only %d of %d Tours generated (after %d tries)"):format(
			#activeTours - startingCount, count, tries
		))
	end

	if Config.Debug then
		print(("\27[32m[INFO]\27[0m Successfully generated %d tours after %d tries."):format(#activeTours - startingCount, tries))
	end

	TriggerClientEvent("mbt_taxi:syncTours", -1, activeTours)
end

-- #################################
-- # TIMELIMIT & BONUS CALCULATION #
-- #################################


--- Calculates the allowed time limit for a tour based on distance and urgency.
-- Applies a configurable time-per-kilometer baseline and subtracts a fixed amount per urgency level.
-- @param tour table The tour object containing 'from', 'to', and 'urgency' fields.
-- @return number Time limit in seconds for completing the tour.
function CalculateTimeLimit(tour)
	local fromVec = Config.TourLocations[tour.from].coords
	local toVec = Config.TourLocations[tour.to].coords

	local dist = #(vector3(fromVec.x, fromVec.y, fromVec.z) - vector3(toVec.x, toVec.y, toVec.z))
	local distKm = dist / 1000.0

	local urgency = tour.urgency
	local secondsPerKm = Config.TimeLimit.secondsPerKm - ((urgency - 1) * Config.TimeLimit.reductionPerUrgency)

	local totalSeconds = math.floor(secondsPerKm * distKm)

	if Config.Debug then
		print(("[TIMER] Distance %.1fm, Urgency %d → %d seconds"):format(dist, urgency, totalSeconds))
	end

	return totalSeconds
end

--- Converts a number of seconds into a formatted MM:SS string.
-- Ensures zero-padding and clamps negative input to zero.
-- @param seconds number Duration in seconds.
-- @return string Time formatted as "MM:SS".
local function formatTime(seconds)
	if seconds < 0 then seconds = 0 end
	local m = math.floor(seconds / 60)
	local s = seconds % 60
	return string.format("%02d:%02d", m, s)
end

--- Starts a timeout countdown for a claimed tour where passengers have not yet entered the vehicle.
-- If the timeout expires and the tour is still unstarted, it is automatically canceled
-- and the client is notified. Used to prevent blocked tour slots.
-- @param tourId string|number The ID of the claimed tour.
-- @param playerId number Server ID of the player who claimed the tour.
function StartTourTimeout(tourId, playerId)
    local timeout = Config.TourTimeout or 90 
    CreateThread(function()
        Wait(timeout * 1000)

        local tour = GetActiveTour(tourId)
        if tour and tour.claimedBy == playerId and not tour.pedsInVehicle then
            CancelTour(tourId, "timeout", playerId)
            TriggerClientEvent("mbt_taxi:tourTimeout", playerId, tourId)
			if Config.Debug then
				print("[TOUR] Tour " .. tourId .. " abgebrochen: Timeout beim Einstieg")
			end
        end
    end)
end

-- ###################
-- # TOUR CONCLUSION #
-- ###################

--- Cancels an active tour and notifies the involved player and all clients.
-- Frees up the tour for reassignment, triggers cleanup events, and shows a localized message
-- depending on the cancellation reason.
-- @param tourId string|number ID of the tour to cancel.
-- @param reason string Cancellation reason ("timeout", "manual", etc.), used for message selection.
-- @param src number|nil Optional server ID of the canceling player; falls back to claimedBy.
-- @return boolean True if the tour was found and canceled, false otherwise.
function CancelTour(tourId, reason, src)
	for i, t in ipairs(activeTours) do
		if t.id == tourId then
			local playerId = src or t.claimedBy
			if playerId then
				TriggerClientEvent("mbt_taxi:cleanupTour", -1, t)
				TriggerClientEvent("QBCore:Notify", playerId,
					reason == "timeout" and Lang:t('inactivity') or Lang:t('tour-canceled'),
					reason == "timeout" and "error" or "primary"
				)
			end

			if Config.Debug then
				print(("[TOUR] Tour %s canceled. Reason: %s | PlayerID: %s"):format(
					t.id, reason or "unbekannt", tostring(playerId)
				))
			end

			t.claimedBy = nil
			return true
		end
	end
	return false
end

-- ##################
-- # EVENT HANDLERS #
-- ##################

--- Handles a client request for available (unclaimed) taxi tours.
-- Filters the active tour list to include only unclaimed entries
-- and sends them to the requesting client.
function handleRequestTours()
	local src = source
	local unclaimedTours = {}

	for _, t in ipairs(activeTours) do
		if t.claimedBy == nil then
			table.insert(unclaimedTours, t)
		end
	end

	TriggerClientEvent("mbt_taxi:syncTours", src, unclaimedTours)
end

--- Handles a player's request to claim a specific tour.
-- Assigns the tour if unclaimed, starts the timeout timer, and triggers NPC spawning.
-- Sends appropriate feedback to the player if the tour is already claimed or not found.
-- @param tourId string|number ID of the tour the player is attempting to claim.
function handleSelectTour(tourId)
	local src = source
	for _, t in ipairs(activeTours) do
		if t.id == tourId then
			if t.claimedBy == nil then
				t.claimedBy = src
				StartTourTimeout(t.id, src)
				local fromVec = Config.TourLocations[t.from].coords
				local toVec = Config.TourLocations[t.to].coords
				local dist = #(vector3(fromVec.x, fromVec.y, fromVec.z) - vector3(toVec.x, toVec.y, toVec.z)) / 1000.0

				local secondsPerKm = Config.TimeLimit.secondsPerKm - ((t.urgency - 1) * Config.TimeLimit.reductionPerUrgency)

				TriggerClientEvent("mbt_taxi:spawnTourPeds", -1, t)

				if Config.Debug then
					print(("[SERVER] Player %d claimed tour %s"):format(src, t.id))
				end
			else
				TriggerClientEvent("QBCore:Notify", src, Lang:t('tour-already-claimed'), "error")
			end
			return
		end
	end

	TriggerClientEvent("QBCore:Notify", src, Lang:t('tour-not-found'), "error")
end

--- Finalizes a completed tour, calculates payout, and displays a summary to the player.
-- Applies urgency-based bonus or penalty depending on arrival time vs. deadline,
-- adds money to the player's account, removes the tour from the active list,
-- and triggers client-side UI updates with completion details.
-- @param tourId string|number ID of the completed tour.
-- @param data table Tour result data (includes 'fare', 'distance', 'urgency').
function handleEndTour(tourId, data)
	local src = source
	local player = QBCore.Functions.GetPlayer(src)
	if not tourId or not data then 
		print("[WARNING] Invalid Tour Parameters | PlayerID: " .. player.id)
		return 
	end
	if not player then return end

	for i, t in ipairs(activeTours) do
		if t.id == tourId then
			local now = os.time()
			local overtime = now - (t.deadline or now)

			local bonusFactor = 1.0
			local urgencyCfg = Config.UrgencySettings[data.urgency or 1]

			if urgencyCfg.hasTimeLimit then
				if overtime > Config.GracePeriod then
					bonusFactor = 1.0 - (urgencyCfg.penalty / 100.0)
				elseif overtime <= 0 then
					bonusFactor = 1.0 + (urgencyCfg.bonus / 100.0)
				end
			end

			local fare = data.fare or 0.0
			local earnings = math.floor(fare * bonusFactor)
			if earnings < 0 then earnings = 0 end

			player.Functions.AddMoney("cash", earnings, "Taxi Tour Completed")

			local from = Config.TourLocations[t.from]
			local to = Config.TourLocations[t.to]
			local bonus = math.floor(earnings - fare)
			local km = string.format("%.2f", (data.distance or 0.0) / 1000.0)

			local timeLimit = t.deadline and formatTime(t.deadline - t.startTime) or "?"
			local timeLeft = formatTime((t.deadline or now) - now)

			TriggerClientEvent("mbt_taxi:client:clearTour", src)
			TriggerClientEvent("mbt_taxi:client:showSummary", src, {
				from = string.format("%s, %s, %s", from.LabelDistrict, from.LabelStreet, from.LabelDetail),
				to = string.format("%s, %s, %s", to.LabelDistrict, to.LabelStreet, to.LabelDetail),
				bonus = bonus,
				earnings = earnings,
				baseEarnings = fare,
				distance = km,
				passengers = t.npcs or 1,
				urgency = t.urgency or 1,
				timeLimit = timeLimit,
				timeLeft = timeLeft
			})

			table.remove(activeTours, i)

			if Config.Debug then
				print(("[TOUR ENDE] %s | Auszahlung: $%d | Bonus: %d | Overtime: %ds"):format(
					t.id, earnings, bonus, overtime
				))
			end

			break
		end
	end
end

--- Cancels the currently active tour for the requesting player.
-- Searches the active tour list for a tour claimed by the player and cancels it with reason "manual".
-- If no tour is found, the player receives a notification.
function handleCancelTour()
	local src = source
	for _, t in ipairs(activeTours) do
		if t.claimedBy == src then
			CancelTour(t.id, "manual", src)
			return
		end
	end

	TriggerClientEvent("QBCore:Notify", src, Lang:t('no-active-tour'), "error")
end

--- Marks a tour as confirmed once the NPC passengers have entered the vehicle.
-- Ensures the correct player owns the tour before setting the confirmation flag.
-- Used to prevent timeouts or premature cancellations.
-- @param tourId string|number The ID of the tour being confirmed.
function handleConfirmPedEntry(tourId)
	local src = source
	for _, t in ipairs(activeTours) do
		if t.id == tourId and t.claimedBy == src then
			t.pedsInVehicle = true
			if Config.Debug then
				print(("[SERVER] Tour %s bestätigt: Peds sitzen im Fahrzeug (Spieler %d)"):format(tourId, src))
			end
			break
		end
	end
end

--- Starts the server-side timer for a tour, calculating its deadline based on urgency and distance.
-- Stores start time, total time, and deadline on the tour object, then notifies the client.
-- Ensures the timer is only started by the player who owns the tour.
-- @param tourId string|number ID of the tour to start timing for.
function handleStartServerTimer(tourId)
	local src = source
	for _, t in ipairs(activeTours) do
		if t.id == tourId and t.claimedBy == src then
			t.startTime = os.time()
			local fromVec = Config.TourLocations[t.from].coords
			local toVec = Config.TourLocations[t.to].coords
			local dist = #(vector3(fromVec.x, fromVec.y, fromVec.z) - vector3(toVec.x, toVec.y, toVec.z)) / 1000.0

			local secondsPerKm = Config.TimeLimit.secondsPerKm - ((t.urgency - 1) * Config.TimeLimit.reductionPerUrgency)
			t.totalTime = math.floor(secondsPerKm * dist)
			t.deadline = t.startTime + t.totalTime
			t.timerMarkedAsExpired = false

			TriggerClientEvent("mbt_taxi:client:startTimer", src, t.totalTime)

			if Config.Debug then
				print(("[SERVER] Tour %s: Timer gestartet (%ds) | Deadline bei %d"):format(t.id, t.totalTime, t.deadline))
			end

			break
		end
	end
end

--- Mirrors the current meter data to a specific passenger client.
-- Used to synchronize fare and distance display for passengers during a manual tour.
-- @param targetId number Server ID of the target client.
-- @param meterData table Meter data including fare and distance values.
function handleMirrorMeterTo(targetId, meterData)
	TriggerClientEvent("mbt_taxi:client:mirrorMeter", targetId, meterData)
end

--- Handles tour cancellation when a player dies during an active tour.
-- Verifies ownership before canceling and logs the event if debugging is enabled.
-- @param tourId string|number ID of the tour associated with the deceased player.
function handlePlayerDied(tourId)
	local src = source
	local tour = GetActiveTour(tourId)
	if tour and tour.claimedBy == src then
		CancelTour(tour.id, "death", src)
		if Config.Debug then
			print(("[TOUR] Spieler %d gestorben – Tour %s abgebrochen."):format(src, tour.id))
		end
	end
end

--- Validates whether the requesting player is eligible to open the tour selection menu.
-- Denies access if the player has already claimed an active tour,
-- otherwise allows the client to proceed with UI opening.
function handleCheckIfCanOpenTourMenu()
	local src = source

	for _, t in ipairs(activeTours) do
		if t.claimedBy == src then
			TriggerClientEvent("QBCore:Notify", src, Lang.t('already-tour'), "error")
			return
		end
	end
	TriggerClientEvent("mbt_taxi:allowOpenTourMenu", src)
end

-- ##########
-- # EVENTS #
-- ##########

--- Initializes the taxi system when the resource starts.
-- Prints status messages, resets the tour counter, and generates a predefined number of tours.
-- @param res string The name of the resource that was started.
AddEventHandler('onResourceStart', function(res)
	local total = CountTourLocations()
	print(("^3[mbt_taxi]^0 Taxi-System initialized. %d Tour Locations loaded."):format(total))
	if Config.Debug then
		print("^5[DEBUG]^0 Debug Mode active")
	end

	if res == GetCurrentResourceName() then
		tourCounter = 0
		GenerateTours(Config.TourCount)
	end
end)

AddEventHandler('playerJoining', function(src)
	TriggerClientEvent("mbt_taxi:syncTours", src, activeTours)
end)

--- Frees up any claimed tours when a player disconnects from the server.
-- Removes the player's claim from their active tour, allowing it to be reassigned.
-- @param reason string Reason provided by the player disconnect event.
AddEventHandler("playerDropped", function(reason)
	local src = source
	for _, t in ipairs(activeTours) do
		if t.claimedBy == src then
			t.claimedBy = nil
			if Config.Debug then
				print(("[SERVER] Spieler %d hat den Server verlassen → Tour %s wieder freigegeben"):format(src, t.id))
			end
		end
	end
end)

RegisterNetEvent("mbt_taxi:requestTours", handleRequestTours)
RegisterNetEvent("mbt_taxi:selectTour", handleSelectTour)
RegisterNetEvent("mbt_taxi:endTour", handleEndTour)
RegisterNetEvent("mbt_taxi:cancelTour", handleCancelTour)
RegisterNetEvent("mbt_taxi:confirmPedEntry", handleConfirmPedEntry)
RegisterNetEvent("mbt_taxi:startServerTimer", handleStartServerTimer)
RegisterNetEvent("mbt_taxi:mirrorMeterTo", handleMirrorMeterTo)
RegisterNetEvent("mbt_taxi:checkIfCanOpenTourMenu", handleCheckIfCanOpenTourMenu)
RegisterNetEvent("mbt_taxi:playerDied", handlePlayerDied)

RegisterNetEvent("mbt_taxi:generateTours", function()
	local src = source
	GenerateTours(Config.TourCount)
end)	

-- ###########
-- # THREADS #
-- ###########

--- Periodically refreshes the pool of available taxi tours based on a configured interval.
-- Prevents frequent updates by enforcing a minimum refresh delay.
-- Generates new tours and notifies all clients when triggered.
CreateThread(function()
	while true do
		Wait(Config.TourRefreshInterval * 1000)

		local now = os.time()
		local secondsSinceLast = now - lastTourRefreshTime

		if secondsSinceLast < 5 then
			if Config.Debug then
				print(("[TOUR] Skipped Reset – last update %ds ago"):format(secondsSinceLast))
			end
		else
			lastTourRefreshTime = now
			if Config.Debug then
				print("[TOUR] Auto Reset - New tours generated")
			end
			GenerateTours(Config.TourCount)
			TriggerClientEvent("mbt_taxi:notify_TourRefresh", -1)
		end
	end
end)

--- Monitors the current tour pool and regenerates tours if all have been claimed or completed.
-- Waits 5 seconds between checks, and enforces a minimum delay between resets.
-- Notifies all clients when a new set of tours is generated.
CreateThread(function()
	while true do
		Wait(5000)

		local unclaimed = 0
		for _, t in ipairs(activeTours) do
			if not t.claimedBy then
				unclaimed = unclaimed + 1
			end
		end

		if unclaimed == 0 then
			local now = os.time()
			local secondsSinceLast = now - lastTourRefreshTime

			if secondsSinceLast >= 5 then
				lastTourRefreshTime = now

				if Config.Debug then
					print("[TOUR] All tours claimed or completet - New tours generated")
				end

				GenerateTours(Config.TourCount)
				TriggerClientEvent("mbt_taxi:notify_TourRefresh", -1)
			else
				if Config.Debug then
					print(("[TOUR] Skipped Reset – last update %ds ago"):format(secondsSinceLast))
				end
			end
		end
	end
end)

--- Continuously monitors active tours for timer expiration and grace period violations.
-- Sends live countdown updates to clients and triggers warnings or penalty notices
-- when deadlines or grace periods are exceeded.
-- Runs every second and ensures each event is only triggered once per tour.
CreateThread(function()
	while true do
		Wait(1000)
		local now = os.time()
		for _, t in ipairs(activeTours) do
			if t.claimedBy and t.deadline then
				local remaining = t.deadline - now
				local overtime = now - t.deadline
				if remaining <= 0 and not t.timerMarkedAsExpired then
					t.timerMarkedAsExpired = true
					TriggerClientEvent("mbt_taxi:client:stopTimer", t.claimedBy)
					TriggerClientEvent("QBCore:Notify", t.claimedBy, Lang:t('no-bonus'), "error")
				end
				if overtime > Config.GracePeriod and not t.graceExpiredNotified then
					t.graceExpiredNotified = true
					TriggerClientEvent("QBCore:Notify", t.claimedBy, Lang:t('fines-active'), "error")
				end
				TriggerClientEvent("mbt_taxi:client:updateTimer", t.claimedBy, math.max(0, remaining))
			end
		end
	end
end)

-- ############
-- # COMMANDS #
-- ############

RegisterCommand("debugTours", function(src)
	for _, t in ipairs(activeTours) do
		print(('- %s: %s > %s (%d NPCs, Urgency %d)'):format(t.id, t.from, t.to, t.npcs, t.urgency))
	end
end, true)

RegisterCommand("showClaimedTours", function(src)
	if src ~= 0 then return print("Nur über Konsole verfügbar.") end
	for _, t in ipairs(activeTours) do
		if t.claimedBy then
			print(('- %s von %s → %s | Spieler %d'):format(t.id, t.from, t.to, t.claimedBy))
		end
	end
end, true)
