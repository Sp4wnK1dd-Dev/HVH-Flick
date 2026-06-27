-- main.lua
local BaseUrl = "https://raw.githubusercontent.com/Sp4wnK1dd-Dev/HVH-Flick/main/"

local Config = loadstring(game:HttpGet(BaseUrl .. "config.lua"))()
local Functions = loadstring(game:HttpGet(BaseUrl .. "functions.lua"))()(Config)
local UI = Menu.CreateMenu() -- или просто Menu()

game:GetService("RunService").RenderStepped:Connect(function()
    -- Bunnyhop
    if Config.Toggles["AutoBunnyhop"] then
        Functions.AutoBunnyhop()
    end

    -- Chams (вызываем один раз при изменении или в цикле)
    Functions.ToggleChams(Config.Toggles["Chams"])
end)
