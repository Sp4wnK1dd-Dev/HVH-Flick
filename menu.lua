-- menu.lua
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Menu = {}

Menu.CreateMenu = function(Config)
    local Window = Fluent:CreateWindow({
        Title = "HVH Project | User v1.0",
        SubTitle = "Main Controls",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark"
    })

    -- Создаем вкладки
    local Tabs = {
        Movement = Window:AddTab({ Title = "Movement", Icon = "rbxassetid://10734950309" }),
        Combat = Window:AddTab({ Title = "Combat", Icon = "rbxassetid://10723325251" }),
        Visuals = Window:AddTab({ Title = "Visuals", Icon = "rbxassetid://10734950309" })
    }

    -- 1. Movement Tab
    Tabs.Movement:AddToggle("BHop", { Title = "Auto-Bunnyhop", Default = Config.Movement.Bunnyhop, Callback = function(v) Config.Movement.Bunnyhop = v end })
    Tabs.Movement:AddToggle("Speed", { Title = "Enable SpeedHack", Default = Config.Movement.SpeedHack.Enabled, Callback = function(v) Config.Movement.SpeedHack.Enabled = v end })
    Tabs.Movement:AddSlider("Mult", { Title = "Multiplier", Min = 1, Max = 3, Default = Config.Movement.SpeedHack.Multiplier, Rounding = 1, Callback = function(v) Config.Movement.SpeedHack.Multiplier = v end })

    -- 2. Combat Tab (Пример)
    Tabs.Combat:AddToggle("Aimbot", { Title = "Aimbot", Callback = function(v) Config.Combat.Aimbot = v end })
    Tabs.Combat:AddToggle("AutoShoot", { Title = "Auto-Shoot", Callback = function(v) Config.Combat.AutoShoot = v end })

    -- 3. Visuals Tab (Пример)
    Tabs.Visuals:AddToggle("Chams", { Title = "Enable Chams", Callback = function(v) Config.Visuals.Chams = v end })

    Fluent:SelectTab(1)
end

return Menu
