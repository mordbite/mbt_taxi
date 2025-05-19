--	mbt_taxi
--	License: CC BY-NC-SA 4.0 – https://creativecommons.org/licenses/by-nc-sa/4.0/
--	Developed by Mordbite, 2025

local QBCore = exports['qb-core']:GetCoreObject()

-- ##########
-- # EVENTS #
-- ##########

AddEventHandler("onClientResourceStart", function(res)
	if res == GetCurrentResourceName() then
		TriggerServerEvent("mbt_taxi:requestTours")

		CreateThread(function()
			Wait(100)
			TriggerEvent("mbt_taxi:client:initDepot")
		end)
	end
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	TriggerServerEvent("mbt_taxi:requestTours")

		CreateThread(function()
			Wait(100)
			TriggerEvent("mbt_taxi:client:initDepot")
		end)
end)
