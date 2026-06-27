-- menu.lua
print("Меню загрузилось и пытается создаться...")

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "HVH Project | User v1.0",
    SubTitle = "Main Controls",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark"
})

-- Создаем вкладку для Movement
local Tabs = {
    Movement = Window:AddTab({ Title = "Movement", Icon = "rbxassetid://10734950309" })
}

-- Добавляем Toggle и Slider для настроек
Tabs.Movement:AddToggle("BunnyhopToggle", {
    Title = "Auto-Bunnyhop",
    Default = false,
    Callback = function(Value)
        Config.Movement.Bunnyhop = Value -- Связь с Config.lua
    end
})

Tabs.Movement:AddToggle("SpeedHackToggle", {
    Title = "Enable SpeedHack",
    Default = false,
    Callback = function(Value)
        Config.Movement.SpeedHack.Enabled = Value
    end
})

-- Тот самый ползунок для настройки Multiplier
Tabs.Movement:AddSlider("SpeedSlider", {
    Title = "Speed Multiplier",
    Description = "Adjust your movement speed",
    Default = 1.2,
    Min = 1,
    Max = 3,
    Rounding = 1,
    Callback = function(Value)
        Config.Movement.SpeedHack.Multiplier = Value
    end
})

Fluent:SelectTab(1)

return Library
