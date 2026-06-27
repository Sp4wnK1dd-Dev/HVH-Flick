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
    Functions.AntiAim = function() 
local LocalPlayer = game.Players.LocalPlayer
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local rootPart = char.HumanoidRootPart
        
        -- Jitter: резкая смена углов поворота
        local jitterAngle = math.random(-90, 90)
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(jitterAngle), 0)
        
        -- Попытка создать "фейковую" модель (Desync)
        -- В некоторых играх это работает лучше, если вращать только RootJoint
        local rootJoint = char.LowerTorso:FindFirstChild("Root") or char.HumanoidRootPart:FindFirstChild("RootJoint")
        if rootJoint then
            rootJoint.C0 = rootJoint.C0 * CFrame.Angles(0, math.rad(180), 0)
        end
    end
end
    Functions.Fakeduck = function() 
local LocalPlayer = game.Players.LocalPlayer
    local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    
    if Humanoid then
        -- Быстрое переключение высоты бедер (HipHeight)
        -- Сервер будет видеть нас в приседе, а мы будем видеть нормальную высоту
        Humanoid.HipHeight = -2.5 -- Глубокий присед
        task.wait(0.1)
        Humanoid.HipHeight = 0    -- Возврат в нормальное положение
        task.wait(0.1)
    end
end
    
    -- Legit
    Functions.LegitAim = function() 
local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()

    local AimPart = "Head" -- Или "UpperTorso" для более скрытной игры
    local FOV = 100 -- Радиус работы аима
    local Smoothness = 0.05 -- Очень плавное движение

    local closestPlayer = nil
    local shortestDistance = FOV

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(AimPart) then
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character[AimPart].Position)
            if onScreen then
                local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestPlayer = player.Character[AimPart]
                end
            end
        end
    end

    if closestPlayer then
        -- Вычисляем направление к цели
        local targetPos = Camera:WorldToScreenPoint(closestPlayer.Position)
        local move = Vector2.new((targetPos.X - Mouse.X) * Smoothness, (targetPos.Y - Mouse.Y) * Smoothness)
        
        -- Плавно перемещаем камеру
        Camera.CFrame = Camera.CFrame * CFrame.Angles(math.rad(-move.Y), math.rad(-move.X), 0)
    end
end
    Functions.Triggerbot = function() 
local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    
    -- Определяем направление выстрела (от камеры вперед)
    local camera = workspace.CurrentCamera
    local rayOrigin = camera.CFrame.Position
    local rayDirection = camera.CFrame.LookVector * 1000 -- Дальность 1000 стад
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    
    local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    
    if raycastResult and raycastResult.Instance then
        local targetModel = raycastResult.Instance.Parent
        local player = Players:GetPlayerFromCharacter(targetModel)
        
        -- Если цель — другой игрок
        if player and player ~= LocalPlayer then
            -- Имитация клика
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait(0.05) -- Небольшая пауза, чтобы не спамить клики
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
        end
    end
end
    Functions.RCS = function() 
local LocalPlayer = game.Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    
    -- Проверяем, нажал ли игрок кнопку стрельбы
    if LocalPlayer:GetMouse().Button1Down then
        -- Мы имитируем "оттяжку" прицела вниз
        -- В реальных играх нужно знать точный вектор отдачи оружия
        local recoilVector = Vector2.new(0, 1.5) -- Значение 1.5 зависит от игры
        
        -- Плавно возвращаем прицел вниз
        Camera.CFrame = Camera.CFrame * CFrame.Angles(math.rad(recoilVector.Y * RecoilStrength), 0, 0)
    end
end
    
    -- Visuals
    Functions.Chams = function() 
local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            
            -- Проверяем, есть ли уже подсветка
            if not char:FindFirstChild("Highlight") then
                local highlight = Instance.new("Highlight")
                highlight.Parent = char
                highlight.Adornee = char
                
                -- Настройки внешнего вида
                highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Цвет заливки (красный)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Цвет контура
                highlight.FillTransparency = 0.5 -- Прозрачность заливки
                highlight.OutlineTransparency = 0 -- Контур полностью виден
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- Главная настройка: ВСЕГДА ПОВЕРХ
            end
        end
    end
end
    Functions.Skeletons = function() 
local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            -- Проверяем, есть ли уже созданные линии для этого игрока
            local lines = player.Character:FindFirstChild("SkeletonLines") or Instance.new("Folder", player.Character)
            lines.Name = "SkeletonLines"
            
            -- Пример: рисуем линию от головы к торсу
            local head = player.Character:FindFirstChild("Head")
            local torso = player.Character:FindFirstChild("UpperTorso") or player.Character:FindFirstChild("Torso")
            
            if head and torso then
                local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                local torsoPos, onScreen2 = Camera:WorldToViewportPoint(torso.Position)
                
                if onScreen and onScreen2 then
                    -- Используем Drawing API для рисования линии
                    local line = Drawing.new("Line")
                    line.From = Vector2.new(headPos.X, headPos.Y)
                    line.To = Vector2.new(torsoPos.X, torsoPos.Y)
                    line.Color = Color3.fromRGB(255, 255, 255)
                    line.Thickness = 1
                    line.Visible = true
                    -- В идеале тут нужно сохранять ссылку на line, чтобы удалять её при выключении функции
                end
            end
        end
    end
end
    Functions.InfoESP = function() 
local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local headPos, onScreen = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(0, 2, 0))
            
            if onScreen then
                -- Создаем текст (если он еще не создан для игрока)
                local espText = player.Character:FindFirstChild("ESPText")
                if not espText then
                    espText = Drawing.new("Text")
                    espText.Name = "ESPText"
                    espText.Size = 18
                    espText.Center = true
                    espText.Outline = true
                    espText.Color = Color3.fromRGB(255, 255, 255)
                    -- Сохраняем ссылку в объект персонажа для удаления позже
                    local obj = Instance.new("ObjectValue", player.Character)
                    obj.Name = "ESPText"
                    obj.Value = espText
                end

                -- Обновляем данные
                local textObj = player.Character.ESPText.Value
                local health = player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health or 0
                local dist = math.floor((hrp.Position - Camera.CFrame.Position).Magnitude)
                
                textObj.Text = player.Name .. "\nHP: " .. math.floor(health) .. " | " .. dist .. "m"
                textObj.Position = Vector2.new(headPos.X, headPos.Y)
                textObj.Visible = true
            end
        end
    end
end
    
    -- Inventory
    Functions.Skinchanger = function() 
local LocalPlayer = game.Players.LocalPlayer
    local Character = LocalPlayer.Character
    
    if Character then
        local Tool = Character:FindFirstChildOfClass("Tool")
        if Tool then
            -- Ищем все части инструмента (например, рукоятку или лезвие)
            for _, part in pairs(Tool:GetDescendants()) do
                if part:IsA("MeshPart") or part:IsA("Part") then
                    -- Подменяем текстуру на кастомную (здесь должен быть ID твоей текстуры)
                    -- Пример: "rbxassetid://123456789"
                    part.TextureID = "rbxassetid://15307540185" 
                end
            end
        end
    end
end
    
    -- Misc
    Functions.Movement = function() 
local LocalPlayer = game.Players.LocalPlayer
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChild("Humanoid")
    local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")

    if not Character or not Humanoid or not RootPart then return end

    -- 1. Auto-Bunnyhop
    if Config.Toggles["Bunnyhop"] then
        if Humanoid:GetState() == Enum.HumanoidStateType.Landed then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end

    -- 2. SpeedHack (Velocity)
    if Config.Toggles["SpeedHack"] then
        local SpeedMultiplier = 1.2 -- Безопасное значение, чтобы не кикнуло
        local velocity = RootPart.Velocity
        RootPart.Velocity = Vector3.new(velocity.X * SpeedMultiplier, velocity.Y, velocity.Z * SpeedMultiplier)
    end
end

    return Functions
end
