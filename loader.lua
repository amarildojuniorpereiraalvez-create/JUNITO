if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer

print("[JUNIOOR] Loader carregado com sucesso!")
print("[JUNIOOR] GameId:", game.GameId)
print("[JUNIOOR] PlaceId:", game.PlaceId)

local gui = Instance.new("ScreenGui")
gui.Name = "Junioor_Loader"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(360, 160)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 40)
title.Position = UDim2.fromOffset(15, 15)
title.BackgroundTransparency = 1
title.Text = "Junioor Loader"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -30, 0, 60)
info.Position = UDim2.fromOffset(15, 60)
info.BackgroundTransparency = 1
info.Text = "Loader executado com sucesso!\nGameId: " .. tostring(game.GameId)
info.TextColor3 = Color3.fromRGB(180, 180, 190)
info.TextSize = 15
info.Font = Enum.Font.Gotham
info.TextWrapped = true
info.TextXAlignment = Enum.TextXAlignment.Left
info.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(32, 32)
close.Position = UDim2.new(1, -42, 0, 10)
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 80, 80)
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.Parent = frame

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
