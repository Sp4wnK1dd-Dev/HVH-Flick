-- main.lua
local BaseUrl = "https://raw.githubusercontent.com/Sp4wnK1dd-Dev/HVH-Flick/refs/heads/main/"

-- Функция безопасной загрузки
local function loadModule(name)
    local success, result = pcall(function()
        return game:HttpGet(BaseUrl .. name .. ".lua")
    end)
    if success and result and result ~= "" then
        local func = loadstring(result)
        return func and func() or nil
    end
    warn("Ошибка загрузки модуля: " .. name)
    return nil
end

-- ЗАГРУЗКА (Только 1 раз!)
local Config = loadModule("config")
local Functions = loadModule("functions")
local Menu = loadModule("menu")

-- Проверка
if not Config or not Functions then
    warn("Критические модули не загружены!")
    return
end

-- Инициализация меню
if Menu and Menu.CreateMenu then
    task.spawn(function()
        task.wait(1) -- Небольшая пауза для инициализации Fluent
        Menu.CreateMenu(Config)
    end)
end

-- ОСНОВНОЙ ЦИКЛ
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        -- Движение
        if Config.Toggles and Config.Toggles["Movement"] then Functions.Movement() end
        
        -- RageBot (Логика цели)
        if Config.Toggles and Config.Toggles["Aimbot"] then 
            local target = Functions.GetClosestTarget and Functions.GetClosestTarget()
            if target then
                local canShoot = true
                if Config.Toggles["MinDamage"] and Functions.MinDamage then
                    canShoot = Functions.MinDamage(target)
                end
                if canShoot and Functions.Shoot then
                    Functions.Shoot(target)
                end
            end
        end

        -- Остальные функции (Проверка на существование функции и тогла)
        local toggles = {
            AutoShoot = Functions.AutoShoot,
            Resolver = Functions.Resolver,
            AntiAim = Functions.AntiAim,
            Fakeduck = Functions.Fakeduck,
            LegitAim = Functions.LegitAim,
            Triggerbot = Functions.Triggerbot,
            RCS = Functions.RCS,
            Chams = Functions.Chams,
            Skeletons = Functions.Skeletons,
            InfoESP = Functions.InfoESP,
            Skinchanger = Functions.Skinchanger
        }

        for name, func in pairs(toggles) do
            if Config.Toggles and Config.Toggles[name] and func then
                func()
            end
        end
    end)
end)
