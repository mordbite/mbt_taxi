# MBT Taxi System

> Developed by Mordbite.

A dynamic, modular taxi job system for QBCore-based FiveM servers.  
Designed for immersive roleplay and scalable gameplay, including NPC passengers, tour-based routing, urgency levels, and bonus/penalty payouts.

---

## Features

- Dynamic tour generation between hundreds of locations
- 1–3 NPC passengers per tour (synchronized across all clients)
- Tour timer with urgency-based bonus/penalty logic
- Blip and zone handling for pickup and dropoff locations
- Fully integrated fare meter with adjustable pricing
- Intelligent tour refresh with fallback conditions
- Edge case handling (timeouts, player death, disconnects)
- Automatic cleanup of NPCs, blips, zones, and timers

---

## Requirements

- `qb-core`
	- `qb-radialmenu` - Used to access all functionality - to change it see `Customization`
	- `qb-menu` - Depot Menu
	- `qb-vehiclekeys` - Rental Taxi from Depot
- `PolyZone` (for pickup/dropoff interaction zones)

---

## Installation

1. Clone or download the resource to your `resources` folder.
2. Add to your `server.cfg`:
   ```ini
   ensure mbt_taxi
   ```
3. Make sure to not have any other Taxi job running.
4. `qb-radialmenu`: Relpace the `[taxi]` block in the `config.lua` with the following:
```lua
['taxi'] = {
	{
		id = 'open_tours',
		title = 'Available Tours',
		icon = 'clipboard-list',
		type = 'client',
		event = 'mbt_taxi:client:openTourSelector',
		shouldClose = true
	},
	{
		id = 'cancel_tour',
		title = 'Cancel Current Tour',
		icon = 'ban',
		type = 'client',
		event = 'mbt_taxi:client:cancelTour',
		shouldClose = true
	},
	{
	id = 'manualMeter',
	title = 'Manual Meter Controls',
	icon = 'stopwatch',
	items = {
		{
			id = 'toggleMeterVisibility',
			title = 'Show/Hide Meter',
			icon = 'eye-slash',
			type = 'client',
			event = 'mbt_taxi:client:toggleMeterVisibility',
			shouldClose = false
		},
		{
			id = 'toggleManualMeter',
			title = 'Start/Stop Meter',
			icon = 'hourglass-start',
			type = 'client',
			event = 'mbt_taxi:client:toggleManualMeter',
			shouldClose = true
		},
		{
			id = 'resetMeter',
			title = 'Reset Meter',
			icon = 'ban',
			type = 'client',
			event = 'mbt_taxi:client:resetManualMeter',
			shouldClose = false
		},
	}}
},
```

## Configuration

All core settings can be found in `config.lua`, including:

- Base fare, price per km
- Tour urgency weights
- Minimum tour distance
- Timer rules and grace periods
- Debug mode toggle
- Allowed vehicles
- Tour locations
- etc.

---

## Customization

To use a custom way to access the functionalities, call the Events specified in the `qb-radialmenu`-Snippet above.

To use a custom vehicle key system:
- find the function `handleSpawnTaxi` in `/client/depot.lua`
- Replace the `SetOwner` Trigger with your custom logic

---

## Known Bugs

**Fare Meter**

- Active Label shows wrong state
	- Visual only: will be fixed during the upcoming responsibility rewrite.
		
- Distance Tracking sometimes stuck at 0
	- Visual only: payout is calculated serverside
	- Quick-Fix: cancel ans reclaim tour - maybe relog if persistent

## Roadmap

**Responsibilities rewrite**

- js only as UI-Handler, no logic involved
	- set, reset, update
	- all data sent from `/server/*.lua`
				
**TourLocations Priority System**

Examples:
- Hospitals and Airport Gates get a slightly higher chance to be chosen as tour location
- Waste Management Facilities or remote Locations get a slightly lower chance

**Misc**
- Adding more fallbacks and handle more edgecases
-

---
## Credits

Parts of the depot system were conceptually inspired by logic used in `qb-taxijob` by the QBcore-Framework Team.

**Icons** by [Font Awesome](https://fontawesome.com), licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

**Fonts Used:**

- **Exo 2** by Natanael Gama, licensed under [SIL Open Font License 1.1](https://scripts.sil.org/OFL).
- **Digital-7** by Sizenko Alexander, used for segment-style display elements. (https://www.dafont.com/digital-7.font).
- **Barlow** by Jeremy Tribby, used for UI and labels. Licensed under the [SIL Open Font License 1.1](https://scripts.sil.org/OFL).

## License

This project is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0).  
You are free to use, modify and share this project for **non-commercial purposes** only.  
All derivative works must carry the same license and be equally non-commercial and open.

Full license text: https://creativecommons.org/licenses/by-nc-sa/4.0/