if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local GAME_NAME = "Junioor"
local gameId = game.GameId

print("[" .. GAME_NAME .. "] Loader carregado")
print("[" .. GAME_NAME .. "] GameId:", gameId)
print("[" .. GAME_NAME .. "] PlaceId:", game.PlaceId)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Junioor_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(430, 260)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 0, 45)
Title.Position = UDim2.fromOffset(18, 12)
Title.BackgroundTransparency = 1
Title.Text = "Junioor Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 25
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(35, 35)
Close.Position = UDim2.new(1, -45, 0, 10)
Close.BackgroundTransparency = 1
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 70, 70)
Close.TextSize = 20
Close.Font = Enum.Font.GothamBold
Close.Parent = Main

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(1, -36, 0, 50)
Info.Position = UDim2.fromOffset(18, 60)
Info.BackgroundTransparency = 1
Info.Text = "Carregado com sucesso!\nGameId: " .. tostring(gameId)
Info.TextColor3 = Color3.fromRGB(180, 180, 190)
Info.TextSize = 15
Info.Font = Enum.Font.Gotham
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.TextWrapped = true
Info.Parent = Main

local function createButton(text, y)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -36, 0, 40)
    Button.Position = UDim2.fromOffset(18, y)
    Button.BackgroundColor3 = Color3.fromRGB(80, 100, 255)
    Button.BorderSizePixel = 0
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 16
    Button.Font = Enum.Font.GothamBold
    Button.Parent = Main

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = Button

    return Button
end

local Button1 = createButton("Função 1", 125)
local Button2 = createButton("Função 2", 175)

Button1.MouseButton1Click:Connect(function()
    print("[Junioor] Função 1 clicada")
    Button1.Text = "Função 1 ativada"
end)

Button2.MouseButton1Click:Connect(function()
    print("[Junioor] Função 2 clicada")
    Button2.Text = "Função 2 ativada"
end)
