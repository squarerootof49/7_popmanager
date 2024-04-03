--[[
  ____                       _                              
 / ___|  _____   _____ _ __ ( )___                          
 \___ \ / _ \ \ / / _ \ '_ \|// __|                         
  ___) |  __/\ V /  __/ | | | \__ \                         
 |____/ \___| \_/ \___|_| |_| |___/                         
  ____             __  __                                   
 |  _ \ ___  _ __ |  \/  | __ _ _ __   __ _  __ _  ___ _ __ 
 | |_) / _ \| '_ \| |\/| |/ _` | '_ \ / _` |/ _` |/ _ \ '__|
 |  __/ (_) | |_) | |  | | (_| | | | | (_| | (_| |  __/ |   
 |_|   \___/| .__/|_|  |_|\__,_|_| |_|\__,_|\__, |\___|_|   
            |_|                             |___/                 
--]]

Config = {}

Config.debug                 = true                  --Prints some stuff for debug purposes.

-- NPC configuration
Config.pedDensity            = 1.0                   --Density of NPC. 1.0 = standard density, 0.5 = half, 2.0 = double, etc.
Config.vehDensity            = 1.0                   --Density of ROAMING vehicles. 1.0 = standard density, 0.5 = half, 2.0 = double, etc.
Config.disableCops           = true                  --Disable NPC cops?
Config.loopedRemoval         = false                 --By default, the script prevents Config.disabledVehicles and Config.disabledPeds from spawning naturally. If this is set to true, it will also check every Config.loopTime and remove the vehicles and the peds.
Config.loopTime              = 1250                  --Time in ms to run the looped natives. 1250ms is default.

-- Dispatch configuration
Config.disableDispatch       = true                  --Disable native GTAV NPC dispatch?
Config.disableWantedLevel    = true                  --Disable native GTAV wanted level?

-- Audio configuration
Config.disablePoliceScan    = true                   --Disable native GTAV police radio sound when in police vehicles?
Config.disableAmmunation    = true                   --Disable native GTAV ammunation ambient sound?
Config.disableVanilla       = true                   --Disable native GTAV vanilla unicorn ambient sound?

-- Model configuration
-- WARNING: if any of your resources spawn/use any of these vehicles, remove said vehicles from the list IF Config.loopedRemoval is set to true.
Config.disabledVehicles = {                             -- List of vehicles blacklisted from spawning.
    "ambulance",
    "firetruk",
    "polmav",
    "police",
    "police2",
    "police3",
    "police4",
    "fbi",
    "fbi2",
    "policet",
    "policeb",
    "riot",
    "apc",
    "barracks",
    "barracks2",
    "barracks3",
    "rhino",
    "hydra",
    "lazer",
    "valkyrie",
    "valkyrie2",
    "savage",
    "trailersmall2",
    "barrage",
    "chernobog",
    "khanjali",
    "menacer",
    "scarab",
    "scarab2",
    "scarab3",
    "armytanker",
    "avenger",
    "avenger2",
    "tula",
    "bombushka",
    "molotok",
    "volatol",
    "starling",
    "mogul",
    "nokota",
    "strikeforce",
    "rogue",
    "cargoplane",
    "jet",
    "buzzard",
    "besra",
    "titan",
    "cargobob",
    "cargobob2",
    "cargobob3",
    "cargobob4",
    "akula",
    "hunt",
}

--WARNING: if any of your resources spawn/use any of these peds, remove said peds from the list IF config.loopedRemoval is set to true.
Config.disabledPeds = {                             -- List of peds blacklisted from spawning. WARNING: if any of your resources spawn/use any of these peds, remove said peds from the list.
    "s_m_m_paramedic_01",
    "s_m_m_paramedic_02",
    "s_m_y_fireman_01",
    "s_m_y_pilot_01",
    "s_m_y_cop_01",
    "s_m_y_cop_02",
    "s_m_y_swat_01",
    "s_m_y_hwaycop_01",
    "s_m_y_marine_01",
    "s_m_y_marine_02",
    "s_m_y_marine_03",
    "s_m_m_marine_01",
    "s_m_m_marine_02",
}