-- main.lua
local BaseUrl = "https://raw.githubusercontent.com/Sp4wnK1dd-Dev/HVH-Flick/main/"

-- Безопасная загрузка модулей
local function loadModule(name)
    local success, result = pcall(function()
        return game:HttpGet(BaseUrl .. name .. ".lua")
    end)
    if success and result ~= "" then
        local func = loadstring(result)
        if func then
            return func()
        else
            warn("Ошибка загрузки модуля " .. name .. ": Loadstring вернул nil")
        end
    else
        warn("Не удалось скачать модуль " .. name .. ": " .. tostring(result))
    end
    return nil
end

-- main.lua
local Config = loadModule("config") -- Твоя функция загрузки
local Functions = loadModule("functions")
local Menu = loadModule("menu")

-- Запуск интерфейса
if Menu and Menu.CreateMenu then
    Menu.CreateMenu(Config)
end

-- Загрузка компонентов
local Config = loadModule("config")
local Functions = loadModule("functions")
local Menu = loadModule("menu")

-- Проверка на наличие критических модулей
if not Config or not Functions then
    warn("Критические модули не загружены, остановка скрипта.")
    return
end

-- Инициализация меню
if Menu and Menu.CreateMenu then
    Menu.CreateMenu(Config)
end

-- Основной цикл
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        -- Движение
        if Config.Toggles["Movement"] then Functions.Movement() end
        
        -- RageBot (Логика цели)
        if Config.Toggles["Aimbot"] then 
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

        -- Остальные функции (только если они существуют в таблице Functions)
        if Config.Toggles["AutoShoot"] and Functions.AutoShoot then Functions.AutoShoot() end
        if Config.Toggles["Resolver"] and Functions.Resolver then Functions.Resolver() end
        if Config.Toggles["AntiAim"] and Functions.AntiAim then Functions.AntiAim() end
        if Config.Toggles["Fakeduck"] and Functions.Fakeduck then Functions.Fakeduck() end
        if Config.Toggles["LegitAim"] and Functions.LegitAim then Functions.LegitAim() end
        if Config.Toggles["Triggerbot"] and Functions.Triggerbot then Functions.Triggerbot() end
        if Config.Toggles["RCS"] and Functions.RCS then Functions.RCS() end
        if Config.Toggles["Chams"] and Functions.Chams then Functions.Chams() end
        if Config.Toggles["Skeletons"] and Functions.Skeletons then Functions.Skeletons() end
        if Config.Toggles["InfoESP"] and Functions.InfoESP then Functions.InfoESP() end
        if Config.Toggles["Skinchanger"] and Functions.Skinchanger then Functions.Skinchanger() end
    end)
end)
