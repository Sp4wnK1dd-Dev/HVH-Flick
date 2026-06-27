-- menu.lua
print("Меню загрузилось и пытается создаться...")

local Library = {}

function Library.CreateMenu()
    function Library.CreateMenu(Config) -- Важно: принимаем Config
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 250, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -125, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.Active = true
    MainFrame.Draggable = true

    -- Кнопка удаления (Del)
    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    CloseBtn.Text = "X"
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Список функций для кнопок
    local features = {"AutoBunnyhop", "Chams", "Aimbot", "Triggerbot"}
    
    for i, name in pairs(features) do
        local btn = Instance.new("TextButton", MainFrame)
        btn.Size = UDim2.new(0, 200, 0, 40)
        btn.Position = UDim2.new(0, 25, 0, 50 + (i-1) * 50)
        btn.Text = name .. ": OFF"
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        
        btn.MouseButton1Click:Connect(function()
            -- Переключаем значение в Config
            Config.Toggles[name] = not Config.Toggles[name]
            
            -- Обновляем визуал кнопки
            btn.Text = name .. (Config.Toggles[name] and ": ON" or ": OFF")
            btn.BackgroundColor3 = Config.Toggles[name] and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(60, 60, 60)
        end)
    end
    
    return {Gui = ScreenGui}
end

return Library
