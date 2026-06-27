-- main.lua
local success, result = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/Sp4wnK1dd-Dev/HVH-Flick/main/config.lua")
end)

if success and result ~= "" then
    local func = loadstring(result)
    if func then
        func() -- Теперь это точно сработает
    else
        warn("Loadstring вернул nil, проверь синтаксис файла!")
    end
else
    warn("Не удалось скачать файл: " .. tostring(result))
end

local Config = loadstring(game:HttpGet(BaseUrl .. "config.lua"))()
local Functions = loadstring(game:HttpGet(BaseUrl .. "functions.lua"))()(Config)
local Menu = loadstring(game:HttpGet(BaseUrl .. "menu.lua"))() 

local UI = Menu.CreateMenu(Config) 

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        -- 1. Misc / Movement
        if Config.Toggles["Movement"] then Functions.Movement() end
        
        -- 2. RageBot
        if Config.Toggles["RageBot"] then Functions.RageBot() end
        -- В main.lua
        if Config.Toggles["Aimbot"] then 
            local target = Functions.GetClosestTarget() -- Нужно создать эту функцию поиска
            if target then
                -- Проверка Min Damage перед стрельбой
                if Config.Toggles["MinDamage"] then
                    if Functions.MinDamage(target) then
                        Functions.Shoot(target)
                    end
                else
                    Functions.Shoot(target) -- Если выключено, стреляем всегда
                end
            end
        end
        if Config.Toggles["AutoShoot"] then Functions.AutoShoot() end
        if Config.Toggles["Resolver"] then Functions.Resolver() end
        if Config.Toggles["MinDamage"] then Functions.MinDamage() end
        
        -- 3. Anti-Aim
        if Config.Toggles["AntiAim"] then Functions.AntiAim() end
        if Config.Toggles["Fakeduck"] then Functions.Fakeduck() end
        
        -- 4. LegitBot
        if Config.Toggles["LegitAim"] then Functions.LegitAim() end
        if Config.Toggles["Triggerbot"] then Functions.Triggerbot() end
        if Config.Toggles["RCS"] then Functions.RCS() end
        
        -- 5. Visuals
        if Config.Toggles["Chams"] then Functions.Chams() end
        if Config.Toggles["Skeletons"] then Functions.Skeletons() end
        if Config.Toggles["InfoESP"] then Functions.InfoESP() end
        
        -- 6. Inventory
        if Config.Toggles["Skinchanger"] then Functions.Skinchanger() end
    end)
end)
