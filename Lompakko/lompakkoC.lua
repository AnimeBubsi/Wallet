ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_lompakko:animaatio')
AddEventHandler('esx_lompakko:animaatio', function()
    if Config.Animaatio then
        ExecuteCommand("e uncuff")
        exports['progressBars']:startUI(5000, 'Searching money from wallet')
        Citizen.Wait(5000)
        ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent('esx_lompakko:summa', source)
    else
	TriggerServerEvent('esx_lompakko:summa', source)
    end
end)

RegisterNetEvent('esx_lompakko:animaatiot')
AddEventHandler('esx_lompakko:animaatiot', function()
    if Config.Animaatio then
        ExecuteCommand("e uncuff")
        exports['progressBars']:startUI(5000, 'Searching money from wallet')
        Citizen.Wait(5000)
        ClearPedTasksImmediately(PlayerPedId())
        ESX.ShowNotification('Wallet is empty!!')
    else
	xPlayer.showNotification('Wallet is empty!!')
    end
end)

