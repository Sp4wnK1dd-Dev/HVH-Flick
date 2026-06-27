-- main.lua
local BaseUrl = "https://raw.githubusercontent.com/Sp4wnK1dd-Dev/HVH-Flick/main/"

-- Загружаем конфиг первым!
local Config = loadstring(game:HttpGet(BaseUrl .. "config.lua"))()

-- Передаем Config в меню и функции
local Menu = loadstring(game:HttpGet(BaseUrl .. "menu.lua"))()(Config) 
local Functions = loadstring(game:HttpGet(BaseUrl .. "functions.lua"))()(Config)

-- Теперь цикл будет проверять Config.Toggles
game:GetService("RunService").RenderStepped:Connect(function()
    if Config.Toggles["AutoBunnyhop"] then
        Functions.Movement.AutoBunnyhop()
    end
end)
