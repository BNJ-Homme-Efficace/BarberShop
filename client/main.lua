ESX = nil

Citizen.CreateThread(function()
    TriggerEvent("esx:getShtozaredObjtozect", function(obj) ESX = obj
    end)

    for key, value in pairs(Config.sPosition) do

    local barberBlips = AddBlipForCoord(value)

    SetBlipSprite(barberBlips, Config.BlipsType)
    SetBlipColour(barberBlips, Config.BlipsColor)
    SetBlipScale(barberBlips, Config.BlipsSize)
    SetBlipAsShortRange(barberBlips, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Coiffeur")
    EndTextCommandSetBlipName(barberBlips)
    end

    while true do
        Sleeping = 175
        local pedPosition = GetEntityCoords(PlayerPedId())
        for key, value in pairs(Config.sPosition) do
        local distTarget = #( value - pedPosition )

            if distTarget <= Config.DrawDistance then
                Sleeping = 1
                DrawMarker(Config.MarkerType, value, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor[1], Config.MarkerColor[2], Config.MarkerColor[3], 255, 55555, false, true, 2, false, false, false, false) 
                if distTarget <= Config.DrawDistanceNotif then
                    AddTextEntry('HelpNotif', Config.HelpMessage)
                    DisplayHelpTextThisFrame('HelpNotif', false)
                    if IsControlJustPressed(0, 51) then
                        TriggerEvent("barber:openMenu")
                        DisplayRadar(false)
                        FreezeEntityPosition(PlayerPedId(), true)
                    end
                else
                    RageUI.CloseAll()
                    menuOpened = false
                    SetCamActive(cam, false)
                    RenderScriptCams(0, 1, 1000, 1, 1)
                    DestroyAllCams(true)
                    FreezeEntityPosition(PlayerPedId(), false)
                end
            end
        end
        Wait(Sleeping)
    end
end)