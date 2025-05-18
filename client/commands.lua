RegisterCommand("cancelTour", function()
    TriggerServerEvent("mbt_taxi:cancelTour")
end, false)

RegisterCommand("savetour", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local heading = GetEntityHeading(playerPed)

	local streetHash, crossingHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
	local streetName = GetStreetNameFromHashKey(streetHash)
	local zoneName = GetNameOfZone(coords.x, coords.y, coords.z)
	local district = GetLabelText(zoneName)

	-- Eingabeaufforderung für Identifier
	local identifier = keyboardInput("Identifier (z.B. 'airport_dropoff')", "", 30)
	if not identifier then return end

	-- Eingabeaufforderung für Detail
	local detail = keyboardInput("Detailbeschreibung (z.B. 'Terminal A - Westseite')", "", 50)
	if not detail then return end

	local text = string.format(
		'["%s"] = {\n\tcoords = vector4(%.2f, %.2f, %.2f, %.2f),\n\tLabelDistrict = "%s",\n\tLabelStreet = "%s",\n\tLabelDetail = "%s"\n},',
		identifier, coords.x, coords.y, coords.z, heading, district, streetName, detail
	)

	-- In Chat anzeigen
	print(text)
	TriggerEvent('chat:addMessage', { args = { "TourLocation:", text } })

	SendNUIMessage({ action = "tempShow" })
	Wait(50)  -- 1–2 Frames reichen meist
	-- In Zwischenablage kopieren (per NUI)
	SendNUIMessage({
		action = "copyToClipboard",
		text = text
	})
end)

function keyboardInput(text, exampleText, maxLength)
	AddTextEntry("FMMC_KEY_TIP1", text .. ":")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", exampleText, "", "", "", maxLength)
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Wait(0)
	end
	if UpdateOnscreenKeyboard() ~= 1 then return nil end
	return GetOnscreenKeyboardResult()
end