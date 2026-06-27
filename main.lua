-- main.lua
local BaseUrl = "https://raw.githubusercontent.com/Sp4wnK1dd-Dev/HVH-Flick/main/"

local Config = loadstring(game:HttpGet(BaseUrl .. "config.lua"))()
local Functions = loadstring(game:HttpGet(BaseUrl .. "functions.lua"))()(Config)
local Menu = loadstring(game:HttpGet(BaseUrl .. "menu.lua"))() 

local UI = Menu.CreateMenu(Config) 

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        -- 1. Misc / Movement
        if Config.Toggles["Movement"] then Functions.Movement() end
        
        -- 2. RageBot
        if Config.Toggles["RageBot"] then Functions.RageBot() 
                local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    -- Ищем ближайшего врага
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetPart = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            
            if onScreen then
                local dist = (Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestPlayer = targetPart
                end
            end
        end
    end
    
    -- Наводимся на цель
    if closestPlayer then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestPlayer.Position)
    end
end
        if Config.Toggles["Aimbot"] then Functions.Aimbot() 
                local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()
    
    local closestPlayer = nil
    local shortestDistance = AimFOV
    
    -- Ищем цель внутри радиуса FOV
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local targetPart = player.Character.Head
            local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
            
            if onScreen then
                local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestPlayer = targetPart
                end
            end
        end
    end
    
    -- Плавное наведение
    if closestPlayer then
        local targetCFrame = CFrame.new(Camera.CFrame.Position, closestPlayer.Position)
        Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, Smoothness)
    end
end
        if Config.Toggles["AutoShoot"] then Functions.AutoShoot() 
                local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    
    -- Получаем объект, на который смотрит прицел
    local target = Mouse.Target
    
    if target and target.Parent then
        -- Проверяем, является ли объект частью персонажа другого игрока
        local player = Players:GetPlayerFromCharacter(target.Parent)
        
        -- Если это игрок и он не мы сами
        if player and player ~= LocalPlayer then
            -- Имитируем клик (стрельбу)
            mouse1click() -- Внимание: зависит от твоего экзекьютора
        end
    end
end
        if Config.Toggles["Resolver"] then Functions.Resolver() 
                local Players = game:GetService("Players")
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local head = player.Character:FindFirstChild("Head")
            
            if head then
                -- Логика: пытаемся «выровнять» голову, если она неестественно повернута
                -- В реальных HVH-читaх здесь идет анализ скорости и угла поворота
                -- Мы принудительно обнуляем углы поворота головы, чтобы они смотрели на нас
                head.CFrame = CFrame.new(head.Position, game.Players.LocalPlayer.Character.Head.Position)
            end
        end
    end
end
        if Config.Toggles["MinDamage"] then Functions.MinDamage() 
                if not targetPart then return false end
    
    -- Пример расчета: чем дальше цель, тем меньше урон (упрощенная модель)
    local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - targetPart.Position).Magnitude
    
    -- Предположим, урон падает с дистанцией
    local estimatedDamage = 100 - (distance / 2) 
    
    if estimatedDamage >= MIN_DAMAGE_THRESHOLD then
        return true -- Стреляем
    else
        return false -- Урона недостаточно, не стреляем
    end
end
        
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
