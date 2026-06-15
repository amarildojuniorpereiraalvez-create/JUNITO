if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local HUB_NAME = "Junioor"

print("[" .. HUB_NAME .. "] Loader carregado com sucesso!")
print("[" .. HUB_NAME .. "] GameId:", game.GameId)
print("[" .. HUB_NAME .. "] PlaceId:", game.PlaceId)

local oldGui = player:WaitForChild("PlayerGui"):FindFirstChild("Junioor_Hub")
if oldGui then
    oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "Junioor_Hub"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(450, 300)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(65, 65, 90)
stroke.Thickness = 1
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -70, 0, 45)
title.Position = UDim2.fromOffset(20, 12)
title.BackgroundTransparency = 1
title.Text = "Junioor Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 26
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(36, 36)
close.Position = UDim2.new(1, -48, 0, 10)
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 20
close.Font = Enum.Font.GothamBold
close.Parent = main

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -40, 0, 55)
info.Position = UDim2.fromOffset(20, 60)
info.BackgroundTransparency = 1
info.Text = "Carregado com sucesso!\nGameId: " .. tostring(game.GameId) .. " | PlaceId: " .. tostring(game.PlaceId)
info.TextColor3 = Color3.fromRGB(180, 180, 190)
info.TextSize = 15
info.Font = Enum.Font.Gotham
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextWrapped = true
info.Parent = main

local function criarBotao(texto, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -40, 0, 42)
    btn.Position = UDim2.fromOffset(20, y)
    btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    btn.BorderSizePixel = 0
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    btn.Font = Enum.Font.GothamBold
    btn.Parent = main

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 9)
    corner.Parent = btn

    return btn
end

local botao1 = criarBotao("Função 1", 130)
local botao2 = criarBotao("Função 2", 180)
local botao3 = criarBotao("Fechar Hub", 230)

botao1.MouseButton1Click:Connect(function()
    botao1.Text = "Função 1 ativada!"
    print("[Junioor] Função 1 ativada")
end)

botao2.MouseButton1Click:Connect(function()
    botao2.Text = "Função 2 ativada!"
    print("[Junioor] Função 2 ativada")
end)

botao3.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
