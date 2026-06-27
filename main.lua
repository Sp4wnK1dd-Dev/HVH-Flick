local BaseUrl = "https://raw.githubusercontent.com/Sp4wnK1dd-Dev/HVH-Flick/main/"

local Config = loadstring(game:HttpGet(BaseUrl .. "config.lua"))()
local Functions = loadstring(game:HttpGet(BaseUrl .. "functions.lua"))()(Config)

-- Исправлено: теперь мы сохраняем результат loadstring в переменную Menu
local Menu = loadstring(game:HttpGet(BaseUrl .. "menu.lua"))() 

-- Теперь вызываем создание меню
local UI = Menu.CreateMenu() 

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if Config.Toggles["AutoBunnyhop"] then
            Functions.AutoBunnyhop()
        end
        Functions.ToggleChams(Config.Toggles["Chams"])
    end)
end)
