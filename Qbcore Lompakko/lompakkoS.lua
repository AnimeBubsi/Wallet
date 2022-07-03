local QBCore = exports['qb-core']:GetCoreObject() 

QBCore.Functions.CreateUseableItem('lompakko', function(source)
	TriggerClientEvent('esx_lompakko:animaatio', source)
end)

--QBCore.Functions.CreateUseableItem('tlompakko', function(source)
--	TriggerClientEvent('esx_lompakko:animaatiot', source)
--end)

RegisterServerEvent('esx_lompakko:summa')
AddEventHandler('esx_lompakko:summa', function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local nimi = GetPlayerName(source)
    local rahamaara = math.random(Config.Minimi, Config.Maximi)
	
    xPlayer.Functions.RemoveItem('lompakko', 1)
    --xPlayer.Functions.AddItem('tlompakko', 1)
        xPlayer.Functions.AddMoney("cash", rahamaara)
        TriggerClientEvent("QBCore:Notify", source, 'You found '..rahamaara..'$ from wallet', "success")
     if Config.dclogit then
	Dclogit(12222, "Wallet", nimi.. " found " ..rahamaara.. "$ from wallet")
     else
   end
end)

function Dclogit(color, name, message, footer)
  local footer = 'Bubsi - '..os.date("%d/%m/%Y - %X")
  local embed = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = footer,
            },
        }
    }
  PerformHttpRequest(Config.WEBHOOKKI, function(err, text, headers) end, 'POST', json.encode({username = Config.BotinNimi, embeds = embed}), { ['Content-Type'] = 'application/json' })
end
