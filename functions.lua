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
    Functions.Aimbot = function() end
    Functions.AutoShoot = function() end
    Functions.Resolver = function() end
    Functions.MinDamage = function() end
    
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
