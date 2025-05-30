Config = {}

-----------------------------------
-- DEBUG & BASE CONFIG
-----------------------------------

Config.Debug = false
Config.jobRequired = 'taxi'

-----------------------------------
-- VEHICLES & DEPOT
-----------------------------------

Config.AllowedVehicles = {
	{ model = 'taxi', label = 'Standard Taxi' },
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

Config.MinCabHealth = 900		-- 1 - 1000 (200 = 20%)
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
	LabelDistrict = "LSIA",
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
	["cypress-zalinsky"] = {
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
	["rancho-lspdimpound"] = {
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
	
-- == LA PUERTA == --
	
	["puerta-fridgit"] = {
	coords = vector4(-598.46, -1806.48, 22.81, 165.06),
	LabelDistrict = "La Puerta",
	LabelStreet = "Mutiny Rd",
	LabelDetail = "FRIDGIT Warehouse"
	},
	["puerta-containeryard"] = {
	coords = vector4(-669.28, -1745.53, 24.68, 102.14),
	LabelDistrict = "La Puerta",
	LabelStreet = "La Puerta Fwy",
	LabelDetail = "Containeryard"
	},
	["puerta-warehouse1"] = {
	coords = vector4(-539.50, -1768.60, 21.01, 320.95),
	LabelDistrict = "La Puerta",
	LabelStreet = "South Arsenal St",
	LabelDetail = "Warehouse 1"
	},
	["puerta-rogersloading"] = {
	coords = vector4(-612.85, -1603.51, 26.27, 41.92),
	LabelDistrict = "La Puerta",
	LabelStreet = "Mutiny Rd",
	LabelDetail = "Rogers Scrapyard, Loading Area"
	},
	["puerta-rogersgate"] = {
	coords = vector4(-414.01, -1723.18, 18.81, 289.55),
	LabelDistrict = "La Puerta",
	LabelStreet = "Alta St",
	LabelDetail = "Rogers Scrapyard, Main Gate"
	},
	["puerta-recycling"] = {
	coords = vector4(-311.02, -1514.23, 27.44, 146.83),
	LabelDistrict = "La Puerta",
	LabelStreet = "Alta St",
	LabelDetail = "South LS Recycling"
	},
	["puerta-heliport"] = {
	coords = vector4(-660.26, -1382.80, 10.15, 268.92),
	LabelDistrict = "La Puerta",
	LabelStreet = "Dutch London St",
	LabelDetail = "Heliport"
	},
	["puerta-sho"] = {
	coords = vector4(-658.15, -1248.77, 10.13, 119.36),
	LabelDistrict = "La Puerta",
	LabelStreet = "South Rockford Dr",
	LabelDetail = "S.Ho Noodle House"
	},
	["puerta-delsol"] = {
	coords = vector4(-816.65, -1333.52, 4.67, 354.74),
	LabelDistrict = "La Puerta",
	LabelStreet = "Tackle St",
	LabelDetail = "Puerta del Sol Marina"
	},
	["puerta-laspada1"] = {
	coords = vector4(-1043.82, -1350.89, 5.02, 19.08),
	LabelDistrict = "La Puerta",
	LabelStreet = "Goma St",
	LabelDetail = "La Spada, Back"
	},
	["puerta-laspada2"] = {
	coords = vector4(-1051.48, -1390.35, 4.94, 160.22),
	LabelDistrict = "La Puerta",
	LabelStreet = "Goma St",
	LabelDetail = "La Spada Restaurant"
	},
	["puerta-koi"] = {
	coords = vector4(-1030.40, -1461.24, 4.57, 22.11),
	LabelDistrict = "La Puerta",
	LabelStreet = "Tug St",
	LabelDetail = "KOI Restaurant"
	},
	["puerta-gomast"] = {
	coords = vector4(-986.68, -1438.66, 4.70, 111.22),
	LabelDistrict = "La Puerta",
	LabelStreet = "Goma St",
	LabelDetail = "Apartments"
	},
	["puerta-pool"] = {
	coords = vector4(-1034.91, -1529.54, 4.61, 127.38),
	LabelDistrict = "La Puerta",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Pool Club"
	},
	["puerta-rubst"] = {
	coords = vector4(-939.42, -1524.92, 4.70, 107.61),
	LabelDistrict = "La Puerta",
	LabelStreet = "Rub St",
	LabelDetail = "Apartments"
	},
	
-- == VESPUCCI ( + BEACH & CANALS ) == --	

	["vespucci-tower"] = {
	coords = vector4(-1173.51, -1766.05, 3.45, 217.40),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Lifeguard Tower"
	},
	["vespucci-magellanave1"] = {
	coords = vector4(-1075.68, -1584.20, 3.86, 133.37),
	LabelDistrict = "La Puerta",
	LabelStreet = "Magellan Ave",
	LabelDetail = "No. 1"
	},
	["vespucci-gym"] = {
	coords = vector4(-1149.95, -1597.10, 3.90, 29.23),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Melanoma St",
	LabelDetail = "Pink Palms / Gym"
	},
	["vespucci-magellanave2"] = {
	coords = vector4(-1133.72, -1527.25, 3.88, 299.09),
	LabelDistrict = "La Puerta",
	LabelStreet = "Magellan Ave",
	LabelDetail = "No. 2"
	},
	["vespucci-musclepeach"] = {
	coords = vector4(-1199.36, -1537.48, 3.89, 314.28),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Goma St",
	LabelDetail = "Muscle Peach / Gym"
	},
	["vespucci-aldentes"] = {
	coords = vector4(-1174.28, -1407.98, 3.95, 220.68),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Aguja St",
	LabelDetail = "Al Dente's Restaurant"
	},
	["vespucci-sharkies"] = {
	coords = vector4(-1288.76, -1389.80, 4.00, 203.44),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Sharkies Bites Pizza"
	},
	["vespucci-steamboat"] = {
	coords = vector4(-1212.73, -1382.68, 3.53, 69.95),
	LabelDistrict = "Vespucci",
	LabelStreet = "Magellan Ave",
	LabelDetail = "Steamboat Beers"
	},
	["vespucci-magellanave3"] = {
	coords = vector4(-1249.25, -1294.73, 3.45, 109.48),
	LabelDistrict = "Vespucci",
	LabelStreet = "Magellan Ave",
	LabelDetail = "No. 3"
	},
	["vespucci-moviemasks"] = {
	coords = vector4(-1321.88, -1285.63, 4.51, 199.86),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Vitus St",
	LabelDetail = "Movie Masks Shop"
	},
	["vespucci-nutbuster"] = {
	coords = vector4(-1275.81, -1191.06, 4.47, 25.87),
	LabelDistrict = "Vespucci",
	LabelStreet = "Cortes St",
	LabelDetail = "Nut Buster Restaurant"
	},
	["vespucci-pizzacoven"] = {
	coords = vector4(-1339.03, -1211.74, 4.29, 3.45),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Cortes St",
	LabelDetail = "The Pizza Coven"
	},
	["vespucci-alphabetz"] = {
	coords = vector4(-1272.97, -1156.51, 5.78, 120.86),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Cortes St",
	LabelDetail = "Alphabetz Shoe Store"
	},
	["vespucci-oldiegoldie"] = {
	coords = vector4(-1296.88, -1103.24, 6.46, 117.44),
	LabelDistrict = "Vespucci",
	LabelStreet = "Magellan Ave",
	LabelDetail = "Oldie But Goldie"
	},
	["vespucci-venetian"] = {
	coords = vector4(-1331.71, -1094.19, 6.46, 208.39),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Conquistador St",
	LabelDetail = "Venetian"
	},
	["vespucci-beachhotel"] = {
	coords = vector4(-1382.14, -974.22, 8.46, 305.50),
	LabelDistrict = "Vespucci Beach",
	LabelStreet = "Magellan Ave",
	LabelDetail = "The Vespucci Beach Hotel"
	},
	["vespucci-trinculo"] = {
	coords = vector4(-1230.35, -1079.53, 7.83, 108.74),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Trinculo Clothes"
	},
	["vespucci-coolbeans"] = {
	coords = vector4(-1211.61, -1138.74, 7.14, 103.56),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Cool Beans Coffe"
	},
	["vespucci-potheads"] = {
	coords = vector4(-1220.79, -1187.21, 7.22, 277.08),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Pot-Heads Seafood"
	},
	["vespucci-tacolibre"] = {
	coords = vector4(-1177.27, -1270.62, 5.59, 114.88),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Taco Libre Restaurant"
	},
	["vespucci-marlins"] = {
	coords = vector4(-1134.13, -1374.82, 4.61, 107.18),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Marlins Cafe"
	},
	["vespucci-coconut"] = {
	coords = vector4(-1114.57, -1441.09, 4.63, 307.15),
	LabelDistrict = "La Puerta",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Coconut Cafe"
	},
	["vespucci-puertodelsoltowers"] = {
	coords = vector4(-974.77, -1253.79, 5.07, 28.75),
	LabelDistrict = "La Puerta",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Puerto Del Sol Towers"
	},
	["viceroy"] = {
	coords = vector4(-823.93, -1221.35, 6.88, 41.98),
	LabelDistrict = "La Puerta",
	LabelStreet = "Palomino Ave",
	LabelDetail = "The Viceroy Hotel"
	},
	["vespucci-wigwam"] = {
	coords = vector4(-852.36, -1148.19, 5.97, 212.16),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Wigwam"
	},
	["vespucci-backside"] = {
	coords = vector4(-915.76, -1184.57, 4.60, 211.92),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Backside Skateboards"
	},
	["vespucci-whitewidow"] = {
	coords = vector4(-1085.48, -1282.29, 5.16, 205.63),
	LabelDistrict = "La Puerta",
	LabelStreet = "Palomino Ave",
	LabelDetail = "White Widow"
	},
	["vespucci-canals1"] = {
	coords = vector4(-1006.14, -1105.28, 1.67, 124.74),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Prosperity St",
	LabelDetail = "No. 1"
	},
	["vespucci-canals2"] = {
	coords = vector4(-1062.04, -1038.56, 1.58, 306.54),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Prosperity St",
	LabelDetail = "No. 2"
	},
	["vespucci-canals3"] = {
	coords = vector4(-1184.04, -956.55, 3.46, 198.74),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "No. 3"
	},
	["vespucci-lspdcarpark"] = {
	coords = vector4(-1041.48, -890.96, 4.63, 32.38),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "LSPD Carpark"
	},
	["vespucci-celltowa"] = {
	coords = vector4(-1047.82, -753.28, 18.69, 48.57),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Celltowa Tower"
	},
	["vespucci-lspd"] = {
	coords = vector4(-1131.73, -821.64, 15.20, 23.18),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "LSPD"
	},
	["vespucci-burgershot"] = {
	coords = vector4(-1194.46, -875.22, 13.10, 30.02),
	LabelDistrict = "Vespucci-Canals",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Burger Shot"
	},

-- == LITTLE SEOUL == --

	["seoul-koreanplaza"] = {
	coords = vector4(-578.57, -1086.70, 21.84, 182.01),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Calais Ave",
	LabelDetail = "Korean Plaza"
	},
	["seoul-yogarishima"] = {
	coords = vector4(-513.12, -860.55, 29.58, 271.50),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Calais Ave",
	LabelDetail = "Yogarishima"
	},
	["seoul-snrbuns"] = {
	coords = vector4(-518.72, -670.81, 32.73, 1.93),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Snr. Buns"
	},
	["seoul-betsyoneil"] = {
	coords = vector4(-554.80, -645.86, 32.75, 181.54),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Betsy O'Neil Pavillon"
	},
	["seoul-hitnrun"] = {
	coords = vector4(-568.08, -670.76, 32.70, 358.82),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Hit 'n' Run"
	},
	["seoul-totalbankers"] = {
	coords = vector4(-590.25, -671.01, 31.82, 1.75),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Total Bankers"
	},
	["seoul-lombank"] = {
	coords = vector4(-691.97, -645.42, 30.69, 179.20),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Lombank"
	},
	["seoul-tacobomb"] = {
	coords = vector4(-650.23, -686.65, 30.51, 268.86),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Taco Bomb Restaurant"
	},
	["seoul-beanmachine1"] = {
	coords = vector4(-650.45, -798.60, 24.48, 270.06),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Bean Machine"
	},
	["seoul-airangplaza"] = {
	coords = vector4(-696.28, -824.44, 23.34, 185.54),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Airang Plaza"
	},
	["seoul-kayton"] = {
	coords = vector4(-732.26, -821.06, 22.52, 137.43),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Ginger St",
	LabelDetail = "Kayton Banking Group"
	},
	["seoul-247"] = {
	coords = vector4(-695.46, -849.37, 23.22, 5.71),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "24/7"
	},
	["seoul-hwancafe"] = {
	coords = vector4(-650.52, -903.57, 24.03, 273.11),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Hwan-Cafe / Garden"
	},
	["seoul-luckyplucker"] = {
	coords = vector4(-598.26, -882.79, 25.09, 91.37),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Lucky Plucker"
	},
	["seoul-weazelnews"] = {
	coords = vector4(-622.20, -940.82, 21.48, 41.50),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Palomino Ave",
	LabelDetail = "Weazel News HQ"
	},
	["seoul-ammunation"] = {
	coords = vector4(-663.62, -950.00, 21.03, 184.49),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Lindsay Circus",
	LabelDetail = "AmmuNation"
	},
	["seoul-palominoave1"] = {
	coords = vector4(-674.26, -1101.08, 14.07, 82.59),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Palomino Ave",
	LabelDetail = "No. 1"
	},
	["seoul-bsc"] = {
	coords = vector4(-732.44, -1108.69, 10.92, 28.50),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Palomino Ave",
	LabelDetail = "BSC Maintenance"
	},
	["seoul-gingerst1"] = {
	coords = vector4(-755.96, -1030.83, 12.60, 294.16),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Ginger St",
	LabelDetail = "No. 1"
	},
	["seoul-deckerpark1"] = {
	coords = vector4(-846.00, -933.00, 15.17, 95.77),
	LabelDistrict = "Vespucci-Kanäle",
	LabelStreet = "Decker St",
	LabelDetail = "Decker Park Mini"
	},
	["seoul-pavilion"] = {
	coords = vector4(-862.72, -847.90, 18.84, 300.12),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Decker St",
	LabelDetail = "Korean Pavilion"
	},
	["seoul-deckerpark2"] = {
	coords = vector4(-867.19, -716.97, 25.72, 268.61),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Decker St",
	LabelDetail = "Decker Park, East"
	},
	["seoul-deckerpark3"] = {
	coords = vector4(-981.39, -809.38, 15.53, 155.70),
	LabelDistrict = "Vespucci-Kanäle",
	LabelStreet = "Vespucci Blvd",
	LabelDetail = "Decker Park, South"
	},
	["seoul-celltowabuilding"] = {
	coords = vector4(-1008.67, -720.58, 20.46, 40.20),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Celltowa Building"
	},
	["seoul-wiwang"] = {
	coords = vector4(-852.15, -694.25, 27.13, 92.24),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Decker St",
	LabelDetail = "Wiwang Tower"
	},
	["seoul-beanmachine2"] = {
	coords = vector4(-825.84, -639.17, 27.35, 153.83),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Bean Machine"
	},
	["seoul-church"] = {
	coords = vector4(-789.04, -669.75, 28.60, 5.14),
	LabelDistrict = "Little Seoul",
	LabelStreet = "San Andreas Ave",
	LabelDetail = "Church"
	},
	["seoul-valdez"] = {
	coords = vector4(-732.73, -673.78, 29.75, 43.47),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Ginger St",
	LabelDetail = "Valdez Theater"
	},
	["seoul-dreamtower"] = {
	coords = vector4(-751.85, -769.17, 25.19, 268.90),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Ginger St",
	LabelDetail = "Dream Tower"
	},
	["seoul-kaytontowers"] = {
	coords = vector4(-800.28, -589.69, 29.79, 331.42),
	LabelDistrict = "Little Seoul",
	LabelStreet = "Del Perro Fwy",
	LabelDetail = "Kayton Towers"
	},
	
-- == DEL PERRO == --
	
	["perro-crownjewels"] = {
	coords = vector4(-1305.43, -911.89, 10.86, 289.13),
	LabelDistrict = "Del Perro",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Crown Jewels Motel"
	},
	["perro-acornsintooaks"] = {
	coords = vector4(-1299.90, -859.92, 13.74, 125.04),
	LabelDistrict = "Del Perro",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Acorns into Oaks"
	},
	["perro-giovannis"] = {
	coords = vector4(-1336.39, -861.89, 16.28, 308.12),
	LabelDistrict = "Del Perro",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Giovanni's Italian Restaurant"
	},
	["perro-hedera"] = {
	coords = vector4(-1361.77, -798.07, 18.85, 142.85),
	LabelDistrict = "Del Perro",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Hedera Restaurant"
	},
	["perro-haute"] = {
	coords = vector4(-1413.90, -742.18, 22.92, 69.61),
	LabelDistrict = "Del Perro",
	LabelStreet = "Del Perro Fwy",
	LabelDetail = "Haute Restaurant"
	},
	["perro-pescadorojo"] = {
	coords = vector4(-1424.57, -721.78, 22.99, 186.59),
	LabelDistrict = "Del Perro",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Pescado Rojo Restaurant"
	},
	["perro-astro"] = {
	coords = vector4(-1344.72, -689.36, 25.11, 31.75),
	LabelDistrict = "Del Perro",
	LabelStreet = "Red Desert Ave",
	LabelDetail = "Astro Theater"
	},
	["perro-grainoftruth"] = {
	coords = vector4(-1361.40, -683.37, 24.78, 216.84),
	LabelDistrict = "Del Perro",
	LabelStreet = "Red Desert Ave",
	LabelDetail = "The Grain of Truth"
	},
	["perro-pieroot"] = {
	coords = vector4(-1640.38, -985.71, 12.54, 232.95),
	LabelDistrict = "Del Perro Beach",
	LabelStreet = "Red Desert Ave",
	LabelDetail = "Del Perro Pier, Out of Towners"
	},
	["perro-pierbigpuffa"] = {
	coords = vector4(-1611.67, -977.70, 12.53, 46.92),
	LabelDistrict = "Del Perro Beach",
	LabelStreet = "Red Desert Ave",
	LabelDetail = "Del Perro Pier, The Big Puffa"
	},
	["perro-pier"] = {
	coords = vector4(-1603.66, -1042.23, 12.58, 319.46),
	LabelDistrict = "Del Perro Beach",
	LabelStreet = "Red Desert Ave",
	LabelDetail = "Del Perro Pier"
	},
	["perro-perreramotel"] = {
	coords = vector4(-1458.42, -655.68, 29.02, 43.29),
	LabelDistrict = "Del Perro",
	LabelStreet = "Marathon Ave",
	LabelDetail = "Perrera Beach Motel"
	},
	["perro-blufflombank"] = {
	coords = vector4(-1596.99, -573.08, 34.49, 67.03),
	LabelDistrict = "Del Perro",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Bluff Tower / Lombank"
	},
	["bahamamamas"] = {
	coords = vector4(-1392.63, -584.64, 29.76, 34.63),
	LabelDistrict = "Del Perro",
	LabelStreet = "Marathon Ave",
	LabelDetail = "Bahama Mamas Club"
	},
	["perro-promenade"] = {
	coords = vector4(-1363.92, -565.35, 29.64, 34.11),
	LabelDistrict = "Del Perro",
	LabelStreet = "Marathon Ave",
	LabelDetail = "Prosperity Promenade"
	},
	["perro-mazebank"] = {
	coords = vector4(-1387.10, -529.30, 30.37, 123.91),
	LabelDistrict = "Del Perro",
	LabelStreet = "Prosperity St",
	LabelDetail = "Maze Bank"
	},
	["perro-heights"] = {
	coords = vector4(-1405.48, -563.18, 29.79, 208.78),
	LabelDistrict = "Del Perro",
	LabelStreet = "Marathon Ave",
	LabelDetail = "Del Perro Heights"
	},
	["perro-crastenburg"] = {
	coords = vector4(-1555.56, -518.58, 35.21, 58.17),
	LabelDistrict = "Del Perro",
	LabelStreet = "Boulevard Del Perro",
	LabelDetail = "Crastenburg Hotel"
	},
	["perro-delperroplaza"] = {
	coords = vector4(-1512.03, -444.17, 35.11, 36.90),
	LabelDistrict = "Del Perro",
	LabelStreet = "Boulevard Del Perro",
	LabelDetail = "Del Perro Plaza"
	},
	["perro-upnatom"] = {
	coords = vector4(-1547.15, -476.41, 34.98, 209.70),
	LabelDistrict = "Del Perro",
	LabelStreet = "Boulevard Del Perro",
	LabelDetail = "Up-n-Atom Hamburgers"
	},
	["perro-banner"] = {
	coords = vector4(-1665.12, -539.64, 34.68, 141.62),
	LabelDistrict = "Del Perro",
	LabelStreet = "Bay City Ave",
	LabelDetail = "Banner Hotel"
	},
	["perro-voncrastenburg"] = {
	coords = vector4(-1860.56, -349.04, 49.36, 134.46),
	LabelDistrict = "Pacific Bluffs",
	LabelStreet = "Playa Vista",
	LabelDetail = "Von Crastenburg Hotel"
	},
	["perro-delperrofwy1"] = {
	coords = vector4(-1810.87, -634.42, 10.48, 316.39),
	LabelDistrict = "Del Perro",
	LabelStreet = "Magellan Ave",
	LabelDetail = "No. 1"
	},
	["perro-delperrofwy2"] = {
	coords = vector4(-1776.26, -669.00, 9.90, 322.51),
	LabelDistrict = "Del Perro",
	LabelStreet = "Del Perro Fwy",
	LabelDetail = "No. 2"
	},
	["perro-beach"] = {
	coords = vector4(-1646.57, -832.52, 9.50, 136.96),
	LabelDistrict = "Del Perro Beach",
	LabelStreet = "Magellan Ave",
	LabelDetail = "Del Perro Beach"
	},
	["perro-cityhall"] = {
	coords = vector4(-1276.75, -560.47, 29.71, 314.51),
	LabelDistrict = "Del Perro",
	LabelStreet = "South Rockford Dr",
	LabelDetail = "City Hall"
	},
	
-- == MORNINGWOOD & Richards Majestic== --
	
	["bluffs-hillvalley"] = {
	coords = vector4(-1692.80, -290.12, 51.40, 143.36),
	LabelDistrict = "Pacific Bluffs",
	LabelStreet = "West Eclipse Blvd",
	LabelDetail = "Hill Valley Church & Cemetery"
	},
	["morningwood-staceys"] = {
	coords = vector4(-1488.53, -398.32, 38.15, 156.13),
	LabelDistrict = "Morningwood",
	LabelStreet = "Prosperity St",
	LabelDetail = "Stacey's Flower Emporium"
	},
	["morningwood-panache"] = {
	coords = vector4(-1406.45, -385.31, 36.09, 266.19),
	LabelDistrict = "Morningwood",
	LabelStreet = "Boulevard Del Perro",
	LabelDetail = "Panache Cleaning"
	},
	["morningwood-lascuadrasdeli"] = {
	coords = vector4(-1473.30, -308.06, 45.78, 312.45),
	LabelDistrict = "Morningwood",
	LabelStreet = "North Rockford Dr",
	LabelDetail = "Las Cuadras Deli"
	},
	["morningwood-enoteca"] = {
	coords = vector4(-1574.51, -212.26, 54.56, 39.32),
	LabelDistrict = "Morningwood",
	LabelStreet = "West Eclipse Blvd",
	LabelDetail = "Enoteca Kerplonk"
	},
	["elginhouse"] = {
	coords = vector4(-1281.80, -425.97, 34.21, 123.50),
	LabelDistrict = "Richards Majestic",
	LabelStreet = "Morningwood Blvd",
	LabelDetail = "Elgin House"
	},
	["morningwoo-tivoli"] = {
	coords = vector4(-1420.81, -194.34, 46.59, 350.52),
	LabelDistrict = "Morningwood",
	LabelStreet = "Morningwood Blvd",
	LabelDetail = "Tivoli Theater"
	},
	["morningwood-theater"] = {
	coords = vector4(-1395.76, -172.71, 46.88, 89.22),
	LabelDistrict = "Morningwood",
	LabelStreet = "Morningwood Blvd",
	LabelDetail = "Weazel Morningwood Theater"
	},
	["morningwood-xyz"] = {
	coords = vector4(-1431.29, -174.38, 46.95, 260.52),
	LabelDistrict = "Morningwood",
	LabelStreet = "Morningwood Blvd",
	LabelDetail = "XYZ-Store"
	},
	["morningwood-ponsonbys"] = {
	coords = vector4(-1455.43, -228.81, 48.76, 47.71),
	LabelDistrict = "Morningwood",
	LabelStreet = "Cougar Ave",
	LabelDetail = "Ponsonbys"
	},
	["morningwood-vankhov"] = {
	coords = vector4(-1382.76, -285.29, 42.71, 41.93),
	LabelDistrict = "Morningwood",
	LabelStreet = "Perth St",
	LabelDetail = "Vankhov Jewelry"
	},
	["majestic-southgate"] = {
	coords = vector4(-1207.04, -591.47, 26.81, 131.33),
	LabelDistrict = "Richards Majestic",
	LabelStreet = "North Rockford Dr",
	LabelDetail = "Film Studios, South Gate"
	},
	["majestic-northgate"] = {
	coords = vector4(-1061.62, -467.98, 36.11, 303.81),
	LabelDistrict = "Richards Majestic",
	LabelStreet = "Heritage Way",
	LabelDetail = "Film Studios, North Gate"
	},
	["majestic-kayton"] = {
	coords = vector4(-1065.21, -437.96, 36.16, 120.50),
	LabelDistrict = "Richards Majestic",
	LabelStreet = "Heritage Way",
	LabelDetail = "Kayton Tower"
	},
	
-- == RICHMAN & GOLF CLUB == --
	["kortz1"] = {
	coords = vector4(-2305.53, 371.59, 174.12, 356.48),
	LabelDistrict = "Pacific Bluffs",
	LabelStreet = "Kortz Dr",
	LabelDetail = "Kortz Center Entrance"
	},
	["kortz2"] = {
	coords = vector4(-2294.85, 373.15, 174.12, 17.47),
	LabelDistrict = "Pacific Bluffs",
	LabelStreet = "Kortz Dr",
	LabelDetail = "Kortz Center Entrance"
	},
	["kortz3"] = {
	coords = vector4(-2282.44, 387.74, 174.12, 75.35),
	LabelDistrict = "Pacific Bluffs",
	LabelStreet = "Kortz Dr",
	LabelDetail = "Kortz Center Entrance"
	},
	["kortz4"] = {
	coords = vector4(-2316.84, 313.49, 169.12, 33.11),
	LabelDistrict = "Pacific Bluffs",
	LabelStreet = "Kortz Dr",
	LabelDetail = "Kortz Center Parking"
	},
	["richman-nrockforddr1"] = {
	coords = vector4(-1958.29, 391.75, 94.89, 92.04),
	LabelDistrict = "Richman",
	LabelStreet = "North Rockford Dr",
	LabelDetail = "No. 1"
	},
	["richman-nrockforddr2"] = {
	coords = vector4(-1965.08, 281.11, 86.65, 288.65),
	LabelDistrict = "Richman",
	LabelStreet = "North Rockford Dr",
	LabelDetail = "No. 2"
	},
	["richman-nrockforddr3"] = {
	coords = vector4(-1917.77, 222.22, 84.14, 119.72),
	LabelDistrict = "Richman",
	LabelStreet = "North Rockford Dr",
	LabelDetail = "No. 3"
	},
	["richman-northrockfeorddr4"] = {
	coords = vector4(-1895.24, 159.14, 81.06, 322.23),
	LabelDistrict = "Richman",
	LabelStreet = "North Rockford Dr",
	LabelDetail = "No. 4"
	},
	["ulsa-sports1"] = {
	coords = vector4(-1681.34, 122.67, 63.44, 217.95),
	LabelDistrict = "Richman",
	LabelStreet = "Picture Perfect Drive",
	LabelDetail = "ULSA, Sports Complex"
	},
	["ulsa-campus1"] = {
	coords = vector4(-1614.74, 188.39, 59.59, 211.68),
	LabelDistrict = "Richman",
	LabelStreet = "Picture Perfect Drive",
	LabelDetail = "ULSA, Campus"
	},
	["ulsa-campus2"] = {
	coords = vector4(-1570.90, 251.85, 58.46, 316.95),
	LabelDistrict = "Richman",
	LabelStreet = "Richman St",
	LabelDetail = "ULSA, Campus"
	},
	["ulsa-sports2"] = {
	coords = vector4(-1676.67, 281.37, 60.84, 17.52),
	LabelDistrict = "Richman",
	LabelStreet = "Richman St",
	LabelDetail = "ULSA, Sports Complex, Gym"
	},
	["ulsa-sports3"] = {
	coords = vector4(-1774.84, 220.28, 68.06, 43.04),
	LabelDistrict = "Richman",
	LabelStreet = "Richman St",
	LabelDetail = "ULSA, Sports Complex, Ranks"
	},
	["richman-acedr1"] = {
	coords = vector4(-1814.45, 345.21, 88.14, 35.33),
	LabelDistrict = "Richman",
	LabelStreet = "Ace Jones Dr",
	LabelDetail = "No. 1024"
	},
	["richman-acedr2"] = {
	coords = vector4(-1660.64, 408.56, 88.51, 95.30),
	LabelDistrict = "Richman",
	LabelStreet = "Ace Jones Dr",
	LabelDetail = "No. 1027"
	},
	["richman-vinewoodmansionback"] = {
	coords = vector4(-1796.68, 405.41, 112.79, 180.68),
	LabelDistrict = "Richman",
	LabelStreet = "Ace Jones Dr",
	LabelDetail = "Mansion, Back Entrance"
	},
	["richman-americano1"] = {
	coords = vector4(-1617.99, 60.38, 61.08, 331.51),
	LabelDistrict = "Richman",
	LabelStreet = "Americano Way",
	LabelDetail = "No. 1"
	},
	["richman-americano2"] = {
	coords = vector4(-1506.15, 45.62, 54.42, 9.29),
	LabelDistrict = "Richman",
	LabelStreet = "Americano Way",
	LabelDetail = "No. 2"
	},
	["richman-samdr1"] = {
	coords = vector4(-1474.49, -6.57, 53.95, 1.23),
	LabelDistrict = "Richman",
	LabelStreet = "Sam Austin Dr",
	LabelDetail = "No. 1"
	},
	["richman-samdr2"] = {
	coords = vector4(-1544.43, -33.23, 57.38, 280.34),
	LabelDistrict = "Richman",
	LabelStreet = "Sam Austin Dr",
	LabelDetail = "No. 2"
	},
	["richman-samdr3"] = {
	coords = vector4(-1533.14, -36.80, 56.93, 21.62),
	LabelDistrict = "Richman",
	LabelStreet = "Sam Austin Dr",
	LabelDetail = "No. 3"
	},
	["richman-grainoftruth"] = {
	coords = vector4(-1441.66, -102.57, 50.38, 30.56),
	LabelDistrict = "Richman",
	LabelStreet = "West Eclipse Blvd",
	LabelDetail = "The Grain of Truth"
	},
	["golfclub"] = {
	coords = vector4(-1366.81, 56.72, 53.52, 98.47),
	LabelDistrict = "GWC und Golfclub",
	LabelStreet = "West Eclipse Blvd",
	LabelDetail = "GWC & Golfing Society"
	},
	["richman-hotel1"] = {
	coords = vector4(-1284.15, 297.66, 64.46, 146.33),
	LabelDistrict = "GWC und Golfclub",
	LabelStreet = "West Eclipse Blvd",
	LabelDetail = "The Richman Hotel"
	},
	["richman-hotel2"] = {
	coords = vector4(-1317.72, 388.26, 69.09, 9.02),
	LabelDistrict = "GWC und Golfclub",
	LabelStreet = "Picture Perfect Drive",
	LabelDetail = "The Richman Hotel, Backside"
	},
	["richman-weclipseblvd1"] = {
	coords = vector4(-1105.18, 282.90, 63.63, 183.22),
	LabelDistrict = "GWC und Golfclub",
	LabelStreet = "West Eclipse Blvd",
	LabelDetail = "No. 1"
	},
	["richman-ppdrive1"] = {
	coords = vector4(-1130.52, 395.82, 70.26, 358.61),
	LabelDistrict = "GWC und Golfclub",
	LabelStreet = "Picture Perfect Drive",
	LabelDetail = "No. 1"
	},
	
-- == ROCKFORD HILLS == --

	["rockford-tenniscourts"] = {
	coords = vector4(-1329.98, -119.18, 48.68, 282.02),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Tennis Courts"
	},
	["rockford-voncrastenburg"] = {
	coords = vector4(-1227.35, -178.58, 38.69, 138.06),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Von Crastenburg Hotel, Lobby"
	},
	["rockford-voncrastenburg2"] = {
	coords = vector4(-1209.78, -133.29, 40.58, 332.36),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Von Crastenburg Hotel, Backside"
	},
	["rockford-lifeinvader"] = {
	coords = vector4(-1078.31, -263.47, 37.31, 207.43),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "South Boulevard Del Perro",
	LabelDetail = "Life Invader Building"
	},
	["rockford-archipelago"] = {
	coords = vector4(-1096.20, -320.98, 37.34, 356.66),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "South Boulevard Del Perro",
	LabelDetail = "The Archipelago Hotel"
	},
	["rockford-pdm"] = {
	coords = vector4(-1279.37, -355.32, 36.15, 68.27),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Morningwood Blvd",
	LabelDetail = "Premium Deluxe Motorsport"
	},
	["rockford-jonnytung"] = {
	coords = vector4(-936.61, -214.65, 37.55, 80.38),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Jonny Tung Gallery"
	},
	["rockford-maracas"] = {
	coords = vector4(-795.95, -132.72, 37.52, 22.12),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "South Boulevard Del Perro",
	LabelDetail = "Maracas"
	},
	["rockford-croqahoop"] = {
	coords = vector4(-725.04, -95.51, 37.59, 30.13),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "South Boulevard Del Perro",
	LabelDetail = "Croq-A-Hoop"
	},
	["rockford-library1"] = {
	coords = vector4(-582.05, -76.03, 41.45, 337.77),
	LabelDistrict = "Burton",
	LabelStreet = "South Boulevard Del Perro",
	LabelDetail = "City of LS Public Library, Back"
	},
	["rockford-lspd"] = {
	coords = vector4(-555.53, -141.23, 37.96, 202.53),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Eastbourne Way",
	LabelDetail = "Police Department"
	},
	["rockford-library2"] = {
	coords = vector4(-623.54, -165.50, 37.29, 151.08),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Rockford Dr",
	LabelDetail = "City of LS Public Library, Front"
	},
	["rockford-epsilon"] = {
	coords = vector4(-696.83, 43.83, 42.87, 221.14),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Rockford Dr",
	LabelDetail = "Epsilon Foundation HQ"
	},
	["rockford-church"] = {
	coords = vector4(-761.41, -33.88, 37.35, 210.35),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Boulevard Del Perro",
	LabelDetail = "Church"
	},
	["rockford-gateway"] = {
	coords = vector4(-853.91, -85.89, 37.35, 207.46),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Boulevard Del Perro",
	LabelDetail = "Gateway Sign"
	},
	["rockford-mwtdr1"] = {
	coords = vector4(-932.37, -11.21, 42.95, 125.68),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Mad Wayne Thunder Dr",
	LabelDetail = "No. 1"
	},
	["rockford-mwtdr2"] = {
	coords = vector4(-1054.22, 186.91, 59.64, 107.27),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Steele Way",
	LabelDetail = "No. 2"
	},
	["rockford-cottagepark"] = {
	coords = vector4(-951.74, 305.87, 70.40, 295.95),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dunstable Dr",
	LabelDetail = "Cottage Park"
	},
	["rockford-eclipsetowers"] = {
	coords = vector4(-772.78, 296.55, 85.24, 184.88),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "South Mo Milton Dr",
	LabelDetail = "Eclipse Towers"
	},
	["rockfort-smomiltondr1"] = {
	coords = vector4(-849.11, 303.48, 85.65, 309.62),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "South Mo Milton Dr",
	LabelDetail = "No. 1"
	},
	["rockford-ppdrive1"] = {
	coords = vector4(-987.34, 412.34, 74.04, 207.42),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Picture Perfect Drive",
	LabelDetail = "No. 4"
	},
	["rockford-mwtdr3"] = {
	coords = vector4(-1085.66, 339.77, 66.45, 270.12),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Mad Wayne Thunder Dr",
	LabelDetail = "No. 3"
	},
	["rockford-steeleway1"] = {
	coords = vector4(-1042.89, 205.18, 62.10, 209.48),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Steele Way",
	LabelDetail = "No. 1"
	},
	["rockford-steeleway3"] = {
	coords = vector4(-934.72, 121.76, 56.30, 44.66),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Steele Way",
	LabelDetail = " No. 3"
	},
	["rockfort-desantamanor"] = {
	coords = vector4(-855.05, 164.33, 65.81, 90.56),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Portola Dr",
	LabelDetail = "DeSanta Manor"
	},
	["rockford-portoladr1"] = {
	coords = vector4(-854.54, 100.82, 51.99, 96.92),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Portola Dr",
	LabelDetail = "No. 1"
	},
	["rockford-caesarsplace1"] = {
	coords = vector4(-903.56, 18.76, 45.77, 291.27),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Caesars Place",
	LabelDetail = "No. 1"
	},
	["rockford-portoladr2"] = {
	coords = vector4(-819.72, -27.03, 38.04, 305.43),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Portola Dr",
	LabelDetail = "No. 2"
	},
	["rockford-akanrecords"] = {
	coords = vector4(-1033.76, -257.41, 37.26, 25.82),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "South Boulevard Del Perro",
	LabelDetail = "Akan Records"
	},
	["rockford-kaytontower"] = {
	coords = vector4(-1041.64, -391.38, 37.33, 31.44),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Marathon Ave",
	LabelDetail = "Bank Tower"
	},
	["rockford-rmtower"] = {
	coords = vector4(-965.53, -396.50, 37.35, 116.26),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Movie Star Way",
	LabelDetail = "Richards Majestic Tower"
	},
	["rockford-weazelplaza1"] = {
	coords = vector4(-927.88, -461.15, 36.78, 117.79),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Movie Star Way",
	LabelDetail = "Weazel Plaza, Street"
	},
	["rockford-weazelplaza2"] = {
	coords = vector4(-870.95, -430.10, 36.16, 293.01),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Heritage Way",
	LabelDetail = "Weazel Plaza"
	},
	["rockford-leopolds"] = {
	coords = vector4(-688.41, -376.40, 33.74, 340.51),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Leopolds"
	},
	["rockford-didiersachs"] = {
	coords = vector4(-839.75, -366.47, 38.56, 204.97),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Heritage Way",
	LabelDetail = "Didiersachs"
	},
	["rockford-morsmutual"] = {
	coords = vector4(-842.34, -280.34, 38.84, 148.57),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Mors Mutual Insurance"
	},
	["rockford-chebs"] = {
	coords = vector4(-731.48, -327.38, 35.47, 161.84),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Chebs Eaterie"
	},
	["rockford-perseus"] = {
	coords = vector4(-656.03, -348.45, 34.16, 225.68),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Perseus"
	},
	["rockford-sessantanove"] = {
	coords = vector4(-695.59, -269.47, 35.95, 306.03),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Portola Dr",
	LabelDetail = "Sessanta Nove"
	},
	["rockford-portolaplaza"] = {
	coords = vector4(-676.25, -218.73, 36.62, 33.37),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Eastbourne Way",
	LabelDetail = "Little Portola Plaza"
	},
	["rockford-dorset"] = {
	coords = vector4(-569.27, -386.69, 34.55, 359.36),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Rockford Dorset"
	},
	["rockford-weazeldorset"] = {
	coords = vector4(-480.92, -390.76, 33.64, 356.19),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Weazel Dorset"
	},
	["rockford-hospital1"] = {
	coords = vector4(-449.69, -340.89, 34.02, 80.77),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Carcer Way",
	LabelDetail = "Mt Zonah Medical Center"
	},
	["rockford-hospital2"] = {
	coords = vector4(-496.55, -336.62, 34.02, 260.22),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Carcer Way",
	LabelDetail = "Mt Zonah Medical Center"
	},
	["rockford-hospital3"] = {
	coords = vector4(-396.42, -371.14, 31.55, 172.33),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Harper Unit, Psych Ward"
	},
	["rockford-pillpharm"] = {
	coords = vector4(-394.98, -401.66, 31.32, 358.64),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Pill-Pharm"
	},
	["rockford-augury"] = {
	coords = vector4(-290.36, -414.81, 29.60, 349.33),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Dorset Dr",
	LabelDetail = "Augury Insurance"
	},
	["rockford-plaza1"] = {
	coords = vector4(-255.73, -320.58, 29.55, 95.59),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "San Vitus Blvd",
	LabelDetail = "Rockford Plaza, South"
	},
	["rockford-pendulus"] = {
	coords = vector4(-553.51, -321.51, 34.68, 301.09),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Rockford Dr",
	LabelDetail = "Pendulus Clockworks"
	},
	["rockford-enema"] = {
	coords = vector4(-654.78, -146.98, 37.35, 296.91),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Rockford Dr",
	LabelDetail = "Enema"
	},
	["rockford-ponsonbys"] = {
	coords = vector4(-717.77, -165.81, 36.50, 123.34),
	LabelDistrict = "Rockford Hills",
	LabelStreet = "Portola Dr",
	LabelDetail = "Ponsonbys"
	},
	
-- == BURTON == --

	["burton-littleteapot"] = {
	coords = vector4(-525.54, -29.63, 44.03, 86.12),
	LabelDistrict = "Burton",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Little Teapot Cafe"
	},
	["burton-cokatoos"] = {
	coords = vector4(-427.54, -32.97, 45.74, 284.87),
	LabelDistrict = "Burton",
	LabelStreet = "Eastbourne Way",
	LabelDetail = "Cockatoos Night Club"
	},
	["burton-fleeca"] = {
	coords = vector4(-345.34, -32.55, 47.07, 353.40),
	LabelDistrict = "Burton",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Fleeca Bank"
	},
	["burton-eclipselodge"] = {
	coords = vector4(-283.60, -21.32, 48.62, 168.63),
	LabelDistrict = "Burton",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Ecplipse Lodge"
	},
	["burton-boutiquecall"] = {
	coords = vector4(-290.82, -107.15, 46.03, 257.48),
	LabelDistrict = "Burton",
	LabelStreet = "San Vitus Blvd",
	LabelDetail = "Boutique Call"
	},
	["burton-lscustoms"] = {
	coords = vector4(-361.74, -149.13, 37.76, 24.96),
	LabelDistrict = "Burton",
	LabelStreet = "Carcer Way",
	LabelDetail = "Los Santos Customs"
	},
	["burton-wenger"] = {
	coords = vector4(-297.64, -274.10, 30.98, 279.96),
	LabelDistrict = "Burton",
	LabelStreet = "San Vitus Blvd",
	LabelDetail = "Wenger Institute"
	},
	["burton-cityhall"] = {
	coords = vector4(-510.32, -258.26, 35.09, 199.77),
	LabelDistrict = "Burton",
	LabelStreet = "Carcer Way",
	LabelDetail = "City Hall"
	},
	["burton-chaps"] = {
	coords = vector4(-472.76, -98.03, 38.41, 165.13),
	LabelDistrict = "Burton",
	LabelStreet = "Eastbourne Way",
	LabelDetail = "Chaps"
	},
	["burton-lesbianco"] = {
	coords = vector4(-153.66, -99.03, 54.14, 344.74),
	LabelDistrict = "Burton",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Les Bianco"
	},
	["burton-yeti"] = {
	coords = vector4(-133.45, -73.93, 54.99, 164.31),
	LabelDistrict = "Burton",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Yeti"
	},
	["burton-plaza"] = {
	coords = vector4(-129.51, -246.27, 43.89, 255.62),
	LabelDistrict = "Burton",
	LabelStreet = "Las Lagunas Blvd",
	LabelDetail = "Rockford Plaza"
	},
	["burton-ponsonbys"] = {
	coords = vector4(-150.00, -306.27, 38.32, 251.17),
	LabelDistrict = "Burton",
	LabelStreet = "Las Lagunas Blvd",
	LabelDetail = "Ponsonbys"
	},
	["burton-dogpark"] = {
	coords = vector4(-149.97, -403.72, 33.24, 76.26),
	LabelDistrict = "Burton",
	LabelStreet = "Las Lagunas Blvd",
	LabelDetail = "Dog Park"
	},
	
-- == WEST VINEWOOD == --

	["westvinewood-sagma"] = {
	coords = vector4(-423.40, 15.74, 45.83, 180.91),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Hawick Ave",
	LabelDetail = "SAGMA"
	},
	["westvinewood-eclipselodgeapt"] = {
	coords = vector4(-273.19, 28.03, 54.27, 254.04),
	LabelDistrict = "Vinewood West",
	LabelStreet = "San Vitus Blvd",
	LabelDetail = "Eclipse Lodge Apartments"
	},
	["westvinewood-spanishave1042"] = {
	coords = vector4(-294.19, 116.37, 67.53, 359.67),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Spanish Ave",
	LabelDetail = "No. 1042"
	},
	["westvinewood-eclipsemedical"] = {
	coords = vector4(-675.12, 294.24, 81.49, 177.14),
	LabelDistrict = "Vinewood West",
	LabelStreet = "South Mo Milton Dr",
	LabelDetail = "Eclipse Medical Tower"
	},
	["westvinewood-fullmoon"] = {
	coords = vector4(-576.16, 271.31, 82.28, 179.72),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Full Moon Film Theater"
	},
	["westvinewood-tequilala"] = {
	coords = vector4(-557.04, 269.74, 82.53, 175.59),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Tequi-La-La"
	},
	["westvinewood-generic"] = {
	coords = vector4(-477.16, 220.34, 82.71, 353.39),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "The Generic Hotel"
	},
	["westvinewood-splitsides"] = {
	coords = vector4(-420.03, 254.24, 82.70, 176.53),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Split Sides Comedy Club"
	},
	["westvinewood-hornbills"] = {
	coords = vector4(-382.93, 227.61, 83.50, 358.22),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Hornbills Strip Club"
	},
	["westvinewood-lasttrain"] = {
	coords = vector4(-370.20, 253.42, 83.71, 185.98),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Last Train Diner"
	},
	["westvinewood-pegasus"] = {
	coords = vector4(-310.47, 222.78, 87.45, 9.29),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Pegasus Concierge"
	},
	["westvinewood-spitroasters"] = {
	coords = vector4(-246.15, 275.31, 91.51, 173.34),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Spitroasters Meat House"
	},
	["westvinewood-hardcore"] = {
	coords = vector4(-143.63, 241.04, 94.51, 6.26),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Eclipse Blvd",
	LabelDetail = "Hardcore Comic Store"
	},
	["westvinewood-gentrymanor"] = {
	coords = vector4(-84.05, 303.65, 106.50, 161.99),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Gentry Lane",
	LabelDetail = "Gentry Manor"
	},
	["westvinewood-museum"] = {
	coords = vector4(13.00, 171.93, 98.54, 74.90),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Las Lagunas Blvd",
	LabelDetail = "Vinewood Museum"
	},
	["westvinewood-elgin"] = {
	coords = vector4(-10.04, 166.25, 95.16, 244.85),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Las Lagunas Blvd",
	LabelDetail = "Elgin House"
	},
	["westvinewood-didiondr1"] = {
	coords = vector4(18.51, 372.40, 111.82, 142.07),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Didion Dr",
	LabelDetail = "No. 1"
	},
	["westvinewood-didiondr3564"] = {
	coords = vector4(-203.50, 411.69, 109.63, 16.54),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Didion Dr",
	LabelDetail = "No. 3564"
	},
	["westvinewood-didiondr3554"] = {
	coords = vector4(-403.19, 347.78, 107.85, 14.91),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Didion Dr",
	LabelDetail = "No. 3554"
	},
	["wesvinewood-coxway3565"] = {
	coords = vector4(-514.76, 427.85, 96.65, 141.46),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Cox Way",
	LabelDetail = "No. 3565"
	},
	["westvinewood-coxway3569"] = {
	coords = vector4(-383.14, 425.87, 109.64, 219.77),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Cox Way",
	LabelDetail = "No. 3569"
	},
	["westvinewood-miltondr2848"] = {
	coords = vector4(-603.19, 403.00, 100.65, 3.96),
	LabelDistrict = "Vinewood West",
	LabelStreet = "Milton Rd",
	LabelDetail = "No. 2848"
	},
	
-- == ALTA & HAWICK == --
	
	["alta-occupation1"] = {
	coords = vector4(90.72, -290.21, 46.00, 157.29),
	LabelDistrict = "Alta",
	LabelStreet = "Occupation Ave",
	LabelDetail = "No. 1"
	},
	["alta-cityhall"] = {
	coords = vector4(246.35, -376.70, 43.95, 344.39),
	LabelDistrict = "Alta",
	LabelStreet = "Occupation Ave",
	LabelDetail = "City Hall"
	},
	["alta-mexicanmarket"] = {
	coords = vector4(370.81, -386.44, 45.72, 178.49),
	LabelDistrict = "Alta",
	LabelStreet = "Elgin Ave",
	LabelDetail = "Mexican Market"
	},
	["alta-fleeca"] = {
	coords = vector4(311.13, -267.69, 53.45, 334.54),
	LabelDistrict = "Alta",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Fleeca Bank"
	},
	["alta-pinkcage"] = {
	coords = vector4(327.24, -205.96, 53.60, 163.84),
	LabelDistrict = "Alta",
	LabelStreet = "Meteor St",
	LabelDetail = "The Pink Cage Motel"
	},
	["alta-hawaiiansnow"] = {
	coords = vector4(247.26, -209.68, 53.42, 116.20),
	LabelDistrict = "Alta",
	LabelStreet = "Power St",
	LabelDetail = "Hawaiian Snow"
	},
	["alta-oevre"] = {
	coords = vector4(211.26, -196.97, 53.60, 161.30),
	LabelDistrict = "Hawick",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Oevre Gallery"
	},
	["alta-hippyfeet"] = {
	coords = vector4(147.03, -207.15, 53.86, 339.54),
	LabelDistrict = "Alta",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Hippy Feet"
	},
	["alta-echorock"] = {
	coords = vector4(90.98, -213.84, 54.01, 343.10),
	LabelDistrict = "Alta",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Echorock Plaza"
	},
	["hawick-suburban"] = {
	coords = vector4(129.72, -201.28, 54.02, 339.56),
	LabelDistrict = "Hawick",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Suburban"
	},
	["hawick-larss"] = {
	coords = vector4(127.46, -167.94, 54.15, 166.05),
	LabelDistrict = "Hawick",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Larss & Elbö"
	},
	["hawick-inkinc"] = {
	coords = vector4(39.74, -167.65, 54.84, 347.62),
	LabelDistrict = "Hawick",
	LabelStreet = "Hawick Ave",
	LabelDetail = "InkInc Tatoo Studio"
	},
	["hawick-mattress"] = {
	coords = vector4(6.31, -154.69, 55.74, 337.36),
	LabelDistrict = "Hawick",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Mattress of Fact"
	},
	["hawick-freybaker"] = {
	coords = vector4(49.09, -138.86, 54.76, 156.61),
	LabelDistrict = "Hawick",
	LabelStreet = "Hawick Ave",
	LabelDetail = "Frey Baker"
	},
	["hawick-badger"] = {
	coords = vector4(463.60, -136.54, 61.24, 163.97),
	LabelDistrict = "Hawick",
	LabelStreet = "Spanish Ave",
	LabelDetail = "Badger Tower"
	},
	["hawick-vinewoodgardens"] = {
	coords = vector4(324.35, -85.61, 68.50, 160.89),
	LabelDistrict = "Hawick",
	LabelStreet = "Spanish Ave",
	LabelDetail = "The Vinewood Gardens Hotel"
	},
	["hawick-vinewoodplaza"] = {
	coords = vector4(220.75, -51.54, 68.69, 157.67),
	LabelDistrict = "Hawick",
	LabelStreet = "Spanish Ave",
	LabelDetail = "Vinewood Plaza"
	},
	["hawick-pops"] = {
	coords = vector4(98.88, -7.25, 67.61, 158.16),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Spanish Ave",
	LabelDetail = "Pop's Pills"
	},
	
-- == DOWNTOWN VINEWOOD == --

	["vinewood-gopostal"] = {
	coords = vector4(62.05, 85.82, 77.95, 73.32),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Laguna Pl",
	LabelDetail = "GO Postal"
	},
	["vinewood-altast0707"] = {
	coords = vector4(170.51, 72.14, 82.61, 67.23),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Alta St",
	LabelDetail = "No. 0707"
	},
	["vinewood-altast0602"] = {
	coords = vector4(136.62, 36.86, 71.75, 260.92),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Alta St",
	LabelDetail = "No. 0602"
	},
	["vinewood-callistoapt"] = {
	coords = vector4(339.52, 49.63, 91.63, 61.84),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Power St",
	LabelDetail = "Callisto Apartments"
	},
	["vinewood-lspd"] = {
	coords = vector4(667.69, -6.36, 83.62, 242.35),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Elgin Ave",
	LabelDetail = "Police Department"
	},
	["vinewood-pizzathis"] = {
	coords = vector4(548.09, 86.71, 95.61, 162.89),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Pizza This Restaurant"
	},
	["vinewood-stargaze"] = {
	coords = vector4(412.25, 105.03, 100.51, 345.68),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Stargaze"
	},
		["vinewood-doppler"] = {
	coords = vector4(330.60, 166.00, 103.02, 160.57),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Doppler Cinema"
	},
	["vinewood-oriental"] = {
	coords = vector4(297.86, 177.65, 103.69, 159.94),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "The Oriental"
	},
	["vinewood-whirligig"] = {
	coords = vector4(301.25, 142.03, 103.40, 339.09),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Whirligig Theatre"
	},
	["vinewood-misst"] = {
	coords = vector4(220.39, 171.42, 104.92, 340.10),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Miss-T Clothing"
	},
	["vinewood-pacificstandard"] = {
	coords = vector4(231.16, 201.65, 104.92, 156.07),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Pacific Standard Bank"
	},
	["vinewood-blarneys"] = {
	coords = vector4(125.40, 206.81, 106.66, 340.54),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Blarney's World of Awesome"
	},
	["vinewood-waxhaven"] = {
	coords = vector4(113.83, 245.47, 107.35, 160.82),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Wax Haven"
	},
	["vinewood-wtf"] = {
	coords = vector4(56.87, 231.80, 108.91, 346.05),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Vinewood Blvd",
	LabelDetail = "Bishop's WTF?!"
	},
	["vinewood-upnatom"] = {
	coords = vector4(60.69, 297.42, 110.30, 66.46),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Clinton Ave",
	LabelDetail = "Up-n-Atom Burger"
	},
	["vinewood-pitchers"] = {
	coords = vector4(222.98, 346.71, 105.06, 347.80),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Clinton Ave",
	LabelDetail = "Pitchers Strip Club"
	},
	["vinewood-singletons"] = {
	coords = vector4(228.75, 306.49, 105.05, 255.73),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Alta St",
	LabelDetail = "Singleton's Bar"
	},
	["vinewood-butch"] = {
	coords = vector4(326.68, 330.13, 104.83, 169.75),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Clinton Ave",
	LabelDetail = "Butch Male Fitness"
	},
	["vinewood-247"] = {
	coords = vector4(374.09, 318.71, 102.97, 161.60),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Clinton Ave",
	LabelDetail = "24/7"
	},
	["vonewood-voncrastenburg"] = {
	coords = vector4(436.30, 217.54, 102.69, 343.66),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "Power St",
	LabelDetail = "Von Crastenburg Hotel"
	},
	["vinewood-cnt"] = {
	coords = vector4(732.85, 196.26, 85.21, 161.13),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Clinton Ave",
	LabelDetail = "CNT TV Studio"
	},
	["vinewood-substation"] = {
	coords = vector4(747.15, 111.90, 78.64, 245.06),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Elgin Ave",
	LabelDetail = "Substation"
	},
	
-- == VINEWOOD HILLS == --

	["vhills-bowl"] = {
	coords = vector4(812.64, 559.64, 125.43, 313.49),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Fenwell Pl",
	LabelDetail = "Vinewood Bowl"
	},
	["vhills-nconkerave2045"] = {
	coords = vector4(371.32, 433.76, 143.98, 352.20),
	LabelDistrict = "Vinewood Mitte",
	LabelStreet = "North Conker Ave",
	LabelDetail = "No. 2045"
	},
	["vhills-wildoatsdr3667"] = {
	coords = vector4(172.44, 488.02, 142.22, 358.56),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Wild Oats Dr",
	LabelDetail = "No. 3667"
	},
	["vhills-wildoatsdr3661"] = {
	coords = vector4(-0.47, 469.41, 145.33, 330.70),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Wild Oats Dr",
	LabelDetail = "No. 3661"
	},
	["vhills-wildoatsdr3655"] = {
	coords = vector4(-186.83, 501.80, 134.21, 13.38),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Wild Oats Dr",
	LabelDetail = "No. 3655"
	},
	["vhills-whispymound3671"] = {
	coords = vector4(9.79, 549.12, 175.35, 39.39),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Whispymound Dr",
	LabelDetail = "Nr. 3671"
	},
	["vhills-lakevdr1"] = {
	coords = vector4(202.47, 779.70, 205.39, 22.19),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Lake Vinewood Dr",
	LabelDetail = "No. 1342"
	},
	["vhills-lakevlookout"] = {
	coords = vector4(-272.70, 725.53, 207.05, 310.57),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Lake Vinewood Dr",
	LabelDetail = "Lake Vinewood Lookout"
	},
	["vhills-lakevestates"] = {
	coords = vector4(-80.56, 905.70, 235.23, 126.39),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Lake Vinewood Est",
	LabelDetail = "Lake Vinewood Estates"
	},
	["galileo-vinewoodsign"] = {
	coords = vector4(854.33, 1277.65, 358.89, 46.64),
	LabelDistrict = "Galileo-Park",
	LabelStreet = "Mt Haan Dr",
	LabelDetail = "Vinewood Sign"
	},
	["vhills-lafuente"] = {
	coords = vector4(1374.86, 1146.98, 113.42, 90.05),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Senora Rd",
	LabelDetail = "La Fuente Blanca"
	},
	["vhills-sisyphus"] = {
	coords = vector4(226.82, 1171.38, 225.02, 287.06),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Baytree Canyon Rd",
	LabelDetail = "Sisyphus Theater"
	},
	["vhills-kimbledr1"] = {
	coords = vector4(-275.03, 605.52, 181.17, 350.71),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Kimble Hill Dr",
	LabelDetail = "No. 3542"
	},
	["vhills-miltonrd1"] = {
	coords = vector4(-482.77, 744.03, 163.44, 240.56),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Milton Rd",
	LabelDetail = "No. 1023"
	},
	["vhills-normandydr1"] = {
	coords = vector4(-747.04, 816.86, 212.90, 292.39),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Normandy Dr",
	LabelDetail = "No. 2571"
	},
	["vhills-normandydr2"] = {
	coords = vector4(-586.11, 751.04, 183.50, 250.26),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Normandy Dr",
	LabelDetail = "No. 2544"
	},
	["vhills-hillcrest1"] = {
	coords = vector4(-760.43, 666.07, 142.96, 294.91),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Hillcrest Ave",
	LabelDetail = "No. 2670"
	},
	["vhills-hillcrest2"] = {
	coords = vector4(-1019.79, 701.18, 161.65, 331.19),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Hillcrest Ave",
	LabelDetail = "No. 2599"
	},
	["vhills-nsheldonave1"] = {
	coords = vector4(-1015.82, 799.33, 170.38, 200.91),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "North Sheldon Ave",
	LabelDetail = "No. 3452"
	},
	["vhills-nsheldonave2"] = {
	coords = vector4(-903.32, 786.23, 185.40, 1.75),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "North Sheldon Ave",
	LabelDetail = "No. 3652"
	},
	["vhills-nsheldondr3"] = {
	coords = vector4(-1242.00, 663.26, 141.87, 216.86),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "North Sheldon Ave",
	LabelDetail = "No. 1108"
	},
	["vhills-smomildondr1"] = {
	coords = vector4(-1154.61, 560.23, 100.96, 189.20),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "South Mo Milton Dr",
	LabelDetail = "No. 1243"
	},
	["vhills-ppdrive1"] = {
	coords = vector4(-683.91, 495.93, 109.39, 200.98),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Picture Perfect Drive",
	LabelDetail = "No. 4532"
	},
	["galileo-observatory"] = {
	coords = vector4(-412.29, 1171.63, 325.33, 346.66),
	LabelDistrict = "Galileo-Observatorium",
	LabelStreet = "East Galileo Ave",
	LabelDetail = "Galileo Observatory"
	},
	["vhills-parsons"] = {
	coords = vector4(-1469.45, 880.95, 182.72, 283.69),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Marlowe Dr",
	LabelDetail = "Parsons Rehab Center"
	},
	
-- == CHUMASH, ZANCUDO & SURROUNDING AREA == --

	["banham-retreat"] = {
	coords = vector4(-2711.57, 1501.81, 105.94, 237.88),
	LabelDistrict = "Banham Canyon",
	LabelStreet = "Banham Canyon Dr",
	LabelDetail = "Retreat"
	},
	["banham-inseno1"] = {
	coords = vector4(-3098.89, 285.55, 8.63, 253.55),
	LabelDistrict = "Banham Canyon",
	LabelStreet = "Ineseno Road",
	LabelDetail = "No. 243"
	},
	["banham-inseno2"] = {
	coords = vector4(-3069.99, 393.34, 6.39, 254.72),
	LabelDistrict = "Banham Canyon",
	LabelStreet = "Ineseno Road",
	LabelDetail = "No. 238"
	},
	["banham-momspie"] = {
	coords = vector4(-3042.82, 615.23, 7.07, 292.17),
	LabelDistrict = "Banham Canyon",
	LabelStreet = "Ineseno Road",
	LabelDetail = "Mom's Pie Diner"
	},
	["banham-fleeca"] = {
	coords = vector4(-2971.83, 478.33, 14.93, 90.60),
	LabelDistrict = "Banham Canyon",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Fleeca Bank"
	},
	["chumash-plaza"] = {
	coords = vector4(-3152.51, 1055.69, 20.35, 334.72),
	LabelDistrict = "Chumash",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Chumash Plaza"
	},
	["bluffs-countryclub"] = {
	coords = vector4(-3021.28, 84.12, 11.19, 323.89),
	LabelDistrict = "Pacific Bluffs",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Country Club"
	},
	["chumash-familypier"] = {
	coords = vector4(-3235.67, 965.09, 12.58, 279.13),
	LabelDistrict = "Chumash",
	LabelStreet = "Barbareno Rd",
	LabelDetail = "Historic Family Pier"
	},
	["chumash-barbareno1"] = {
	coords = vector4(-3191.92, 1176.24, 8.89, 262.39),
	LabelDistrict = "Chumash",
	LabelStreet = "Barbareno Rd",
	LabelDetail = "Nr. 32"
	},
	["tongva-westonmansion"] = {
	coords = vector4(-2551.25, 1911.29, 168.57, 246.57),
	LabelDistrict = "Tongva Hills",
	LabelStreet = "Buen Vino Rd",
	LabelDetail = "Devin Weston Mansion"
	},
	["tongva-vinery"] = {
	coords = vector4(-1888.78, 2049.15, 140.50, 155.26),
	LabelDistrict = "Tongva Hills",
	LabelStreet = "Buen Vino Rd",
	LabelDetail = "Marlowe Vineyard"
	},
	["zancudo-rons"] = {
	coords = vector4(-2544.23, 2318.81, 32.73, 10.10),
	LabelDistrict = "Lago Zancudo",
	LabelStreet = "Route 68",
	LabelDetail = "Ron Gas Station"
	},
	["nchumash-fortzancudofruits"] = {
	coords = vector4(-2498.42, 3627.07, 13.53, 249.92),
	LabelDistrict = "North Chumash",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Fort Zancudo Fruit Stand"
	},
	["nchumash-hookies"] = {
	coords = vector4(-2198.42, 4271.17, 48.04, 143.89),
	LabelDistrict = "North Chumash",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Hookie's Diner"
	},
	["zancudo-memorial"] = {
	coords = vector4(-1280.81, 2543.78, 17.81, 179.73),
	LabelDistrict = "Great Chaparral",
	LabelStreet = "Fort Zancudo Approach Rd",
	LabelDetail = "Fort Zancudo, War Memorials"
	},
	["tongva-whitewater"] = {
	coords = vector4(-1504.81, 1495.82, 115.18, 230.68),
	LabelDistrict = "Tongva Valley",
	LabelStreet = "Tongva Dr",
	LabelDetail = "White Water Activity Center"
	},
	["tongva-twohoots"] = {
	coords = vector4(-1585.60, 2094.64, 68.88, 310.67),
	LabelDistrict = "Tongva Hills",
	LabelStreet = "Zancudo Rd",
	LabelDetail = "Two Hoots Falls"
	},
	["chaparral-ammunation"] = {
	coords = vector4(-1109.00, 2686.09, 18.32, 220.29),
	LabelDistrict = "Great Chaparral",
	LabelStreet = "Route 68",
	LabelDetail = "AmmuNation"
	},
	["chaparral-church"] = {
	coords = vector4(-325.75, 2748.43, 66.52, 236.33),
	LabelDistrict = "Great Chaparral",
	LabelStreet = "Zancudo Grande Valley",
	LabelDetail = "Church"
	},
	["chaparral-farm1"] = {
	coords = vector4(-282.66, 2556.41, 73.22, 128.33),
	LabelDistrict = "Great Chaparral",
	LabelStreet = "Zancudo Grande Valley",
	LabelDetail = "Farm"
	},
	["chaparral-barn1"] = {
	coords = vector4(-95.75, 2810.56, 52.82, 250.70),
	LabelDistrict = "Great Chaparral",
	LabelStreet = "Route 68",
	LabelDetail = "Barn"
	},
	["chaparral-farm2"] = {
	coords = vector4(-262.35, 2170.97, 131.02, 266.79),
	LabelDistrict = "Great Chaparral",
	LabelStreet = "Baytree Canyon Rd",
	LabelDetail = "Farmhouse"
	},
	["chaparral-porkwhistle"] = {
	coords = vector4(-123.97, 1933.94, 195.53, 98.20),
	LabelDistrict = "Great Chaparral",
	LabelStreet = "Baytree Canyon Rd",
	LabelDetail = "Pork Whistle Farm"
	},
	["nchumash-beach"] = {
	coords = vector4(-2414.70, 4235.39, 9.37, 217.59),
	LabelDistrict = "North Chumash",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Beach"
	},
	
-- == PALETO & CHILLIAD + SURROUNDINGS == --

	["palcove-pier"] = {
	coords = vector4(-1582.16, 5168.45, 19.09, 198.87),
	LabelDistrict = "Paleto Cove",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Paleto Cove Pier"
	},
	["chiliad-rangersoffice"] = {
	coords = vector4(-1492.66, 4974.46, 63.29, 82.93),
	LabelDistrict = "Chiliad-Mountain-Naturschutzgebiet",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Raton Canyon, Rangers Office"
	},
	["chiliad-altruists"] = {
	coords = vector4(-1037.14, 4922.26, 205.41, 228.57),
	LabelDistrict = "Chiliad-Mountain-Naturschutzgebiet",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Altruists Camp"
	},
	["paleto-sawmill"] = {
	coords = vector4(-566.83, 5379.53, 69.68, 276.67),
	LabelDistrict = "Paleto Forest",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Sawmill"
	},
	["paleto-palasprings"] = {
	coords = vector4(-767.40, 5583.44, 33.12, 102.51),
	LabelDistrict = "Paleto Forest",
	LabelStreet = "Procopio Promenade",
	LabelDetail = "Pala Springs Aerial Tramway"
	},
	["paleto-bayviewlodge1"] = {
	coords = vector4(-687.86, 5839.02, 16.58, 73.03),
	LabelDistrict = "Paleto Forest",
	LabelStreet = "Procopio Promenade",
	LabelDetail = "Bayview Lodge Store"
	},
	["paleto-bayviewlodge2"] = {
	coords = vector4(-710.75, 5788.09, 16.98, 155.13),
	LabelDistrict = "Paleto Forest",
	LabelStreet = "Procopio Promenade",
	LabelDetail = "Bayview Lodge Diner"
	},
	["paleto-pier"] = {
	coords = vector4(-208.26, 6559.59, 10.49, 222.06),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Procopio Promenade",
	LabelDetail = "Old Pier"
	},
	["paleto-sheriff"] = {
	coords = vector4(-425.67, 6027.81, 31.01, 296.46),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "Sherriffs Office"
	},
	["paleto-ammunation"] = {
	coords = vector4(-319.07, 6071.92, 30.86, 226.23),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "AmmuNation"
	},
	["paleto-pixelpetes"] = {
	coords = vector4(-248.60, 6212.56, 31.45, 135.78),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Duluoz Ave",
	LabelDetail = "Pixel-Pete's Arcade"
	},
	["paleto-cluckingreception"] = {
	coords = vector4(-151.06, 6207.40, 30.87, 52.04),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Clucking Bell Farms, Reception"
	},
	["paleto-dreamview"] = {
	coords = vector4(-97.51, 6334.58, 31.01, 305.41),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Pyrite Ave",
	LabelDetail = "Dream View Motel"
	},
	["paleto-cluckingloading"] = {
	coords = vector4(-30.00, 6304.07, 30.89, 121.96),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Clucking Bell Farms, Loading Bay"
	},
	["paleto-wilson"] = {
	coords = vector4(6.27, 6424.78, 30.93, 316.43),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Wilson Hatcheries"
	},
	["paleto-truckstop"] = {
	coords = vector4(124.92, 6628.51, 31.42, 222.34),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "Truck Stop"
	},
	["paleto-willies"] = {
	coords = vector4(-53.99, 6524.90, 31.01, 313.29),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "Willie's"
	},
	["paleto-bank"] = {
	coords = vector4(-115.85, 6457.46, 30.98, 140.17),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "Blaine County Savings Bank"
	},
	["paleto-southseas"] = {
	coords = vector4(-181.11, 6433.65, 31.43, 14.93),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Procopio Dr",
	LabelDetail = "South Seas Apartments"
	},
	["paleto-mojitoinn"] = {
	coords = vector4(-127.27, 6394.78, 30.98, 48.77),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "Mojito Inn"
	},
	["paleto-henhouse"] = {
	coords = vector4(-293.79, 6253.08, 30.96, 228.08),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "The Hen House, Night Club"
	},
	["paleto-church"] = {
	coords = vector4(-339.42, 6162.19, 31.00, 127.74),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "St. Brigid Baptist Church"
	},
	["paleto-fd"] = {
	coords = vector4(-390.60, 6130.07, 31.00, 44.82),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Paleto Blvd",
	LabelDetail = "Fire Department"
	},
	["paleto-donkeypunch"] = {
	coords = vector4(419.91, 6539.82, 27.23, 251.32),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Donkey Punch Family Farm"
	},
	["procopio-beach"] = {
	coords = vector4(1411.44, 6584.47, 13.07, 351.75),
	LabelDistrict = "Procopio Beach",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Lookout"
	},
	["paleto-parcourse"] = {
	coords = vector4(284.45, 6786.85, 15.22, 271.51),
	LabelDistrict = "Paleto Bay",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Parcourse"
	},
	["anarchists"] = {
	coords = vector4(1471.94, 6366.62, 23.19, 266.76),
	LabelDistrict = "Mount Chiliad",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Anarchists Camp"
	},
	["chiliad-upnatom"] = {
	coords = vector4(1585.38, 6449.40, 24.71, 152.28),
	LabelDistrict = "Mount Chiliad",
	LabelStreet = "Great Ocean Hwy",
	LabelDetail = "Up-n-Atom Diner"
	},
	["chiliad-gasstation"] = {
	coords = vector4(1739.32, 6402.72, 34.63, 157.46),
	LabelDistrict = "Mount Chiliad",
	LabelStreet = "Senora Fwy",
	LabelDetail = "Gas Station & 24/7"
	},
	
-- == EAST COAST == --

	["gordo-lighthouse"] = {
	coords = vector4(3328.06, 5144.31, 17.90, 38.60),
	LabelDistrict = "Mount Gordo",
	LabelStreet = "Catfish View",
	LabelDetail = "El Gordo Lighthouse"
	},
	["catfishview"] = {
	coords = vector4(3825.76, 4457.15, 2.64, 61.68),
	LabelDistrict = "San-Chianski-Bergkette",
	LabelStreet = "Catfish View",
	LabelDetail = "Catfish View"
	},
	["chianski-railyard"] = {
	coords = vector4(2932.81, 4594.24, 48.69, 235.97),
	LabelDistrict = "San-Chianski-Bergkette",
	LabelStreet = "Union Rd",
	LabelDetail = "Railyard"
	},
	["chianski-silos"] = {
	coords = vector4(2906.48, 4420.57, 48.02, 287.76),
	LabelDistrict = "San-Chianski-Bergkette",
	LabelStreet = "Chianski Passage",
	LabelDetail = "H.J. Silos"
	},
	["humanelabs"] = {
	coords = vector4(3407.81, 3759.68, 30.07, 226.13),
	LabelDistrict = "Humane Labs and Research",
	LabelStreet = "Chianski Passage",
	LabelDetail = "Humane Labs and Research"
	},
	["chianski-youtool"] = {
	coords = vector4(2754.71, 3470.13, 55.26, 247.18),
	LabelDistrict = "San-Chianski-Bergkette",
	LabelStreet = "Senora Fwy",
	LabelDetail = "YouTool Hardware Store"
	},
	["davisquartz"] = {
	coords = vector4(2565.77, 2675.74, 39.52, 105.61),
	LabelDistrict = "Davis Quartz",
	LabelStreet = "Senora Way",
	LabelDetail = "Davis Quartz Quarry"
	},
	["windpark-rexs"] = {
	coords = vector4(2555.83, 2614.25, 37.48, 12.46),
	LabelDistrict = "Ron-Alternates-Windpark",
	LabelStreet = "Senora Way",
	LabelDetail = "Rex's Diner"
	},
	["windpark-trailerpark"] = {
	coords = vector4(2394.06, 2528.36, 46.20, 159.93),
	LabelDistrict = "Ron-Alternates-Windpark",
	LabelStreet = "Senora Way",
	LabelDetail = "Trailer Park"
	},
	["windpark-windpark"] = {
	coords = vector4(2496.40, 1589.55, 32.24, 277.34),
	LabelDistrict = "Ron-Alternates-Windpark",
	LabelStreet = "Senora Way",
	LabelDetail = "Ron Alternates Windpark"
	},
	["palmertaylorpower"] = {
	coords = vector4(2683.25, 1616.61, 24.05, 271.19),
	LabelDistrict = "Palmer-Taylor-Power-Station",
	LabelStreet = "Senora Way",
	LabelDetail = "Palmer Taylor Power Station"
	},
	["palomino-truckstop"] = {
	coords = vector4(2561.54, 374.59, 108.14, 266.69),
	LabelDistrict = "Tataviam-Mountainrange",
	LabelStreet = "Palomino Fwy",
	LabelDetail = "Palomino Point, Truck Stop"
	},
	["noose"] = {
	coords = vector4(2544.11, -305.56, 92.51, 1.87),
	LabelDistrict = "N.O.O.S.E",
	LabelStreet = "Sustancia Rd",
	LabelDetail = "National Office of Security Enforcement"
	},
	["palomino-beach"] = {
	coords = vector4(2768.91, -718.04, 7.00, 349.91),
	LabelDistrict = "Palomino-Highland",
	LabelStreet = "Sustancia Rd",
	LabelDetail = "Beach"
	},
	["landactdam"] = {
	coords = vector4(1667.73, -66.73, 173.20, 259.96),
	LabelDistrict = "Land-Act-Dam",
	LabelStreet = "Mirror Park Blvd",
	LabelDetail = "Land-Act Dam"
	},
	["landact-pumpingstation"] = {
	coords = vector4(1532.16, 790.12, 76.97, 145.79),
	LabelDistrict = "Vinewood Hills",
	LabelStreet = "Los Santos Freeway",
	LabelDetail = "Pumping Station"
	},
	
-- == SANDY SHORES, GRAPESEED, GRAND SENORA DESERT AND SURROUNDINGS == --

	["desert-barn1"] = {
	coords = vector4(1511.53, 1727.46, 109.41, 90.70),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Los Santos Freeway",
	LabelDetail = "Barn"
	},
	["brownfarm"] = {
	coords = vector4(1526.59, 2219.34, 76.48, 100.75),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Senora Fwy",
	LabelDetail = "Brown Farm"
	},
	["desert-scw"] = {
	coords = vector4(1196.12, 1840.38, 78.19, 64.78),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Senora Rd",
	LabelDetail = "Stoner Cement Works"
	},
	["desert-farm1"] = {
	coords = vector4(869.84, 2179.97, 51.80, 327.38),
	LabelDistrict = "Redwood-Lights-Rennstrecke",
	LabelStreet = "Senora Rd",
	LabelDetail = "Farm"
	},
	["redwoodlights"] = {
	coords = vector4(885.59, 2382.90, 50.86, 262.58),
	LabelDistrict = "Redwood-Lights-Racetrack",
	LabelStreet = "Senora Rd",
	LabelDetail = "Redwood-Lights Racetrack"
	},
	["rebelradio"] = {
	coords = vector4(738.26, 2523.66, 72.71, 270.31),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Route 68",
	LabelDetail = "Rebel Radio Station"
	},
	["desert-farm2"] = {
	coords = vector4(168.42, 2240.28, 90.37, 326.45),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Baytree Canyon Rd",
	LabelDetail = "Farm"
	},
	["harmony-easternmotel"] = {
	coords = vector4(321.64, 2622.79, 44.00, 305.75),
	LabelDistrict = "Harmony",
	LabelStreet = "Route 68",
	LabelDetail = "Eastern Motel"
	},
	["harmony-animalark"] = {
	coords = vector4(562.79, 2736.68, 41.57, 191.02),
	LabelDistrict = "Harmony",
	LabelStreet = "Route 68",
	LabelDetail = "Animal Ark Pet Store"
	},
	["desert-mototrmotel"] = {
	coords = vector4(1141.45, 2663.41, 37.68, 88.34),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Route 68",
	LabelDetail = "The Motor Motel"
	},
	["destert-lscustoms"] = {
	coords = vector4(1212.33, 2671.80, 37.22, 17.68),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Route 68",
	LabelDetail = "Los Santos Customs"
	},
	["desert-larrys"] = {
	coords = vector4(1232.64, 2724.36, 37.52, 179.88),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Route 68",
	LabelDetail = "Larry's Used Vehicles"
	},
	["bolingbroke"] = {
	coords = vector4(1854.96, 2594.23, 45.18, 277.37),
	LabelDistrict = "Bolingbroke-Penitentiary",
	LabelStreet = "Route 68",
	LabelDetail = "Bolingbroke Penitentiary"
	},
	["desert-satrelais"] = {
	coords = vector4(2042.71, 2938.68, 47.28, 217.73),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Route 68",
	LabelDetail = "Satellite Relay Station"
	},
	["desert-recycling"] = {
	coords = vector4(2337.18, 3141.18, 47.71, 88.29),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Cat-Claw Ave",
	LabelDetail = "Recycling Center"
	},
	["desert-nationalparking"] = {
	coords = vector4(2050.26, 3445.73, 43.31, 345.02),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Nowhere Rd",
	LabelDetail = "Senora Desert National Park"
	},
	["sandy-airfield"] = {
	coords = vector4(1748.23, 3294.15, 40.62, 213.41),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Panorama Dr",
	LabelDetail = "Airfield"
	},
	["desert-scw2"] = {
	coords = vector4(254.50, 2841.53, 43.14, 101.83),
	LabelDistrict = "Grand-Senora-Wüste",
	LabelStreet = "Joshua Rd",
	LabelDetail = "Stoner Cement Works"
	},
	["stabcity"] = {
	coords = vector4(86.30, 3622.41, 39.34, 93.69),
	LabelDistrict = "Stab City",
	LabelStreet = "Calafia Rd",
	LabelDetail = "Stab City"
	},
	["desert-liquor"] = {
	coords = vector4(911.82, 3640.76, 31.93, 185.30),
	LabelDistrict = "Alamosee",
	LabelStreet = "Marina Dr",
	LabelDetail = "Liquor Market"
	},
	["sandy-boathouse"] = {
	coords = vector4(1534.70, 3774.53, 34.02, 214.90),
	LabelDistrict = "Sandy Shores",
	LabelStreet = "Marina Dr",
	LabelDetail = "The Boat House"
	},
	["sandy-ammunation"] = {
	coords = vector4(1697.58, 3744.77, 33.53, 225.29),
	LabelDistrict = "Sandy Shores",
	LabelStreet = "Algonquin Blvd",
	LabelDetail = "AmmuNation"
	},
	["sandy-motel"] = {
	coords = vector4(1493.92, 3575.74, 34.78, 25.06),
	LabelDistrict = "Sandy Shores",
	LabelStreet = "Algonquin Blvd",
	LabelDetail = "Derelict Motel"
	},
	["sandy-fd"] = {
	coords = vector4(1703.36, 3584.82, 35.00, 213.50),
	LabelDistrict = "Sandy Shores",
	LabelStreet = "Alhambra Dr",
	LabelDetail = "Fire Department"
	},
	["sandy-hospital"] = {
	coords = vector4(1842.37, 3669.62, 33.20, 206.86),
	LabelDistrict = "Sandy Shores",
	LabelStreet = "Alhambra Dr",
	LabelDetail = "Medical Center"
	},
	["sandy-247"] = {
	coords = vector4(1974.29, 3741.96, 31.72, 219.51),
	LabelDistrict = "Sandy Shores",
	LabelStreet = "Alhambra Dr",
	LabelDetail = "24/7"
	},
	["sandy-aliens"] = {
	coords = vector4(2459.19, 3805.81, 39.58, 44.27),
	LabelDistrict = "Sandy Shores",
	LabelStreet = "East Joshua Road",
	LabelDetail = "Alien Community"
	},
	["maudes"] = {
	coords = vector4(2716.42, 4145.74, 43.24, 86.76),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Senora Fwy",
	LabelDetail = "Maude's Lair"
	},
	["grapeseed-farm1"] = {
	coords = vector4(2554.95, 4690.83, 33.31, 123.31),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Grapeseed Ave",
	LabelDetail = "Farm"
	},
	["grapeseed-oneils"] = {
	coords = vector4(2451.97, 4954.21, 44.45, 209.14),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Union Rd",
	LabelDetail = "O'Neil's Ranch"
	},
	["grapeseed-airfield"] = {
	coords = vector4(2147.82, 4799.60, 40.58, 22.08),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Joad Ln",
	LabelDetail = "McKenzie Airfield"
	},
	["grapeseed-lostfarm"] = {
	coords = vector4(1960.71, 4634.58, 40.27, 30.14),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Seaview Rd",
	LabelDetail = "The Lost Outpost"
	},
	["grapeseed-fruitmarket"] = {
	coords = vector4(1780.95, 4581.97, 37.02, 175.94),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Seaview Rd",
	LabelDetail = "Alamo Fruit Market"
	},
	["grapeseed-arcade"] = {
	coords = vector4(1690.06, 4785.08, 41.43, 91.21),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Grapeseed Ave",
	LabelDetail = "Wonderama Arcade"
	},
	["grapeseed-farmersmarket"] = {
	coords = vector4(1673.03, 4887.41, 41.52, 87.94),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Grapeseed Main St",
	LabelDetail = "Farmers Market"
	},
	["grapeseed-barn1"] = {
	coords = vector4(1962.42, 5167.04, 47.02, 182.63),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Grapeseed Main St",
	LabelDetail = "Barn"
	},
	["grapeseed-luckyjims"] = {
	coords = vector4(2239.07, 5148.71, 55.89, 138.05),
	LabelDistrict = "Grapeseed",
	LabelStreet = "Union Rd",
	LabelDetail = "Lucky Jim's Ranch"
	},
	["thefarm"] = {
	coords = vector4(2203.49, 5605.02, 53.26, 264.42),
	LabelDistrict = "Mount Chiliad",
	LabelStreet = "Senora Fwy",
	LabelDetail = "The Farm"
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