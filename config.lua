Config = {}

Config.debug                 = false                    --Prints some stuff for debug purposes.
Config.debugAreas            = false                    --Visualizes areas where spawning is prevented. Requires ox_lib.

-- NPC configuration
Config.pedDensity            = 0                        --Density of NPC. Ranges from 0 to 3, 3 being standard.
Config.vehDensity            = 0                        --Density of ROAMING vehicles. Ranges from 0 to 3, 3 being standard.
Config.parkedVehDensity      = 0                        --Density of PARKED vehicles. Ranges from 0 to 3, 3 being standard.
Config.disableCops           = true                     --Disable NPC cops?
Config.disableBoats          = true                     --Disable NPC boats?
Config.disableTrains         = true                     --Disable NPC trains?
Config.disableGarbageTrucks  = true                     --Disable NPC garbage trucks?
Config.loopedRemoval         = false                    --By default, the script prevents military, medical and police NPCs from spawning naturally. If this is set to true, it will also check every Config.loopTime and remove Config.disabledPeds and Config.disabledVehicles.
Config.loopTime              = 1250                     --Time in ms to run the looped natives. 1250ms is default.

-- Dispatch configuration
Config.disableDispatch       = true                     --Disable native GTAV NPC dispatch?
Config.disableWantedLevel    = true                     --Disable native GTAV wanted level?

-- Audio configuration
Config.disablePoliceScan    = true                      --Disable native GTAV police radio sound when in police vehicles?
Config.disableAmmunation    = true                      --Disable native GTAV ammunation ambient sound?
Config.disableVanilla       = true                      --Disable native GTAV vanilla unicorn ambient sound?

-- Model configuration
-- WARNING: if any of your resources spawn/use any of these vehicles, remove said vehicles from the list IF Config.loopedRemoval is set to true.
Config.disabledVehicles = {                             -- List of vehicles blacklisted from spawning.
    `akula`,
    `ambulance`,
    `apc`,
    `armytanker`,
    `avenger`,
    `avenger2`,
    `barracks`,
    `barracks2`,
    `barracks3`,
    `barrage`,
    `besra`,
    `bombushka`,
    `buzzard`,
    `cargobob`,
    `cargobob2`,
    `cargobob3`,
    `cargobob4`,
    `cargoplane`,
    `chernobog`,
    `fbi`,
    `fbi2`,
    `firetruk`,
    `hunt`,
    `hydra`,
    `jet`,
    `khanjali`,
    `lazer`,
    `menacer`,
    `mogul`,
    `molotok`,
    `nokota`,
    `police`,
    `police2`,
    `police3`,
    `police4`,
    `policeb`,
    `policet`,
    `polmav`,
    `rhino`,
    `riot`,
    `rogue`,
    `savage`,
    `scarab`,
    `scarab2`,
    `scarab3`,
    `starling`,
    `strikeforce`,
    `titan`,
    `trailersmall2`,
    `tula`,
    `valkyrie`,
    `valkyrie2`,
    `volatol`,
}

--WARNING: if any of your resources spawn/use any of these peds, remove said peds from the list IF config.loopedRemoval is set to true.
Config.disabledPeds = {                             -- List of peds blacklisted from spawning. WARNING: if any of your resources spawn/use any of these peds, remove said peds from the list.
    `s_m_m_marine_01`,
    `s_m_m_marine_02`,
    `s_m_m_paramedic_01`,
    `s_m_m_paramedic_02`,
    `s_m_y_cop_01`,
    `s_m_y_cop_02`,
    `s_m_y_fireman_01`,
    `s_m_y_hwaycop_01`,
    `s_m_y_marine_01`,
    `s_m_y_marine_02`,
    `s_m_y_marine_03`,
    `s_m_y_pilot_01`,
    `s_m_y_swat_01`,
}