local QBCore = exports['qb-core']:GetCoreObject()

-- Configuración del NPC
local config = {
    pedModel = "s_m_m_doctor_01", -- Modelo del NPC (médico)
    coords = vector4(307.1, -595.1, 43.3, 70.0), -- Posición del NPC (ajusta según necesites)
    healPrice = 100, -- Precio por curación
}

-- Crear el NPC
CreateThread(function()
    -- Cargar el modelo
    RequestModel(GetHashKey(config.pedModel))
    while not HasModelLoaded(GetHashKey(config.pedModel)) do
        Wait(1)
    end

    -- Crear el ped
    local ped = CreatePed(4, GetHashKey(config.pedModel), config.coords.x, config.coords.y, config.coords.z - 1, config.coords.w, false, true)
    SetEntityHeading(ped, config.coords.w)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    -- Crear el target
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                type = "client",
                event = "npc-doctor:client:healPlayer",
                icon = "fas fa-band-aid",
                label = "Recibir tratamiento ($" .. config.healPrice .. ")",
            },
        },
        distance = 2.5,
    })
end)

-- Evento para curar al jugador
RegisterNetEvent('npc-doctor:client:healPlayer', function()
    local player = PlayerPedId()
    
    QBCore.Functions.TriggerCallback('npc-doctor:server:canAffordHeal', function(canAfford)
        if canAfford then
            QBCore.Functions.Progressbar("healing_player", "Recibiendo tratamiento...", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TriggerServerEvent('npc-doctor:server:healPlayer')
                QBCore.Functions.Notify("Has sido curado", "success")
            end)
        else
            QBCore.Functions.Notify("No tienes suficiente dinero", "error")
        end
    end)
end)

-- Añadir evento para manejar la curación local después del revivir
RegisterNetEvent('npc-doctor:client:finishHeal', function()
    local player = PlayerPedId()
    SetEntityHealth(player, 200)
end)