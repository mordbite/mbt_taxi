Config = {}

-----------------------------------
-- DEBUG & BASE CONFIG
-----------------------------------

Config.Debug = true
Config.jobRequired = 'taxi'

-----------------------------------
-- VEHICLES & DEPOT
-----------------------------------

Config.AllowedVehicles = {
	{ model = 'taxi', label = 'Standard Taxi' },
	{ model = 'jugular', label = 'Engine Failure Test Car' }
}

Config.CabSpawns = {
	vector4(899.0837, -180.4414, 73.4115, 238.7553),
	vector4(897.1274, -183.3882, 73.3531, 238.4949),
	vector4(903.4929, -191.7166, 73.3883, 60.5255),
	vector4(904.9221, -188.7516, 73.4204, 60.5921),
	vector4(906.9083, -186.0502, 73.6249, 58.2671),
	vector4(908.7374, -183.2168, 73.7542, 57.1579),
	vector4(911.3865, -163.0307, 73.9763, 194.4093),
	vector4(913.5932, -159.4309, 74.3888, 193.9838),
	vector4(916.0979, -170.6549, 74.0125, 100.604),
	vector4(918.3217, -167.1944, 74.2036, 101.5165),
	vector4(920.6716, -163.4763, 74.4108, 96.2972)
}

Config.DepotPed = vector4(902.74, -170.82, 74.08, 230.26)

-----------------------------------
-- TOUR GENERATION
-----------------------------------

Config.MinTourDistance = 1000.0  	-- meters (straight-line - not GPS distance!)
Config.TourCount = 8          
Config.TourTimeout = 600         	-- seconds
Config.TourRefreshInterval = 1200 	-- seconds

-----------------------------------
-- URGENCY SETTINGS
-----------------------------------

Config.TimeLimit = {
	secondsPerKm = 180,          	-- seconds
	reductionPerUrgency = 35     	-- Reduction in seconds per km for each urgency level above 1. || Example: Urgency level 5 = (5 - 1) * 35 = 140 seconds less per km
}
Config.GracePeriod = 60          	-- seconds

-- bonus / penalty in %
Config.UrgencySettings = {
	[1] = { hasTimeLimit = false, bonus = 0,  penalty = 0  },
	[2] = { hasTimeLimit = true,  bonus = 10, penalty = 0  },
	[3] = { hasTimeLimit = true,  bonus = 20, penalty = 0  },
	[4] = { hasTimeLimit = true,  bonus = 30, penalty = 25 },
	[5] = { hasTimeLimit = true,  bonus = 50, penalty = 50 }
}

-- Fractions - does not need to add up to 100 (but advised)
Config.UrgencyWeights = {
	[1] = 40,
	[2] = 30,
	[3] = 15,
	[4] = 10,
	[5] = 5
}

-----------------------------------
-- METER SETTINGS
-----------------------------------

Config.Meter = {
	defaultPrice = 125.0, -- $/km
	startingPrice = 50    -- $ Base (meter starts with this)
}

-----------------------------------
-- DAMAGE SYSTEM
-----------------------------------

Config.MinCabHealth = 200		-- 1 - 1000 (200 = 20%)
Config.MaxCrashesAllowed = 5
Config.DamageThreshold = 10.0  -- 1 - 10000 

-----------------------------------
-- TOUR LOCATIONS
-----------------------------------
	
Config.TourLocations = {

-- == LSIA == --

	-- Passenger Gates
	
	["lsia-caipira-top"] = {
	coords = vector4(-1016.04, -2467.77, 19.67, 230.91),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Caipira Gate Top"
	},
	["lsia-caipira-bottom"] = {
	coords = vector4(-1013.61, -2470.66, 13.33, 242.71),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Cairpira Gate, Bottom"
	},
	["lsia-airherler-top"] = {
	coords = vector4(-1026.95, -2487.31, 19.67, 242.13),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Air Herler Gate, Top"
	},
	["lsia-airherler-bottom"] = {
	coords = vector4(-1024.92, -2490.60, 13.32, 234.42),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Air Herler Gate, Bottom"
	},
	["lsia-sanfierroair-top"] = {
	coords = vector4(-1040.30, -2510.54, 19.67, 238.45),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "San Fierro Air Gate, Top"
	},
	["lsia-sanfierroair-bottom"] = {
	coords = vector4(-1036.95, -2511.80, 13.31, 236.86),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "San Fierro Air Gate, Bottom"
	},
	["lsia-airemu-top"] = {
	coords = vector4(-1059.35, -2543.19, 19.67, 238.48),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Air Emu Gate, Top"
	},
	["lsia-airemu-bottom"] = {
	coords = vector4(-1055.64, -2543.87, 13.30, 236.11),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Air Emu Gate, Bottom"
	},
	["lsia-myfly-top"] = {
	coords = vector4(-1074.85, -2570.31, 19.67, 241.22),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "My Fly Gate, Top"
	},
	["lsia-myfly-bottom"] = {
	coords = vector4(-1074.75, -2576.74, 13.30, 247.77),
	LabelDistrict = "ILSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "My Fly Gate, Bottom"
	},
	["lsia-adios-top"] = {
	coords = vector4(-1090.18, -2596.94, 19.67, 232.96),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Adios Gate, Top"
	},
	["lsia-adios-bottom"] = {
	coords = vector4(-1087.00, -2598.04, 13.30, 234.78),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Adios Gate, Bottom"
	},
	["lsia-flyus-top"] = {
	coords = vector4(-1042.93, -2729.30, 19.67, 330.21),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Fly US Gate, Top"
	},
	["lsia-flyus-bottom"] = {
	coords = vector4(-1050.67, -2717.91, 13.30, 331.23),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Fly US Gate, Bottom"
	},
	["lsia-lossantosair-top"] = {
	coords = vector4(-1026.95, -2738.80, 19.67, 329.32),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Los Santos Air Gate, Top"
	},
	["lsia-lossantosair-bottom"] = {
	coords = vector4(-1020.39, -2736.20, 13.30, 326.47),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Los Santos Air Gate, Bottom"
	},
	
	-- Airfield Operations Area
	
	["lsia-adios-hangar"] = {
	coords = vector4(-927.30, -2825.42, 13.46, 62.42),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Adios Hangar"
	},	
	["lsia-weston-hangar"] = {
	coords = vector4(-993.09, -2941.77, 13.47, 60.53),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Devin Weston - Fly US Hangar"
	},
	["lsia-hangar1"] = {
	coords = vector4(-1139.37, -3414.72, 13.46, 326.18),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "AOA Hangar 1"
	},
	["lsia-hangar2"] = {
	coords = vector4(-1293.02, -3339.21, 13.46, 0.03),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "AOA Hangar 2"
	},
	["lsia-dineasoar"] = {
	coords = vector4(-1320.15, -3334.44, 13.46, 242.10),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "Dineasoar Catering"
	},
	["lsia-pegasus-hangar1"] = {
	coords = vector4(-1392.83, -3265.92, 13.46, 333.31),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "Pegasus Hangar 1"
	},
	["lsia-pegasus-hangar2"] = {
	coords = vector4(-1668.13, -3101.54, 13.46, 332.30),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "Pegasus Hangar 2"
	},
	["lsia-vip-gate"] = {
	coords = vector4(-1577.30, -3178.08, 14.17, 295.70),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "VIP Gate"
	},
	["lsia-fueldepot"] = {
	coords = vector4(-1885.62, -2999.07, 13.46, 334.69),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "Fuel Depot"
	},
	["lsia-holdingbay1"] = {
	coords = vector4(-1234.76, -2344.50, 13.61, 243.74),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "Cargo Yard, Holding Bay 1"
	},
	["lsia-aoafd"] = {
	coords = vector4(-1032.52, -2381.13, 13.61, 241.39),
	LabelDistrict = "LSIA",
	LabelStreet = "Runway 1",
	LabelDetail = "Airfield Fire Brigade"
	},
	
	-- Perimeter & Airport Support
	
	["lsia-noose"] = {
	coords = vector4(-897.28, -2390.57, 13.54, 62.46),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "N.O.O.S.E. Office"
	},
	["lsia-cargo-east"] = {
	coords = vector4(-657.00, -2359.24, 13.46, 45.82),
	LabelDistrict = "LSIA",
	LabelStreet = "Exceptionalists Way",
	LabelDetail = "Cargo Warehouses East"
	},
	["lsia-cargo-west"] = {
	coords = vector4(-864.83, -2699.06, 13.46, 68.49),
	LabelDistrict = "LSIA",
	LabelStreet = "New Empire Way",
	LabelDetail = "Cargo Warehouses West"
	},
	["lsia-bighousestorage"] = {
	coords = vector4(-540.28, -2197.25, 5.56, 45.02),
	LabelDistrict = "LSIA",
	LabelStreet = "Exceptionalists Way",
	LabelDetail = "Big House Storage"
	},
	["lsia-poppyhouse"] = {
	coords = vector4(-627.51, -2272.86, 5.46, 228.73),
	LabelDistrict = "LSIA",
	LabelStreet = "Exceptionalists Way",
	LabelDetail = "Poppy House Restaurant"
	},
	["lsia-opiumnights"] = {
	coords = vector4(-750.94, -2290.75, 12.56, 138.03),
	LabelDistrict = "LSIA",
	LabelStreet = "Greenwich Pkwy",
	LabelDetail = "Opium Nights Hotel"
	},
	["lsia-crastenburg"] = {
	coords = vector4(-878.47, -2111.69, 9.44, 48.97),
	LabelDistrict = "LSIA",
	LabelStreet = "Autopia Pkwy",
	LabelDetail = "Crastenburg Hotel"
	},
	["lsia-Bilgeco"] = {
	coords = vector4(-1021.68, -2102.54, 12.99, 321.09),
	LabelDistrict = "LSIA",
	LabelStreet = "Greenwich Pkwy",
	LabelDetail = "BILGECO Shipping"
	},
	["lsia-lscustoms"] = {
	coords = vector4(-1137.38, -1994.86, 12.68, 315.15),
	LabelDistrict = "LSIA",
	LabelStreet = "Greenwich Pkwy",
	LabelDetail = "Los Santos Customs"
	},
	
-- == ELYSIAN ISLANDS == --

	["elysian-gasstorage"] = {
	coords = vector4(-110.00, -2240.57, 7.33, 183.36),
	LabelDistrict = "Banning",
	LabelStreet = "Autopia Pkwy",
	LabelDetail = "Gas Storage"
	},
	["banning"] = {
	coords = vector4(128.12, -2196.82, 5.55, 359.03),
	LabelDistrict = "Banning",
	LabelStreet = "Dutch London St",
	LabelDetail = "Banning"
	},
	["sas-gasreserve"] = {
	coords = vector4(485.78, -2169.92, 5.44, 334.87),
	LabelDistrict = "Banning",
	LabelStreet = "Dutch London St",
	LabelDetail = "San Andreas State Gas Reserve"
	},
	["elysian-warehouse1"] = {
	coords = vector4(148.70, -2485.37, 5.52, 234.22),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Chum St",
	LabelDetail = "Warehouse 1"
	},
	["eylsian-autoexotic"] = {
	coords = vector4(52.62, -2562.21, 5.52, 356.93),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Chupacabra St",
	LabelDetail = "Auto Exotic"
	},
	["pier400-customs"] = {
	coords = vector4(-41.51, -2512.14, 5.67, 334.60),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Chupacabra St",
	LabelDetail = "Pier 400, Customs"
	},
	["pier400-ssbulker"] = {
	coords = vector4(-208.34, -2385.35, 5.52, 177.20),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Chupacabra St",
	LabelDetail = "Pier 400, SS Bulker"
	},
	["elysian-warehouse2"] = {
	coords = vector4(-260.24, -2482.87, 5.52, 315.86),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Miriam Turner Overpass",
	LabelDetail = "Warehouse 2"
	},
	["octopus"] = {
	coords = vector4(-406.50, -2635.52, 5.52, 228.18),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Plaice Pl",
	LabelDetail = "Octopus"
	},
	["eylsian-postop"] = {
	coords = vector4(-422.63, -2787.05, 5.52, 354.33),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Plaice Pl",
	LabelDetail = "Post OP Warehouse"
	},
	["elysian-tugdock"] = {
	coords = vector4(-334.00, -2771.91, 4.52, 88.62),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Plaice Pl",
	LabelDetail = "Tug Dock"
	},
	["elysian-warehouse3"] = {
	coords = vector4(-238.63, -2645.65, 5.52, 356.86),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Plaice Pl",
	LabelDetail = "Warehouse 3"
	},
	["pier400-walker"] = {
	coords = vector4(-57.55, -2654.78, 5.52, 356.48),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Plaice Pl",
	LabelDetail = "Pier 400, Walker Warehouse"
	},
	["pier400-shipyard"] = {
	coords = vector4(55.86, -2715.92, 5.52, 271.32),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Elysian Fields Fwy",
	LabelDetail = "Pier 400, Pacific Allied Shipyard"
	},
	["pier400-bristols"] = {
	coords = vector4(267.93, -3163.91, 5.31, 275.47),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Voodoo Place",
	LabelDetail = "Pier 400, Bristols Coke Strorage"
	},
	["bugstars"] = {
	coords = vector4(160.78, -3080.43, 5.50, 272.44),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Signal St",
	LabelDetail = "Bugstars"
	},
	["elysian-warehouse4"] = {
	coords = vector4(122.24, -2916.96, 5.52, 82.85),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Signal St",
	LabelDetail = "Warehouse 4"
	},
	["seaurchin"] = {
	coords = vector4(468.94, -2929.99, 5.56, 181.37),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Abattoir Ave",
	LabelDetail = "The Sea Urchin"
	},
	["elysian-bristols"] = {
	coords = vector4(471.23, -2727.40, 5.58, 56.00),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Elysian Fields Fwy",
	LabelDetail = "Bristols Coke Storage"
	},
	["elysian-merryweather"] = {
	coords = vector4(501.64, -3008.39, 5.56, 186.24),
	LabelDistrict = "Elysian Island",
	LabelStreet = "Abattoir Ave",
	LabelDetail = "Merryweather Docks"
	},
	
-- == TERMINAL == --
	
	["jetsam-terminal"] = {
	coords = vector4(823.63, -2981.44, 5.53, 269.08),
	LabelDistrict = "Terminal",
	LabelStreet = "Buccaneer Way",
	LabelDetail = "Jetsam Terminal"
	},
	["terminal-bilgeco"] = {
	coords = vector4(816.44, -3199.21, 5.41, 89.27),
	LabelDistrict = "Terminal",
	LabelStreet = "Buccaneer Way",
	LabelDetail = "BILGECO Warehouse"
	},
	["terminal-postop"] = {
	coords = vector4(1177.44, -3251.46, 5.55, 95.90),
	LabelDistrict = "Terminal",
	LabelStreet = "Buccaneer Way",
	LabelDetail = "Post OP Warehouse"
	},
	["daisylee"] = {
	coords = vector4(1220.07, -2989.65, 5.39, 89.72),
	LabelDistrict = "Terminal",
	LabelStreet = "Buccaneer Way",
	LabelDetail = "Daisy Lee"
	},
	["oceanmotion"] = {
	coords = vector4(1003.14, -2902.35, 5.42, 183.81),
	LabelDistrict = "Terminal",
	LabelStreet = "Buccaneer Way",
	LabelDetail = "Ocean Motion"
	},
	
-- == MAZE BANK ARENA == --
	
	["mazebank-loading"] = {
	coords = vector4(-396.77, -1870.22, 20.17, 208.10),
	LabelDistrict = "Maze Bank Arena",
	LabelStreet = "Davis Ave",
	LabelDetail = "Loading  Zone"
	},
	["mazebank-front"] = {
	coords = vector4(-239.99, -1864.71, 28.32, 318.02),
	LabelDistrict = "Maze Bank Arena",
	LabelStreet = "Autopia Pkwy",
	LabelDetail = "Front"
	},
	["mazebank-entrance"] = {
	coords = vector4(-229.99, -2042.81, 27.27, 234.30),
	LabelDistrict = "Maze Bank Arena",
	LabelStreet = "Autopia Pkwy",
	LabelDetail = "Main Entrance"
	},
	
-- == CYPRESS FLATS == --

	["cypress-warehouses"] = {
	coords = vector4(891.42, -2540.76, 27.96, 175.67),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Elysian Fields Fwy",
	LabelDetail = "Cypress Warehouses"
	},
	["cypress-railyard-streetside"] = {
	coords = vector4(1049.36, -2385.25, 29.95, 85.35),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "South Shambles St",
	LabelDetail = "Railyard, Streetside"
	},
	["cypress-railyard"] = {
	coords = vector4(1118.48, -2374.41, 30.33, 269.60),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "South Shambles St",
	LabelDetail = "Railyard"
	},
	["cypress-officefurniture"] = {
	coords = vector4(1046.69, -2173.17, 31.16, 263.25),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "South Shambles St",
	LabelDetail = "Office Furniture"
	},
	["vitreus1"] = {
	coords = vector4(932.79, -1990.44, 29.75, 273.67),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Orchardville Ave",
	LabelDetail = "Vitreus Plant #1 Entrance"
	},
	["foundry"] = {
	coords = vector4(1074.45, -1959.13, 30.54, 54.52),
	LabelDistrict = "Murrieta Heights",
	LabelStreet = "Elysian Fields Fwy",
	LabelDetail = "Grand Banks Steel Foundry"
	},
	["cypress-warehouse1"] = {
	coords = vector4(969.50, -1811.82, 30.71, 176.63),
	LabelDistrict = "La Mesa",
	LabelStreet = "Orchardville Ave",
	LabelDetail = "Warehouse 1"
	},
	["cypress-pisswasser"] = {
	coords = vector4(825.61, -1940.72, 28.54, 86.35),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Popular St",
	LabelDetail = "Pisswasser Brewery"
	},
	["raven"] = {
	coords = vector4(930.39, -2185.77, 29.95, 87.57),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Orchardville Ave",
	LabelDetail = "Raven Slaughterhouse"
	},
	["carmeet"] = {
	coords = vector4(896.83, -2361.80, 30.00, 267.14),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Orchardville Ave",
	LabelDetail = "LS Car Meet"
	},
	["cypress-Zalinsky"] = {
	coords = vector4(850.89, -2444.57, 27.23, 164.58),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Hanger Way",
	LabelDetail = "Zalinsky Supply Corp"
	},
	["cmc"] = {
	coords = vector4(781.57, -2298.45, 27.74, 77.51),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Popular St",
	LabelDetail = "Central Milling Company"
	},
	["ammunation-hq"] = {
	coords = vector4(804.94, -2132.87, 28.89, 315.47),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Popular St",
	LabelDetail = "AmmuNation Headquarters"
	},
	["cypress-substation"] = {
	coords = vector4(724.15, -2017.94, 28.81, 258.97),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Substation"
	},
	["cypress-warehouse2"] = {
	coords = vector4(773.67, -1886.60, 28.80, 258.78),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Popular St",
	LabelDetail = "Warehouse 2"
	},
	["cypress-silos"] = {
	coords = vector4(695.99, -2247.53, 28.56, 174.71),
	LabelDistrict = "Cypress Flats",
	LabelStreet = "Popular St",
	LabelDetail = "Silos"
	},
	
--== LA MESA == --

	["fridgit-office"] = {
	coords = vector4(855.62, -1646.12, 29.58, 71.88),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Fridgit Office"
	},
	["lamesa-tractorparts"] = {
	coords = vector4(870.93, -1575.14, 30.20, 357.14),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Tractor Parts"
	},
	["lamesa-warehouse1"] = {
	coords = vector4(814.03, -1700.51, 28.80, 259.79),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Warehouse 1"
	},
	["lamesa-lsbagco"] = {
	coords = vector4(778.06, -1402.25, 26.48, 266.19),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Los Santos Bag Co."
	},
	["lamesa-lspd"] = {
	coords = vector4(811.58, -1290.32, 25.80, 86.97),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "LSPD Depot"
	},
	["lamesa-soyler"] = {
	coords = vector4(786.51, -1283.55, 25.83, 265.52),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Soyler Textiles"
	},
	["lamesa-secureunit"] = {
	coords = vector4(887.96, -1255.59, 25.58, 18.60),
	LabelDistrict = "La Mesa",
	LabelStreet = "Olympic Fwy",
	LabelDetail = "The Secure Unit"
	},
	["lamesa-lscustoms"] = {
	coords = vector4(717.34, -1072.02, 21.76, 86.55),
	LabelDistrict = "La Mesa",
	LabelStreet = "Olympic Fwy",
	LabelDetail = "Los Santos Customs"
	},
	["lamesa-redcar"] = {
	coords = vector4(701.56, -1142.23, 23.25, 74.71),
	LabelDistrict = "La Mesa",
	LabelStreet = "Olympic Fwy",
	LabelDetail = "Red Car City Paints"
	},
	["lamesa-meltz-rons"] = {
	coords = vector4(799.24, -1051.14, 26.56, 93.09),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Meltz Pharmacy & Ron's Gas Station"
	},
	["lamesa-celltowa"] = {
	coords = vector4(977.80, -1050.18, 40.08, 239.80),
	LabelDistrict = "Murrieta Heights",
	LabelStreet = "Supply St",
	LabelDetail = "Celltowa"
	},
	["maibatsu-top"] = {
	coords = vector4(972.75, -963.90, 41.77, 284.39),
	LabelDistrict = "Murrieta Heights",
	LabelStreet = "Supply St",
	LabelDetail = "Maibatsu Motors Inc., Upper"
	},
	["lamesa-ammunation"] = {
	coords = vector4(842.90, -1010.47, 27.34, 2.99),
	LabelDistrict = "La Mesa",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "AmmuNation"
	},
	["lamesa-national"] = {
	coords = vector4(797.55, -960.82, 25.49, 92.96),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "National Transfer & Storage Co."
	},
	["darnell"] = {
	coords = vector4(764.39, -959.55, 25.37, 275.17),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Darnell Bros Garments"
	},
	["lamesa-videogeddon"] = {
	coords = vector4(763.13, -816.67, 25.84, 258.00),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Videogeddon Arcade"
	},
	["lamesa-caseys"] = {
	coords = vector4(783.66, -748.36, 26.84, 91.10),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Casey's Diner"
	},
	["lamesa-1966"] = {
	coords = vector4(701.24, -837.33, 23.89, 172.90),
	LabelDistrict = "La Mesa",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "The 1966 Digestive Co."
	},
	["lamesa-mcgrory"] = {
	coords = vector4(763.60, -695.45, 28.17, 273.62),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "McGrory Furniture"
	},
	["lamesa-clocktower"] = {
	coords = vector4(764.07, -533.11, 33.59, 265.36),
	LabelDistrict = "La Mesa",
	LabelStreet = "Popular St",
	LabelDetail = "Clocktower"
	},
	
-- == EAST VINEWOOD, CASINO & RACETRACK== --
	
	["eastvinewood-park"] = {
	coords = vector4(705.37, -282.80, 58.78, 181.87),
	LabelDistrict = "East Vinewood",
	LabelStreet = "Los Santos Freeway",
	LabelDetail = "Park"
	},
	["eastvinewood-bridgest1"] = {
	coords = vector4(791.50, -167.87, 73.26, 154.73),
	LabelDistrict = "East Vinewood",
	LabelStreet = "Bridge St",
	LabelDetail = "No. 1"
	},
	["eastvinewood-bridgest2"] = {
	coords = vector4(924.94, -251.28, 68.09, 142.01),
	LabelDistrict = "East Vinewood",
	LabelStreet = "Bridge St",
	LabelDetail = "No. 2"
	},
	["eastvinewood-lost"] = {
	coords = vector4(966.09, -149.34, 73.75, 143.89),
	LabelDistrict = "East Vinewood",
	LabelStreet = "Mirror Park Blvd",
	LabelDetail = "The Lost Clubhouse"
	},
	["downtowncabco"] = {
	coords = vector4(922.27, -176.58, 73.99, 243.28),
	LabelDistrict = "East Vinewood",
	LabelStreet = "Tangerine St",
	LabelDetail = "Downtown Cab Company"
	},
	["eastvinewood-alladins"] = {
	coords = vector4(811.82, -82.95, 80.13, 317.77),
	LabelDistrict = "East Vinewood",
	LabelStreet = "Mirror Park Blvd",
	LabelDetail = "Alladin's Cave"
	},
	["diamondcasino"] = {
	coords = vector4(923.51, 48.17, 80.62, 62.63),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Vinewood Park Dr",
	LabelDetail = "Diamond Casino"
	},
	["vinewood-racetrack1"] = {
	coords = vector4(1044.78, 202.49, 80.51, 50.57),
	LabelDistrict = "Vinewood-Rennbahn",
	LabelStreet = "Vinewood Park Dr",
	LabelDetail = "Main Entrance"
	},
	["vinewood-racetrack2"] = {
	coords = vector4(1125.11, 68.75, 80.40, 239.92),
	LabelDistrict = "Vinewood-Rennbahn",
	LabelStreet = "Vinewood Park Dr",
	LabelDetail = "Infield"
	},
	
-- == MIRROR PARK == --

	["mirror-gabrielas"] = {
	coords = vector4(1171.04, -284.58, 68.57, 322.60),
	LabelDistrict = "Mirror Park",
	LabelStreet = "Mirror Park Blvd",
	LabelDetail = "Gabriela's Market"
	},
	["mirror-hornys"] = {
	coords = vector4(1266.60, -390.04, 68.61, 137.42),
	LabelDistrict = "Mirror Park",
	LabelStreet = "East Mirror Dr",
	LabelDetail = "Horny's"
	},
	["mirror-eastmirrordr1"] = {
	coords = vector4(1267.50, -497.90, 68.58, 245.42),
	LabelDistrict = "Mirror Park",
	LabelStreet = "East Mirror Dr",
	LabelDetail = "No. 1"
	},
	["mirror-wolfs"] = {
	coords = vector4(1380.25, -580.02, 73.80, 89.50),
	LabelDistrict = "Mirror Park",
	LabelStreet = "Nikola Pl",
	LabelDetail = "Wolfs Corner"
	},
	["mirror-chicos"] = {
	coords = vector4(1080.35, -767.70, 57.29, 6.77),
	LabelDistrict = "Mirror Park",
	LabelStreet = "West Mirror Drive",
	LabelDetail = "Chico's Hypermarket"
	},
	["mirror-westmirrordr1"] = {
	coords = vector4(977.95, -681.77, 56.90, 292.95),
	LabelDistrict = "Mirror Park",
	LabelStreet = "West Mirror Drive",
	LabelDetail = "No. 1"
	},
	["mirror-westmirrordr2"] = {
	coords = vector4(899.55, -575.96, 56.87, 148.09),
	LabelDistrict = "Mirror Park",
	LabelStreet = "West Mirror Drive",
	LabelDetail = "No. 2"
	},
	["mirror-nikolaave1"] = {
	coords = vector4(1009.07, -528.23, 59.88, 207.42),
	LabelDistrict = "Mirror Park",
	LabelStreet = "Nikola Ave",
	LabelDetail = "No. 1"
	},
	["mirrorpark"] = {
	coords = vector4(1167.14, -642.44, 61.84, 276.70),
	LabelDistrict = "Mirror Park",
	LabelStreet = "Mirror Park Blvd",
	LabelDetail = "Mirror Park"
	},
	
-- == MURRIETA & EL BURRO HEIGHTS == --

	["murrieta-robs"] = {
	coords = vector4(1146.64, -980.08, 45.74, 275.33),
	LabelDistrict = "Murrieta Heights",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Rob's Liqour Store"
	},
	["murrieta-lumber"] = {
	coords = vector4(1169.85, -1321.85, 34.41, 258.75),
	LabelDistrict = "Murrieta Heights",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Lumber Supply"
	},
	["stfiarcehospital"] = {
	coords = vector4(1154.34, -1518.12, 34.36, 355.30),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "Elysian Fields Fwy",
	LabelDetail = "St Fiarce Hospital"
	},
	["murrieta-firestation7"] = {
	coords = vector4(1187.66, -1449.10, 34.56, 359.80),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "Capital Blvd",
	LabelDetail = "LSCFD, Fire Station 7"
	},
	["elburro-tattoo"] = {
	coords = vector4(1311.64, -1642.92, 51.59, 32.53),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "Tattoo Studio"
	},
	["elburro-fudgeln1"] = {
	coords = vector4(1371.93, -1542.77, 55.54, 28.12),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "Fudge Ln",
	LabelDetail = "No. 1"
	},
	["elburro-fudgeln2"] = {
	coords = vector4(1231.91, -1622.68, 50.61, 18.76),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "Fudge Ln",
	LabelDetail = "No. 2"
	},
	["elburro-amarillavista1"] = {
	coords = vector4(1281.78, -1738.11, 51.93, 21.48),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "Amarillo Vista",
	LabelDetail = "No. 1"
	},
	["elburro-oilfieldwest"] = {
	coords = vector4(1366.06, -1845.55, 56.82, 96.43),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Western Oil Field"
	},
	
	-- OIL FIELDS
	
	["oilfields-northgate"] = {
	coords = vector4(1935.12, -956.03, 78.60, 4.49),
	LabelDistrict = "Palomino-Hochland",
	LabelStreet = "Sustancia Rd",
	LabelDetail = "Oil Fields, North Gate"
	},
	["oilfields-central"] = {
	coords = vector4(1671.67, -1625.96, 112.01, 54.93),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Burro Blvd",
	LabelDetail = "Oil Fields, Central Storage"
	},
	["oilfields-maintenance"] = {
	coords = vector4(1561.68, -1677.78, 87.74, 279.72),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Oild Filds, Maintenance"
	},
	["oilfields-northwestgate"] = {
	coords = vector4(1390.72, -1623.34, 56.77, 322.84),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Oil Fields, North-West Gate"
	},
	["oilfields-warehouse1"] = {
	coords = vector4(1487.74, -1931.55, 70.51, 261.67),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Oil Fields, Warehouse 1"
	},
	["oilfields-covington"] = {
	coords = vector4(1378.45, -2077.77, 51.51, 43.14),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Rancho Blvd",
	LabelDetail = "Oil Fields, Covington"
	},
	["oirfields-junkyard1"] = {
	coords = vector4(1524.13, -2112.97, 76.13, 271.72),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Burro Blvd",
	LabelDetail = "Oil Fields, Junkyard 1"
	},
	["oilfields-watertower"] = {
	coords = vector4(1627.38, -2256.42, 106.47, 283.14),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Burro Blvd",
	LabelDetail = "Oil Fields, Watertower"
	},
	["oilfields-junkyard2"] = {
	coords = vector4(1284.76, -2561.21, 43.60, 326.02),
	LabelDistrict = "El Burro Heights",
	LabelStreet = "El Burro Blvd",
	LabelDetail = "Oil Fields, Junkyard 2"
	},
	
-- == RANCHO == --
	
	["rancho-chantelles"] = {
	coords = vector4(447.11, -2041.35, 23.46, 312.01),
	LabelDistrict = "Rancho",
	LabelStreet = "Carson Ave",
	LabelDetail = "Chantelle's Beauty Salon"
	},
	["rancho-longpig"] = {
	coords = vector4(404.96, -1899.59, 24.93, 45.64),
	LabelDistrict = "Rancho",
	LabelStreet = "Jamestown St",
	LabelDetail = "Long Pig Minimarket"
	},
	["rancho-atomic"] = {
	coords = vector4(489.06, -1869.36, 26.22, 294.68),
	LabelDistrict = "Rancho",
	LabelStreet = "Macdonald St",
	LabelDetail = "Atomic Body Shop"
	},
	["rancho-jamestownchurch"] = {
	coords = vector4(504.16, -1749.55, 28.22, 76.47),
	LabelDistrict = "Rancho",
	LabelStreet = "Jamestown St",
	LabelDetail = "Jamestown Church"
	},
	["rancho-substation"] = {
	coords = vector4(591.16, -1587.11, 26.67, 301.36),
	LabelDistrict = "Rancho",
	LabelStreet = "Little Bighorn Ave",
	LabelDetail = "Substation"
	},
	["rancho-himen"] = {
	coords = vector4(495.50, -1545.01, 28.76, 221.16),
	LabelDistrict = "Rancho",
	LabelStreet = "Roy Lowenstein Blvd",
	LabelDetail = "Hi-Men Bar"
	},
	["rancho-bilingsgate"] = {
	coords = vector4(561.87, -1771.71, 28.87, 63.26),
	LabelDistrict = "Rancho",
	LabelStreet = "Little Bighorn Ave",
	LabelDetail = "Bilingsgate Motel"
	},
	["rancho.lspdimpound"] = {
	coords = vector4(425.20, -1624.61, 28.80, 298.86),
	LabelDistrict = "Rancho",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "LSPD Impound Lot"
	},
	["rancho-beacon"] = {
	coords = vector4(461.19, -1452.62, 28.76, 10.03),
	LabelDistrict = "Rancho",
	LabelStreet = "Davis Ave",
	LabelDetail = "The Beacon Theatre"
	},
	["rancho-panache"] = {
	coords = vector4(511.77, -1456.14, 28.74, 304.11),
	LabelDistrict = "La Mesa",
	LabelStreet = "Little Bighorn Ave",
	LabelDetail = "Panache Laundering"
	},
	["rancho-macdonaldst1"] = {
	coords = vector4(424.47, -1803.06, 27.91, 326.93),
	LabelDistrict = "Rancho",
	LabelStreet = "Macdonald St",
	LabelDetail = "No. 1"
	},
	["ranchoprojects"] = {
	coords = vector4(323.35, -2043.56, 20.31, 322.46),
	LabelDistrict = "Rancho",
	LabelStreet = "Jamestown St",
	LabelDetail = "Rancho Projects"
	},
	["ranchotowers"] = {
	coords = vector4(375.31, -2151.14, 15.00, 196.01),
	LabelDistrict = "Rancho",
	LabelStreet = "Dutch London St",
	LabelDetail = "Rancho Towers"
	},
	
-- == Davis == --
	
	["davis-diegos"] = {
	coords = vector4(137.76, -1997.04, 17.83, 246.44),
	LabelDistrict = "Davis",
	LabelStreet = "Roy Lowenstein Blvd",
	LabelDetail = "Diego's"
	},
	["davis-locksmith"] = {
	coords = vector4(166.54, -1791.95, 28.56, 0.95),
	LabelDistrict = "Davis",
	LabelStreet = "Carson Ave",
	LabelDetail = "Locksmith"
	},
	["davis-megamall"] = {
	coords = vector4(25.68, -1767.28, 28.88, 50.19),
	LabelDistrict = "Davis",
	LabelStreet = "Davis Ave",
	LabelDetail = "Davis Mega Mall"
	},
	["davis-thewarehouse"] = {
	coords = vector4(-94.13, -1783.23, 28.46, 328.82),
	LabelDistrict = "Davis",
	LabelStreet = "Grove St",
	LabelDetail = "The Warehouse"
	},
	["davis-grovest1"] = {
	coords = vector4(114.67, -1949.66, 20.17, 45.38),
	LabelDistrict = "Davis",
	LabelStreet = "Grove St",
	LabelDetail = "No. 1"
	},
	["davis-covenantave1"] = {
	coords = vector4(176.84, -1887.66, 23.43, 145.79),
	LabelDistrict = "Davis",
	LabelStreet = "Covenant Ave",
	LabelDetail = "No. 1"
	},
	["davis-carson"] = {
	coords = vector4(124.82, -1815.63, 26.60, 227.98),
	LabelDistrict = "Davis",
	LabelStreet = "Brouge Ave",
	LabelDetail = "Carson Self Storage"
	},
	["davis-mosley"] = {
	coords = vector4(-42.21, -1675.16, 28.94, 138.37),
	LabelDistrict = "Strawberry",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Mosley Auto Service"
	},
	["davis-bishops"] = {
	coords = vector4(165.21, -1633.09, 28.81, 35.34),
	LabelDistrict = "Davis",
	LabelStreet = "Davis Ave",
	LabelDetail = "Bishop's"
	},
	["davis-fd"] = {
	coords = vector4(234.29, -1647.78, 28.80, 320.10),
	LabelDistrict = "Davis",
	LabelStreet = "Macdonald St",
	LabelDetail = "Fire-Department"
	},
	["davis-library"] = {
	coords = vector4(275.24, -1557.81, 28.71, 31.22),
	LabelDistrict = "Davis",
	LabelStreet = "Davis Ave",
	LabelDetail = "Public Library"
	},
	["davis-ringoffire"] = {
	coords = vector4(145.42, -1428.37, 28.81, 52.55),
	LabelDistrict = "Davis",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Ring of Fire Chili House"
	},
	["davis-lavaca"] = {
	coords = vector4(129.15, -1547.65, 28.84, 146.98),
	LabelDistrict = "Davis",
	LabelStreet = "Macdonald St",
	LabelDetail = "La Vaca Loca"
	},
	["davis-zanyz"] = {
	coords = vector4(237.61, -1501.59, 28.81, 221.14),
	LabelDistrict = "Davis",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "Zany-Z's"
	},
	["davis-cityhall"] = {
	coords = vector4(343.09, -1552.78, 28.81, 325.40),
	LabelDistrict = "Davis",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "City Hall"
	},
	
-- == CHAMBERLAIN HILLS == --

	["chamberlain-mall"] = {
	coords = vector4(86.07, -1403.96, 28.89, 298.65),
	LabelDistrict = "Strawberry",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "Chamberlain Mall"
	},
	["cahmberlain-church"] = {
	coords = vector4(30.58, -1517.45, 28.81, 223.27),
	LabelDistrict = "Strawberry",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Church"
	},
	["chamberlain-dollarpills"] = {
	coords = vector4(61.99, -1573.04, 29.11, 52.06),
	LabelDistrict = "Strawberry",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Dollar Pills"
	},
	["chemberlain-crystalheights"] = {
	coords = vector4(-176.16, -1664.46, 32.76, 92.30),
	LabelDistrict = "Chamberlain Hills",
	LabelStreet = "Forum Dr",
	LabelDetail = "Crystal Heights Project"
	},
	["chamberlain-ldorganics"] = {
	coords = vector4(-182.11, -1698.96, 32.18, 308.66),
	LabelDistrict = "Chamberlain Hills",
	LabelStreet = "Forum Dr",
	LabelDetail = "LD Organics"
	},
	["cahmberlain-forumdr2"] = {
	coords = vector4(-89.99, -1504.36, 33.08, 48.96),
	LabelDistrict = "Chamberlain Hills",
	LabelStreet = "Forum Dr",
	LabelDetail = "No. 2"
	},
	["chamberlain-onthebone"] = {
	coords = vector4(-40.80, -1471.85, 31.24, 5.57),
	LabelDistrict = "Strawberry",
	LabelStreet = "Forum Dr",
	LabelDetail = "On The Bone Butcher"
	},
	["chamberlain-bjsmith"] = {
	coords = vector4(-206.77, -1478.43, 30.92, 321.77),
	LabelDistrict = "Chamberlain Hills",
	LabelStreet = "Carson Ave",
	LabelDetail = "B.J. Smith Recreation Center"
	},
	
-- == STRAWBERRY == --

	["strawberry-corner"] = {
	coords = vector4(234.11, -1387.70, 30.16, 146.11),
	LabelDistrict = "Strawberry",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "Coroner"
	},
	["strawberry-xero"] = {
	coords = vector4(277.15, -1287.96, 28.91, 178.37),
	LabelDistrict = "Strawberry",
	LabelStreet = "Capital Blvd",
	LabelDetail = "Xero Gas Station"
	},
	["strawberry-hospital"] = {
	coords = vector4(315.39, -1375.36, 31.44, 49.50),
	LabelDistrict = "Strawberry",
	LabelStreet = "Crusade Rd",
	LabelDetail = "Central LS Medical Center"
	},
	["vanillaunicorn"] = {
	coords = vector4(132.90, -1304.95, 28.70, 211.10),
	LabelDistrict = "Strawberry",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Vanilla Unicorn"
	},
	["strawberry-ferns"] = {
	coords = vector4(56.87, -1313.73, 28.69, 298.66),
	LabelDistrict = "Strawberry",
	LabelStreet = "Elgin Ave",
	LabelDetail = "Fern's"
	},
	["strawberry-handson"] = {
	coords = vector4(-18.81, -1380.11, 28.83, 357.09),
	LabelDistrict = "Strawberry",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "Hands-On Car Wash"
	},
	["strawberry-lspaperco"] = {
	coords = vector4(-99.59, -1380.09, 28.91, 3.32),
	LabelDistrict = "Strawberry",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "LS Paper Co."
	},
	["strawberry-glassheroes"] = {
	coords = vector4(-193.14, -1398.79, 30.61, 213.86),
	LabelDistrict = "Strawberry",
	LabelStreet = "Innocence Blvd",
	LabelDetail = "Glass Heroes"
	},
	["strawberry-llp"] = {
	coords = vector4(-294.38, -1295.78, 30.78, 270.76),
	LabelDistrict = "Strawberry",
	LabelStreet = "Alta St",
	LabelDetail = "Larrys Lean Pork"
	},
	["strawberry-bennys"] = {
	coords = vector4(-200.11, -1308.00, 30.79, 348.85),
	LabelDistrict = "Strawberry",
	LabelStreet = "Olympic Fwy",
	LabelDetail = "Benny's Original Motor Works"
	},
	["strawberry-meteor"] = {
	coords = vector4(-116.49, -1313.50, 28.81, 266.32),
	LabelDistrict = "Strawberry",
	LabelStreet = "Power St",
	LabelDetail = "Los Santos Meteor"
	},
	
-- == MISSION ROW & TEXTILE CITY == --

	["missionrow-sanders"] = {
	coords = vector4(285.05, -1139.31, 28.90, 0.80),
	LabelDistrict = "Mission Row",
	LabelStreet = "Adam's Apple Blvd",
	LabelDetail = "Sanders Motorcycles"
	},
	["missionrow-lamoda"] = {
	coords = vector4(406.02, -1095.56, 28.92, 91.03),
	LabelDistrict = "Mission Row",
	LabelStreet = "Sinner St",
	LabelDetail = "La Moda"
	},
	["missionrow-rustybrowns"] = {
	coords = vector4(356.31, -1034.19, 28.84, 181.93),
	LabelDistrict = "Mission Row",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Rusty Browns"
	},
	["missionrow-templar"] = {
	coords = vector4(278.15, -1064.85, 28.93, 2.33),
	LabelDistrict = "Mission Row",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Templar Hotels"
	},
	["missionrow-vault"] = {
	coords = vector4(226.91, -1094.81, 28.81, 88.34),
	LabelDistrict = "Mission Row",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "The Vault Club"
	},
	["missionrow-coolbeans"] = {
	coords = vector4(260.10, -979.45, 28.87, 71.52),
	LabelDistrict = "Legion Square",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Cool Beans"
	},
	["missionrow-noodle"] = {
	coords = vector4(268.99, -960.21, 28.79, 35.73),
	LabelDistrict = "Mission Row",
	LabelStreet = "Atlee St",
	LabelDetail = "Noodle Exchange"
	},
	["missionrow-elkridge"] = {
	coords = vector4(285.10, -944.13, 28.93, 178.31),
	LabelDistrict = "Mission Row",
	LabelStreet = "Atlee St",
	LabelDetail = "Elkridge Hotel"
	},
	["missionrow-happyshark"] = {
	coords = vector4(375.04, -961.64, 28.95, 358.81),
	LabelDistrict = "Mission Row",
	LabelStreet = "Atlee St",
	LabelDetail = "Happy Shark"
	},
	["missionrow-lspd"] = {
	coords = vector4(408.12, -976.14, 28.93, 90.53),
	LabelDistrict = "Mission Row",
	LabelStreet = "Sinner St",
	LabelDetail = "Los Santos Police Department"
	},
	["missionrow-angels"] = {
	coords = vector4(355.23, -869.90, 28.80, 0.46),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "The Angels Theatre"
	},
	["missionrow-thelook"] = {
	coords = vector4(462.98, -947.41, 27.56, 184.46),
	LabelDistrict = "Mission Row",
	LabelStreet = "Atlee St",
	LabelDetail = "The Look Depository"
	},
	["missionrow-tgsa"] = {
	coords = vector4(493.58, -878.68, 24.95, 270.28),
	LabelDistrict = "Mission Row",
	LabelStreet = "Little Bighorn Ave",
	LabelDetail = "TGSA Textile Gallery"
	},
	["textile-simmetalleysouth"] = {
	coords = vector4(456.88, -817.93, 27.01, 186.03),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Sinners Passage",
	LabelDetail = "Simmet Alley, South"
	},
	["textile-binco"] = {
	coords = vector4(413.57, -802.22, 28.83, 98.66),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Sinner St",
	LabelDetail = "Binco"
	},
	["textile-digitalden"] = {
	coords = vector4(389.48, -839.26, 28.80, 182.21),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Sinner St",
	LabelDetail = "DigitalDen"
	},
	["textile-tencent"] = {
	coords = vector4(398.68, -711.48, 28.80, 269.38),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Sinner St",
	LabelDetail = "The Ten Cent Theater"
	},
	["textile-dashound"] = {
	coords = vector4(435.00, -669.95, 28.56, 172.71),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Integrity Way",
	LabelDetail = "Dashound Bus Depot"
	},
	["textile-simmetalleynorth"] = {
	coords = vector4(455.29, -684.30, 27.43, 4.58),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Integrity Way",
	LabelDetail = "Simmet Alley North"
	},
	["textile-railyard"] = {
	coords = vector4(500.94, -669.91, 24.69, 177.62),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Integrity Way",
	LabelDetail = "Mirror Park Railyard"
	},
	["textile-pillboxlower"] = {
	coords = vector4(363.38, -580.63, 28.35, 237.84),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Pillbox Medical Center, Lower Entrance"
	},
	["textile-foxys"] = {
	coords = vector4(342.08, -747.00, 28.79, 70.34),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Strawberry Ave",
	LabelDetail = "Foxy's"
	},
	
-- == PILLBOX HILL & LEGION SQUARE == --

	["pillbox-crucialfix"] = {
	coords = vector4(276.22, -838.10, 28.73, 210.78),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Crucial Fix Coffee House"
	},
	["legionquarenorth"] = {
	coords = vector4(233.07, -860.60, 29.42, 342.59),
	LabelDistrict = "Legion Square",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Legion Square, North"
	},
	["legionsquaresouth"] = {
	coords = vector4(160.99, -1007.73, 29.02, 157.54),
	LabelDistrict = "Legion Square",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Legion Square, South"
	},
	["pillbox-fleeca"] = {
	coords = vector4(152.38, -1032.06, 28.86, 337.40),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Fleeca Bank"
	},
	["pillbox-wolfs"] = {
	coords = vector4(82.95, -1096.90, 28.81, 72.64),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Elgin Ave",
	LabelDetail = "Wolfs International Realty"
	},
	["pillbox-integrity"] = {
	coords = vector4(255.92, -636.82, 40.08, 66.77),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Integrity Way",
	LabelDetail = "Integrity Tower"
	},
	["pillbox-pillboxupper"] = {
	coords = vector4(290.93, -605.13, 42.84, 58.55),
	LabelDistrict = "Textilbezirk",
	LabelStreet = "Elgin Ave",
	LabelDetail = "Pillbox Medical Center, Main Entrance"
	},
	["pillbox-penris"] = {
	coords = vector4(150.21, -581.26, 43.50, 161.97),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Integrity Way",
	LabelDetail = "Penris"
	},
	["pillbox-escapism"] = {
	coords = vector4(135.15, -875.58, 30.05, 253.67),
	LabelDistrict = "Legion Square",
	LabelStreet = "Elgin Ave",
	LabelDetail = "Escapism Travel"
	},
	["pillbox-emissary"] = {
	coords = vector4(113.72, -935.26, 29.29, 247.01),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Elgin Ave",
	LabelDetail = "The Emissary Hotel"
	},
	["pillbox-wisdahl"] = {
	coords = vector4(61.39, -999.82, 28.87, 337.41),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "The Wisdahl Hotel"
	},
	["pillbox-chihuahua"] = {
	coords = vector4(48.26, -995.14, 28.84, 343.17),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Chihuahua Hotdogs"
	},
	["pillbox-hookahpalace"] = {
	coords = vector4(2.54, -973.02, 29.11, 347.17),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Hookah Palace Hotel"
	},
	["pillbox-ammunation"] = {
	coords = vector4(11.79, -1123.67, 28.19, 183.51),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Adam's Apple Blvd",
	LabelDetail = "AmmuNation / LS Gun Club"
	},
	["pillbox-pdm"] = {
	coords = vector4(-70.38, -1096.16, 25.95, 73.18),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Power St",
	LabelDetail = "Premium Deluxe Motorsport"
	},
	["pillbox-paperclips"] = {
	coords = vector4(68.98, -796.72, 31.13, 342.01),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Paperclips"
	},
	["pillbox-fib"] = {
	coords = vector4(59.78, -745.39, 43.74, 67.38),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Power St",
	LabelDetail = "Federal Investigation Bureau"
	},
	["pillbox-IAA"] = {
	coords = vector4(100.55, -633.78, 43.73, 67.91),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Power St",
	LabelDetail = "International Affairs Agency"
	},
	["pillbox-udp"] = {
	coords = vector4(32.65, -714.86, 43.72, 249.56),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Low Power St",
	LabelDetail = "Union Depository"
	},
	["pillbox-mazebanktower"] = {
	coords = vector4(-51.52, -788.62, 43.74, 329.51),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Maze Bank Tower"
	},
	["pillbox-milehigh"] = {
	coords = vector4(-101.83, -940.09, 28.75, 334.73),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Mile High Club Construction Site"
	},
	["pillbox-mazebankacadia"] = {
	coords = vector4(-160.46, -881.68, 28.75, 123.83),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Maze Bank Arcadia"
	},
	["pillbox-vapid"] = {
	coords = vector4(-178.38, -1152.80, 22.61, 3.42),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Adam's Apple Blvd",
	LabelDetail = "Vapid Dealership"
	},
	["pillbox-tinkle"] = {
	coords = vector4(-69.21, -613.74, 35.78, 72.36),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Alta St",
	LabelDetail = "Tinkle / 4 Integrity Way"
	},
	["pillbox-arcadiuseast"] = {
	coords = vector4(-108.45, -605.56, 35.79, 249.91),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Alta St",
	LabelDetail = "Arcadius Business Center, Main Entrance"
	},
	["pillbox-schlongbergsachs"] = {
	coords = vector4(-160.61, -776.10, 31.97, 251.71),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Alta St",
	LabelDetail = "Schlongberg Sachs Tower"
	},
	["pillbox-gruppe6"] = {
	coords = vector4(-183.08, -837.21, 29.84, 248.40),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Alta St",
	LabelDetail = "Gruppe sechs"
	},
	["pillbox-postop"] = {
	coords = vector4(-212.08, -915.09, 28.81, 257.61),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Alta St",
	LabelDetail = "Post OP Couriers"
	},
	["pillbox-3altastr"] = {
	coords = vector4(-240.18, -991.23, 28.80, 248.14),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Alta St",
	LabelDetail = "No. 3"
	},
	["pillbox-banner"] = {
	coords = vector4(-281.38, -1063.42, 25.57, 250.79),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Alta St",
	LabelDetail = "Banner Hotel"
	},
	["pillbox-gopostal"] = {
	coords = vector4(-256.05, -852.10, 30.75, 162.65),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "GO Postal"
	},
	["pillbox-beanmachine"] = {
	coords = vector4(-325.25, -834.57, 31.10, 172.71),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Bean Machine"
	},
	["pillbox-redemption"] = {
	coords = vector4(-249.70, -773.47, 32.11, 70.23),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Peaceful St",
	LabelDetail = "Cafe Redemption"
	},
	["pillbox-slaughter"] = {
	coords = vector4(-270.31, -679.97, 32.86, 345.99),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Slaughter, Slaughter & Slaugther"
	},
	["pillbox-arcadiuswest"] = {
	coords = vector4(-217.37, -591.05, 33.89, 74.10),
	LabelDistrict = "Pillbox Hill",
	LabelStreet = "Las Lagunas Blvd",
	LabelDetail = "Arcadius Business Center, West"
	},
	["downtown-dailyglobe"] = {
	coords = vector4(-302.81, -617.09, 33.08, 213.32),
	LabelDistrict = "Innenstadt",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Daily Globe International"
	},
	
}

Config.PedModels = {
	'a_f_m_skidrow_01',
	'a_f_m_soucentmc_01',
	'a_f_m_soucent_01',
	'a_f_m_soucent_02',
	'a_f_m_tourist_01',
	'a_f_m_trampbeac_01',
	'a_f_m_tramp_01',
	'a_f_o_genstreet_01',
	'a_f_o_indian_01',
	'a_f_o_ktown_01',
	'a_f_o_salton_01',
	'a_f_o_soucent_01',
	'a_f_o_soucent_02',
	'a_f_y_beach_01',
	'a_f_y_bevhills_01',
	'a_f_y_bevhills_02',
	'a_f_y_bevhills_03',
	'a_f_y_bevhills_04',
	'a_f_y_business_01',
	'a_f_y_business_02',
	'a_f_y_business_03',
	'a_f_y_business_04',
	'a_f_y_eastsa_01',
	'a_f_y_eastsa_02',
	'a_f_y_eastsa_03',
	'a_f_y_epsilon_01',
	'a_f_y_fitness_01',
	'a_f_y_fitness_02',
	'a_f_y_genhot_01',
	'a_f_y_golfer_01',
	'a_f_y_hiker_01',
	'a_f_y_hipster_01',
	'a_f_y_hipster_02',
	'a_f_y_hipster_03',
	'a_f_y_hipster_04',
	'a_f_y_indian_01',
	'a_f_y_juggalo_01',
	'a_f_y_runner_01',
	'a_f_y_rurmeth_01',
	'a_f_y_scdressy_01',
	'a_f_y_skater_01',
	'a_f_y_soucent_01',
	'a_f_y_soucent_02',
	'a_f_y_soucent_03',
	'a_f_y_tennis_01',
	'a_f_y_tourist_01',
	'a_f_y_tourist_02',
	'a_f_y_vinewood_01',
	'a_f_y_vinewood_02',
	'a_f_y_vinewood_03',
	'a_f_y_vinewood_04',
	'a_f_y_yoga_01',
	'g_f_y_ballas_01',
	'ig_barry',
	'ig_bestmen',
	'ig_beverly',
	'ig_car3guy1',
	'ig_car3guy2',
	'ig_casey',
	'ig_chef',
	'ig_chengsr',
	'ig_chrisformage',
	'ig_clay',
	'ig_claypain',
	'ig_cletus',
	'ig_dale',
	'ig_dreyfuss',
	'ig_fbisuit_01',
	'ig_floyd',
	'ig_groom',
	'ig_hao',
	'ig_hunter',
	'csb_prolsec',
	'ig_joeminuteman',
	'ig_josef',
	'ig_josh',
	'ig_lamardavis',
	'ig_lazlow',
	'ig_lestercrest',
	'ig_lifeinvad_01',
	'ig_lifeinvad_02',
	'ig_manuel',
	'ig_milton',
	'ig_mrk',
	'ig_nervousron',
	'ig_nigel',
	'ig_old_man1a',
	'ig_old_man2',
	'ig_oneil',
	'ig_orleans',
	'ig_ortega',
	'ig_paper',
	'ig_priest',
	'ig_prolsec_02',
	'ig_ramp_gang',
	'ig_ramp_hic',
	'ig_ramp_hipster',
	'ig_ramp_mex',
	'ig_roccopelosi',
	'ig_russiandrunk',
	'ig_siemonyetarian',
	'ig_solomon',
	'ig_stevehains',
	'ig_stretch',
	'ig_talina',
	'ig_taocheng',
	'ig_taostranslator',
	'ig_tenniscoach',
	'ig_terry',
	'ig_tomepsilon',
	'ig_tylerdix',
	'ig_wade',
	'ig_zimbor',
	's_m_m_paramedic_01',
	'a_m_m_afriamer_01',
	'a_m_m_beach_01',
	'a_m_m_beach_02',
	'a_m_m_bevhills_01',
	'a_m_m_bevhills_02',
	'a_m_m_business_01',
	'a_m_m_eastsa_01',
	'a_m_m_eastsa_02',
	'a_m_m_farmer_01',
	'a_m_m_fatlatin_01',
	'a_m_m_genfat_01',
	'a_m_m_genfat_02',
	'a_m_m_golfer_01',
	'a_m_m_hasjew_01',
	'a_m_m_hillbilly_01',
	'a_m_m_hillbilly_02',
	'a_m_m_indian_01',
	'a_m_m_ktown_01',
	'a_m_m_malibu_01',
	'a_m_m_mexcntry_01',
	'a_m_m_mexlabor_01',
	'a_m_m_og_boss_01',
	'a_m_m_paparazzi_01',
	'a_m_m_polynesian_01',
	'a_m_m_prolhost_01',
	'a_m_m_rurmeth_01',
}