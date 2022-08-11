local MainMenu = RageUI.CreateMenu("GXSHOP", "Bienvenue");

function RageUI.PoolMenus:Menu()
    MainMenu:IsVisible(function(RageUI)

        RageUI:AddSeparator("~p~".."Alimentaire")

        for k, v in pairs(Shops.Alimentaire) do
        RageUI:AddButton(v.Label, nil, { RightLabel = "~p~"..v.Price.."$" }, function(onSelected)
            if (onSelected) then
                TriggerServerEvent('buyItem', v.Label, v.Value , v.Price)
            end
        end)
    end

    RageUI:AddSeparator("~p~".."Divers")

    for k, v in pairs(Shops.Divers) do
        RageUI:AddButton(v.Label, nil, { RightLabel = "~p~"..v.Price.."$" }, function(onSelected)
            if (onSelected) then
                TriggerServerEvent('buyItem', v.Label, v.Value , v.Price)
            end
        end)
    end

    end, function()
    end)
end

Citizen.CreateThread(function()
    while true do
        local interval = 1000
        for k, v in pairs(Shops.Pos) do
            local PlayerPos = GetEntityCoords(PlayerPedId())
            local distance = #(PlayerPos - v)
            if distance <= 2 then
                interval = 0
                DrawMarker(23, v.x, v.y, v.z + 0.10, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 0, 0, 0, 150, 0, false, true, 2, false, false, false, false)
                if distance <= 2 then
                    Visual.Subtitle("Appuyez sur ~p~[E] ~s~pour accéder au magasin", 1)
                    if IsControlJustPressed(0, 51) then 
                        RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
                    end
                end
            end
        end
        Wait(interval)
    end
end)



Citizen.CreateThread(function()
    for k, v in pairs(Shops.Pos) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 52)
        SetBlipScale (blip, 1.0)
        SetBlipColour(blip, 11)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Supérette')
        EndTextCommandSetBlipName(blip)
    end
end)   

-- Keys.Register("F5", "F5", "Test", function()
--     RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
-- end)