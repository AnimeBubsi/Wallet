local QBCore = exports['qb-core']:GetCoreObject() 

RegisterNetEvent('esx_lompakko:animaatio')
AddEventHandler('esx_lompakko:animaatio', function()
    if Config.Animaatio then
        exports['progressbar']:Progress({
            name = "unique_action_name",
            duration = 5000,
            label = 'Searching Wallet...',
            useWhileDead = true,
            canCancel = false,
            controlDisables = {
               disableMovement = true,
               disableCarMovement = true,
               disableMouse = false,
               disableCombat = true,
           },
         }, function(cancelled)
end)
        ExecuteCommand("e uncuff")
        --exports['progressBars']:startUI(5000, 'Searching money from wallet')
        Citizen.Wait(5000)
        ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent('esx_lompakko:summa', source)
    else
	TriggerServerEvent('esx_lompakko:summa', source)
    end
end)

--RegisterNetEvent('esx_lompakko:animaatiot')
--AddEventHandler('esx_lompakko:animaatiot', function()
--    if Config.Animaatio then
        --ExecuteCommand("e uncuff")
--        Citizen.Wait(5000)
--        ClearPedTasksImmediately(PlayerPedId())
--        QBCore.Functions.Notify('Wallet is empty!!', "error")
--    else
--        QBCore.Functions.Notify('Wallet is empty!!', "error")
--    end
--end)

