ESX = nil

CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Wait(0)
    end
end)

local menuOpened = false
local totalToBuy = {}
local BarberShopList = {
    Hair = 0,
    Beard = 0,
    Eyebrows = 0,
    Eye = 0,
    Makeup = 0,
    Lipstick = 0,
}

local index = {
    Color = {
        primary = { 1, 1 },
        secondary = { 1, 1 }
    },
    percentagepanelBeard = 10,
    percentagepanelSours = 10,
    percentagepanelMakeup = 10,
    percentagepanelLipstick = 10,
}

local mainMenu = RageUI.CreateMenu("Barber Shop", "Voici le catalogue : ", 10 , 80)
local buyMenu = RageUI.CreateSubMenu(mainMenu, "Coiffeur", "Le prix : ", 10 , 80)
mainMenu:SetRectangleBanner(153, 10, 255, 140)
buyMenu:SetRectangleBanner(153, 10, 255, 140)
mainMenu.EnableMouse = true
mainMenu.Closable = false
mainMenu.Closed = function()
    menuOpened = false
end



function openBarberMenu()
    if menuOpened then
        menuOpened = false
    else
        menuOpened = true
        RageUI.Visible(mainMenu, true)
        CreateThread(function()
            while menuOpened do
                Wait(1)
                RageUI.IsVisible(mainMenu, function()

                    local coords = GetEntityCoords(GetPlayerPed(-1))
                    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
                    SetCamCoord(cam, coords.x+2.0, coords.y, coords.z+0.6)
                    SetCamFov(cam, 30.0)
                    PointCamAtCoord(cam, coords.x, coords.y, coords.z+0.6)
                    SetCamShakeAmplitude(cam, 13.0)
                    RenderScriptCams(1, 1, 1500, 1, 1)
                    
                    HairStyle = {}
                    for i = 0 , 210, 1 do
                        HairStyle[i] = i
                    end
    
                    BeardStyle = {}
                    for i = 0 , 29, 1 do
                        BeardStyle[i] = i
                    end

                    Eyebrows = {}
                    for i = 0 , 33, 1 do
                        Eyebrows[i] = i
                    end

                    EyeStyle = {}
                    for i = 0 , 50, 1 do
                        EyeStyle[i] = i
                    end

                    MakeupStyle = {}
                    for i = 0 , 94, 1 do
                        MakeupStyle[i] = i
                    end

                    LipstickStyle = {}
                    for i = 0 , 50, 1 do
                        LipstickStyle[i] = i
                    end

                RageUI.Separator(Config.Catalog)

                RageUI.Button(Config.TurnPed, nil, {RightLabel = "→→"}, true, {
                    onSelected = function()
                        local baseheading = GetEntityHeading(PlayerPedId())
                        SetEntityHeading(PlayerPedId(), baseheading + 20)
                    end,
                })

-------------------------------------------------------------------------------------------------------------------

                RageUI.List(Config.HairTitle, HairStyle, BarberShopList.Hair, nil, {}, true, {
                    onListChange = function(i)
                        BarberShopList.Hair = i;
                        TriggerEvent("skinchanger:change", "hair_1", BarberShopList.Hair)
                    end,
                })

                RageUI.ColourPanel(Config.FirstColor, RageUI.PanelColour.HairCut, index.Color.primary[1], index.Color.primary[2], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        index.Color.primary[1] = MinimumIndex
                        index.Color.primary[2] = CurrentIndex
                        TriggerEvent("skinchanger:change", "hair_color_1", index.Color.primary[2])
                    end,
                }, 3)
                RageUI.ColourPanel(Config.Colortwo, RageUI.PanelColour.HairCut, index.Color.secondary[1], index.Color.secondary[2], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        index.Color.secondary[1] = MinimumIndex
                        index.Color.secondary[2] = CurrentIndex
                        TriggerEvent("skinchanger:change", "hair_color_2", index.Color.secondary[2])
                    end
                }, 3)
-------------------------------------------------------------------------------------------------------------------
                RageUI.List(Config.BeardTitle, BeardStyle, BarberShopList.Beard, nil, {}, true, {
                    onListChange = function(i)
                        BarberShopList.Beard = i;
                        TriggerEvent("skinchanger:change", "beard_1", BarberShopList.Beard)
                    end,
                })

                RageUI.ColourPanel(Config.Color, RageUI.PanelColour.HairCut, index.Color.primary[1], index.Color.primary[2], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        index.Color.primary[1] = MinimumIndex
                        index.Color.primary[2] = CurrentIndex
                        TriggerEvent("skinchanger:change", "beard_3", index.Color.primary[2])
                    end
                }, 4)

                RageUI.PercentagePanel(index.percentagepanelBeard, Config.Size, '0', '10', {
                    onSelected = function(Percentage)
                    end,
                    onProgressChange = function(Percentage)
                        index.percentagepanelBeard = Percentage
                        TriggerEvent("skinchanger:change", "beard_2", (index.percentagepanelBeard) * 10)
                    end
                }, 4)

-------------------------------------------------------------------------------------------------------------------                


                RageUI.List(Config.Eyebrows, Eyebrows, BarberShopList.Eyebrows, nil, {}, true, {
                    onListChange = function(i)
                        BarberShopList.Eyebrows = i;
                        TriggerEvent("skinchanger:change", "eyebrows_1", BarberShopList.Eyebrows)
                    end,
                })

                RageUI.ColourPanel(Config.Color, RageUI.PanelColour.HairCut, index.Color.primary[1], index.Color.primary[2], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        index.Color.primary[1] = MinimumIndex
                        index.Color.primary[2] = CurrentIndex
                        TriggerEvent("skinchanger:change", "eyebrows_3", index.Color.primary[2])
                    end
                }, 5)

                RageUI.PercentagePanel(index.percentagepanelSours, Config.Size, '0', '10', {
                    onSelected = function(Percentage)
                    end,
                    onProgressChange = function(Percentage)
                        index.percentagepanelSours = Percentage
                        TriggerEvent("skinchanger:change", "eyebrows_2", (index.percentagepanelSours) * 10)
                    end
                }, 5)

-------------------------------------------------------------------------------------------------------------------                

                RageUI.List(Config.Eyes, EyeStyle, BarberShopList.Eye, nil, {}, true, {
                    onListChange = function(i)
                        BarberShopList.Eye = i;
                        TriggerEvent("skinchanger:change", "eye_color", BarberShopList.Eye)
                    end,
                })

-------------------------------------------------------------------------------------------------------------------                

                RageUI.List(Config.Makeup, Eyebrows, BarberShopList.Makeup, nil, {}, true, {
                    onListChange = function(i)
                        BarberShopList.Makeup = i;
                        TriggerEvent("skinchanger:change", "makeup_1", BarberShopList.Makeup)
                    end,
                    onSelected = function()
                    end
                })

                RageUI.ColourPanel(Config.FirstColor, RageUI.PanelColour.HairCut, index.Color.primary[1], index.Color.primary[2], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        index.Color.primary[1] = MinimumIndex
                        index.Color.primary[2] = CurrentIndex
                        TriggerEvent("skinchanger:change", "makeup_3", index.Color.primary[2])
                    end
                }, 7)
                RageUI.ColourPanel(Config.Colortwo, RageUI.PanelColour.HairCut, index.Color.secondary[1], index.Color.secondary[2], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        index.Color.secondary[1] = MinimumIndex
                        index.Color.secondary[2] = CurrentIndex
                        TriggerEvent("skinchanger:change", "makeup_4", index.Color.secondary[2])
                    end
                }, 7)
                
                RageUI.PercentagePanel(index.percentagepanelMakeup, Config.Size, '0', '10', {
                    onSelected = function(Percentage)
                    end,
                    onProgressChange = function(Percentage)
                        index.percentagepanelMakeup = Percentage
                        TriggerEvent("skinchanger:change", "makeup_2", (index.percentagepanelMakeup) * 10)
                    end
                }, 7)

-------------------------------------------------------------------------------------------------------------------         

                RageUI.List(Config.Lipstick, LipstickStyle, BarberShopList.Lipstick, nil, {}, true, {
                    onListChange = function(i)
                        BarberShopList.Lipstick = i;
                        TriggerEvent("skinchanger:change", "lipstick_1", BarberShopList.Lipstick)
                    end,
                })

                RageUI.ColourPanel(Config.Color, RageUI.PanelColour.HairCut, index.Color.primary[1], index.Color.primary[2], {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        index.Color.primary[1] = MinimumIndex
                        index.Color.primary[2] = CurrentIndex
                        TriggerEvent("skinchanger:change", "lipstick_3", index.Color.primary[2])
                    end
                }, 8)

                RageUI.PercentagePanel(index.percentagepanelLipstick, Config.Size, '0', '10', {
                    onSelected = function(Percentage)
                    end,
                    onProgressChange = function(Percentage)
                        index.percentagepanelLipstick = Percentage
                        TriggerEvent("skinchanger:change", "lipstick_2", (index.percentagepanelLipstick) * 10)
                    end
                }, 8)

                RageUI.Separator(Config.ToPay)

                RageUI.Button(Config.GotoTheCase, nil, { RightLabel =  "→→" }, true, {
                }, buyMenu)

                RageUI.Button(Config.Cancel, nil, { RightLabel =  "~r~→→" }, true, {
                    onSelected = function()
                        RageUI.CloseAll()
                        menuOpened = false
                        DisplayRadar(true)
                        FreezeEntityPosition(PlayerPedId(), false)
                        
                        SetCamActive(cam, false)
                        RenderScriptCams(0, 1, 1000, 1, 1)
                        DestroyAllCams(true)
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)
                    end,
                })

                end, function() end)

                    RageUI.IsVisible(buyMenu, function()

                    RageUI.Separator("~s~↓ ~g~"..Config.TotalPrice.." : "..Config.Price.."$ ~s~↓")
                    RageUI.Separator('↓ ~b~ '..Config.PayementMethode..' ~s~↓')

                            RageUI.Button(Config.PayCash, nil, {RightLabel = "→→"}, true, {
                                onSelected = function()
                                    totalPay = Config.Price
                                    TriggerServerEvent("payeBarbercash:buy", totalPay)
                                 
                                end,
                            })

                    end, function() end)
            end
        end)
    end
end

RegisterNetEvent("barber:openMenu")
AddEventHandler("barber:openMenu", function()
    openBarberMenu()
end)

RegisterNetEvent("barber:saveSkin")
AddEventHandler("barber:saveSkin", function()
    SetCamActive(cam, false)
    RenderScriptCams(0, 1, 1000, 1, 1)
    DestroyAllCams(true)
    FreezeEntityPosition(PlayerPedId(), false)
    RageUI.CloseAll()
    menuOpened = false
    DisplayRadar(true)
    TriggerEvent('skinchanger:getSkin', function(skin)
    TriggerServerEvent('esx_skin:save', skin)
    end)
end)

