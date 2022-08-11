ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('buyItem')
AddEventHandler('buyItem', function(Label, Value, Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= Price then
        if xPlayer.canCarryItem(Value, 1) then
            xPlayer.removeMoney(Price)
            xPlayer.addInventoryItem(Value, 1)
        TriggerClientEvent('esx:showAdvancedNotification', _src, "Supérette", "~o~2~r~4~7", "Vous venez d'acheter ~p~1x "..Label.." ~s~pour ~p~"..Price.."$ !", 'CHAR_ACTING_UP', 1)
        else
            TriggerClientEvent('esx:showAdvancedNotification', _src, "Supérette", "~o~2~r~4~7", "~p~Vous n'avez assez de place dans l'inventaire", 'CHAR_ACTING_UP', 1)
        end
    else
        TriggerClientEvent('esx:showAdvancedNotification', _src, "Supérette", "~o~2~r~4~7", "~p~Vous n'avez assez d'argent !", 'CHAR_ACTING_UP', 1)         
    end
end)