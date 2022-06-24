ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lompakko', function(source)
	TriggerClientEvent('esx_lompakko:animaatio', source)
end)

ESX.RegisterUsableItem('tlompakko', function(source)
	TriggerClientEvent('esx_lompakko:animaatiot', source)
end)

RegisterServerEvent('esx_lompakko:summa')
AddEventHandler('esx_lompakko:summa', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local nimi = GetPlayerName(source)
    local rahamaara = math.random(0, Config.Maximi)
	
	xPlayer.removeInventoryItem('lompakko', 1)
	xPlayer.addInventoryItem('tlompakko', 1)
        xPlayer.addMoney(rahamaara)
 	xPlayer.showNotification('You found ~g~'..rahamaara..'$~s~ from wallet')
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
