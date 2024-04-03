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

local function removeVehicle(model)
    SetEntityAsMissionEntity(model, true, true)
    DeleteVehicle(model)
end

local function removePed(ped)
    SetEntityAsMissionEntity(ped, true, true)
    DeletePed(ped)
end

local function disableDispatch()
    for i = 1, 12 do
        EnableDispatchService(i, false)
    end
end

CreateThread(function()
    ---@diagnostic disable-next-line: missing-parameter
    AddPopMultiplierSphere(0, 0, 0, 100000, Config.pedDensity, Config.vehDensity);

    SetCreateRandomCops(Config.disableCops)
    SetCreateRandomCopsNotOnScenarios(Config.disableCops)
    SetCreateRandomCopsOnScenarios(Config.disableCops)

    if Config.disableWantedLevel then SetMaxWantedLevel(0) end

    SetAudioFlag('PoliceScannerDisabled', not Config.disablePoliceScan)

    if Config.disableAmmunation then
        ClearAmbientZoneState("collision_ybmrar", false)
        SetAmbientZoneState("collision_ybmrar", false, false)
    end

    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_01_STAGE", not Config.disableVanilla)
    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM", not Config.disableVanilla)
    SetStaticEmitterEnabled("LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM", not Config.disableVanilla)

    for _, modelName in ipairs(Config.disabledVehicles) do
        SetVehicleModelIsSuppressed(GetHashKey(modelName), true)
    end

    for _, modelName in ipairs(Config.disabledPeds) do
        SetPedModelIsSuppressed(GetHashKey(modelName), true)
    end

    local removedEntities

    while true do
        Wait(1250)

        removedEntities = 0
        local vehicles = GetGamePool("CVehicle")
        for i = 1, #vehicles do
            local vehicle = vehicles[i]
            local model = GetEntityModel(vehicle)

            for _, modelName in ipairs(Config.disabledVehicles) do
                if model == GetHashKey(modelName) then
                    removeVehicle(vehicle)
                    removedEntities += 1
                    break
                end
            end
        end

        if Config.debug then print("[Population Manager] Successfully removed "..removedEntities.." vehicles.") end


        removedEntities = 0
        local peds = GetGamePool("CPed")
        for i = 1, #peds do
            local ped = peds[i]
            local model = GetEntityModel(ped)

            for _, modelName in ipairs(Config.disabledPeds) do
                if model == GetHashKey(modelName) then
                    removePed(ped)
                    removedEntities += 1
                    break
                end
            end
        end

        if Config.debug then print("[Population Manager] Successfully removed "..removedEntities.." peds.") end

        if Config.disableDispatch then
            disableDispatch()
        end

        SetScenarioTypeEnabled("DRIVE", true)
        SetScenarioTypeEnabled("WALK", true)
    end
end)