-- functions.lua
return function(Config)
    local Functions = {}
    
    -- Rage
    Functions.RageBot = function() 
        
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
end
    Functions.Aimbot = function() 
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
    end
        Functions.AutoShoot = function() 
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
end
    Functions.Resolver = function() 
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
    Functions.MinDamage = function() 
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
    
    -- Anti-Aim
    Functions.AntiAim = function() end
    Functions.Fakeduck = function() end
    
    -- Legit
    Functions.LegitAim = function() end
    Functions.Triggerbot = function() end
    Functions.RCS = function() end
    
    -- Visuals
    Functions.Chams = function() end
    Functions.Skeletons = function() end
    Functions.InfoESP = function() end
    
    -- Inventory
    Functions.Skinchanger = function() end
    
    -- Misc
    Functions.Movement = function() end

    return Functions
end
