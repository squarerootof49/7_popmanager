--Credits for stuff related to no generation areas: https://github.com/Demigod916. Marked with *1
--Credits for stuff related to scenario disabling and relationships setting: https://github.com/Andyyy7666. Marked with *2

--*1
local function createDebugZone(data)
    if not lib then print('^1 [ERROR] Need ox_lib for debug ^7') end
    lib.zones.box({
        coords = data.coords,
        size = vec3(data.size, data.size, data.thickness),
        debug = true
    })
end

--*1
local antiGenAreas = {
    { coords = vec3(448.562653, -983.630737, 30.678345),    size = 90,  thickness = 20.0 }, -- mrpd
    { coords = vec3(-1335.494507, -3045.072510, 13.929688), size = 550, thickness = 100 },  -- airport
    { coords = vec3(-2130.092285, 3092.215332, 32.801514),  size = 950, thickness = 100 },  -- mili base
    { coords = vec3(972.303284, -121.476921, 74.353149),    size = 50,  thickness = 100 },  -- lostmc base
    { coords = vec3(339.771423, -1424.175781, 76.156006),   size = 100, thickness = 100 },  -- jamestown hospital
    { coords = vec3(-43.832966, -1097.815430, 26.415405),   size = 30,  thickness = 100 }   -- pdm
}

--*2
local scenarios = {
    "WORLD_MOUNTAIN_LION_REST",
    "WORLD_MOUNTAIN_LION_WANDER",
    "DRIVE",
    "WORLD_VEHICLE_POLICE_BIKE",
    "WORLD_VEHICLE_POLICE_CAR",
    "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
    "WORLD_VEHICLE_DRIVE_SOLO",
    "WORLD_VEHICLE_BIKER",
    "WORLD_VEHICLE_DRIVE_PASSENGERS",
    "WORLD_VEHICLE_SALTON_DIRT_BIKE",
    "WORLD_VEHICLE_BICYCLE_MOUNTAIN",
    "PROP_HUMAN_SEAT_CHAIR",
    "WORLD_VEHICLE_ATTRACTOR",
    "WORLD_HUMAN_LEANING",
    "WORLD_HUMAN_HANG_OUT_STREET",
    "WORLD_HUMAN_DRINKING",
    "WORLD_HUMAN_SMOKING",
    "WORLD_HUMAN_GUARD_STAND",
    "WORLD_HUMAN_CLIPBOARD",
    "WORLD_HUMAN_HIKER",
    "WORLD_VEHICLE_EMPTY",
    "WORLD_VEHICLE_BIKE_OFF_ROAD_RACE",
    "WORLD_HUMAN_PAPARAZZI",
    "WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN",
    "WORLD_VEHICLE_PARK_PARALLEL",
    "WORLD_VEHICLE_CONSTRUCTION_SOLO",
    "WORLD_VEHICLE_CONSTRUCTION_PASSENGERS",
    "WORLD_VEHICLE_TRUCK_LOGS",
    "WORLD_VEHICLE_AMBULANCE",
    "WORLD_VEHICLE_BICYCLE_BMX",
    "WORLD_VEHICLE_BICYCLE_BMX_BALLAS",
    "WORLD_VEHICLE_BICYCLE_BMX_FAMILY",
    "WORLD_VEHICLE_BICYCLE_BMX_HARMONY",
    "WORLD_VEHICLE_BICYCLE_BMX_VAGOS",
    "WORLD_VEHICLE_BICYCLE_ROAD",
    "WORLD_VEHICLE_BOAT_IDLE",
    "WORLD_VEHICLE_BOAT_IDLE_ALAMO",
    "WORLD_VEHICLE_BOAT_IDLE_MARQUIS",
    "WORLD_VEHICLE_BROKEN_DOWN",
    "WORLD_VEHICLE_BUSINESSMEN",
    "WORLD_VEHICLE_HELI_LIFEGUARD",
    "WORLD_VEHICLE_CLUCKIN_BELL_TRAILER",
    "WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED",
    "WORLD_VEHICLE_FARM_WORKER",
    "WORLD_VEHICLE_FIRE_TRUCK",
    "WORLD_VEHICLE_MARIACHI",
    "WORLD_VEHICLE_MECHANIC",
    "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
    "WORLD_VEHICLE_PASSENGER_EXIT",
    "WORLD_VEHICLE_POLICE",
    "WORLD_VEHICLE_QUARRY",
    "WORLD_VEHICLE_SALTON",
    "WORLD_VEHICLE_SECURITY_CAR",
    "WORLD_VEHICLE_STREETRACE",
    "WORLD_VEHICLE_TOURBUS",
    "WORLD_VEHICLE_TOURIST",
    "WORLD_VEHICLE_TANDL",
    "WORLD_VEHICLE_TRACTOR",
    "WORLD_VEHICLE_TRACTOR_BEACH",
    "WORLD_VEHICLE_TRUCKS_TRAILERS",
    "WORLD_VEHICLE_DISTANT_EMPTY_GROUND",
}

--*2
local relationships = {
    `AMBIENT_GANG_HILLBILLY`,
    `AMBIENT_GANG_BALLAS`,
    `AMBIENT_GANG_MEXICAN`,
    `AMBIENT_GANG_FAMILY`,
    `AMBIENT_GANG_MARABUNTE`,
    `AMBIENT_GANG_SALVA`,
    `GANG_1`,
    `GANG_2`,
    `GANG_9`,
    `GANG_10`,
    `FIREMAN`,
    `MEDIC`,
    `COP`
}

CreateThread(function()
    --*1
    for _, v in pairs(antiGenAreas) do
        SetAllVehicleGeneratorsActiveInArea(
            v.coords.x - v.size,
            v.coords.y - v.size,
            v.coords.z - v.thickness,
            v.coords.x + v.size,
            v.coords.y + v.size,
            v.coords.z + v.thickness,
            false,
            false
        )
        SetPedNonCreationArea(v.coords.x - v.size,
            v.coords.y - v.size,
            v.coords.z - v.thickness,
            v.coords.x + v.size,
            v.coords.y + v.size,
            v.coords.z + v.thickness)
        AddScenarioBlockingArea(v.coords.x - v.size,
            v.coords.y - v.size,
            v.coords.z - v.thickness,
            v.coords.x + v.size,
            v.coords.y + v.size,
            v.coords.z + v.thickness, false, true, true, true)
            
        if Config.debugAreas then
            createDebugZone(v)
        end
    end

    --*2
    for i=1, #relationships do
        SetRelationshipBetweenGroups(1, relationships[i], `PLAYER`)
    end

    --*2
    for i=1, #scenarios do
        SetScenarioTypeEnabled(scenarios[i], false)
    end

    SetPedPopulationBudget(Config.pedDensity)
    SetVehiclePopulationBudget(Config.vehDensity)
    SetNumberOfParkedVehicles(Config.parkedVehDensity)

    SetRandomBoats(not Config.disableBoats)
    SetRandomTrains(not Config.disableTrains)
    SetGarbageTrucks(not Config.disableGarbageTrucks)

    SetCreateRandomCops(not Config.disableCops)
    SetCreateRandomCopsNotOnScenarios(not Config.disableCops)
    SetCreateRandomCopsOnScenarios(not Config.disableCops)

    if Config.disableDispatch then
        for i = 1, 32 do
            EnableDispatchService(i, false)
        end
        SetDispatchCopsForPlayer(PlayerId(), false)
    end


    if Config.disableWantedLevel then SetMaxWantedLevel(0) end

    SetAudioFlag('PoliceScannerDisabled', not Config.disablePoliceScan)

    if Config.disableAmmunation then
        ClearAmbientZoneState("collision_ybmrar", false)
        SetAmbientZoneState("collision_ybmrar", false, false)
    end

    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_01_STAGE", not Config.disableVanilla)
    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM", not Config.disableVanilla)
    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM", not Config.disableVanilla)

    for _, vehicleModel in pairs(Config.disabledVehicles) do SetVehicleModelIsSuppressed(vehicleModel, true) end

    for _, pedModel in pairs(Config.disabledPeds) do SetPedModelIsSuppressed(pedModel, true) end

    if not Config.loopedRemoval then return end

    while true do
		local removedVehicles, removedPeds = 0, 0

        local vehicles <const> = GetGamePool("CVehicle")
        for i = 1, #vehicles do
            local vehicleId    <const> = vehicles[i]
            local vehicleModel <const> = GetEntityModel(vehicleId)

            for _, disabledVehicleModel in pairs(Config.disabledVehicles) do
                if vehicleModel == disabledVehicleModel then
                    SetEntityAsMissionEntity(vehicleId, true, true)
					DeleteVehicle(vehicleId)
                    removedVehicles += 1
                    break
                end
            end
        end
		
        local peds <const> = GetGamePool("CPed")
        for i = 1, #peds do
            local pedId    <const> = peds[i]
            local pedModel <const> = GetEntityModel(pedId)

            for _, disabledPedModel in pairs(Config.disabledPeds) do
                if pedModel == disabledPedModel then
                    SetEntityAsMissionEntity(pedId, true, true)
					DeletePed(pedId)
                    removedPeds += 1
                    break
                end
            end
        end

        if Config.debug then print(("Removed %d Vehicles and %d Peds"):format(removedVehicles, removedPeds)) end

		Wait(Config.loopTime)
    end
end)