local QBCore = exports['qb-core']:GetCoreObject()

local healPrice = 100 -- Asegúrate que este precio coincida con el del cliente

QBCore.Functions.CreateCallback('npc-doctor:server:canAffordHeal', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.money["cash"] >= healPrice then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('npc-doctor:server:healPlayer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        Player.Functions.RemoveMoney("cash", healPrice, "doctor-heal")
        
        -- Primero revivimos al jugador
        TriggerClientEvent('hospital:client:Revive', src)
        
        -- Esperamos un momento para asegurarnos de que el revivir se complete
        Wait(100)
        
        -- Luego curamos las heridas
        TriggerClientEvent('hospital:client:HealInjuries', src, "full")
        
        -- Finalmente, aseguramos que la salud esté al máximo
        TriggerClientEvent('npc-doctor:client:finishHeal', src)
    end
end)