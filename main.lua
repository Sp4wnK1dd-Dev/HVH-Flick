-- main.lua (Главный загрузчик)
local BaseUrl = "https://raw.githubusercontent.com/ВАШ_НИК/ВАШ_РЕПОЗИТОРИЙ/main/" -- Замените на свой URL

-- Загрузка модулей
local Config = loadstring(game:HttpGet(BaseUrl .. "config.lua"))()
local Menu = loadstring(game:HttpGet(BaseUrl .. "menu.lua"))()
local Functions = loadstring(game:HttpGet(BaseUrl .. "functions.lua"))()

-- Инициализация меню
local UI = Menu.CreateMenu()

-- Функция связи (пример для Movement)
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        -- Если в конфиге включен AutoBunnyhop, вызываем функцию из модуля
        if Config.Movement["AutoBunnyhop"] then
            Functions.Movement.AutoBunnyhop()
        end
        
        -- Сюда добавляем остальные проверки...
    end)
end)
