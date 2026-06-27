-- menu.lua
print("Меню загрузилось и пытается создаться...")

local Library = {}

function Library.CreateMenu()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    ScreenGui.Name = "HabibiMenu"
    
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 300, 0, 400)
    MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Active = true
    MainFrame.Draggable = true -- Позволяет перетаскивать окно
    
    local Title = Instance.new("TextLabel", MainFrame)
    Title.Text = "Habibi Hack [WF]"
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.TextColor3 = Color3.new(0, 1, 0)
    
    return {
        Gui = ScreenGui,
        Frame = MainFrame
    }
end

return { CreateMenu = function() -- твой код создания UI end }
return Library
