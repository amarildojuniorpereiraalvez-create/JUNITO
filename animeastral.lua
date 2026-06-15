```lua
if not game:IsLoaded() then
    game.Loaded:Wait()
end

if _G.JR_ANIME_ASTRAL_LOADED then
    return
end

_G.JR_ANIME_ASTRAL_LOADED = true

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local HUB_NAME = "JR"
local FULL_NAME = "Junioor"
local DISCORD_URL = "https://discord.gg/G2gMadWRRx"
local ICON_IMAGE = "rbxassetid://114656274027180"

local oldGui = playerGui:FindFirstChild("Junioor_Astral_Hub")
if oldGui then
    oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "Junioor_Astral_Hub"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local floatingIcon = Instance.new("ImageButton")
floatingIcon.Name = "JR_FloatingIcon"
floatingIcon.Size = UDim2.fromOffset(58, 58)
floatingIcon.Position = UDim2.fromOffset(95, 38)
floatingIcon.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
floatingIcon.BorderSizePixel = 0
floatingIcon.Image = ICON_IMAGE
floatingIcon.Parent = gui

local floatingCorner = Instance.new("UICorner")
floatingCorner.CornerRadius = UDim.new(0, 10)
floatingCorner.Parent = floatingIcon

local floatingStroke = Instance.new("UIStroke")
floatingStroke.Color = Color3.fromRGB(0, 170, 255)
floatingStroke.Thickness = 2
floatingStroke.Parent = floatingIcon

local floatingText = Instance.new("TextLabel")
floatingText.Size = UDim2.new(1, 0, 1, 0)
floatingText.BackgroundTransparency = 1
floatingText.Text = HUB_NAME
floatingText.TextColor3 = Color3.fromRGB(255, 255, 255)
floatingText.TextSize = 22
floatingText.Font = Enum.Font.GothamBlack
floatingText.Parent = floatingIcon

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(500, 370)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(24, 25, 32)
main.BackgroundTransparency = 0.08
main.BorderSizePixel = 0
main.Visible = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(60, 70, 90)
mainStroke.Thickness = 1
mainStroke.Parent = main

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 45)
topBar.BackgroundColor3 = Color3.fromRGB(30, 31, 40)
topBar.BackgroundTransparency = 0.1
topBar.BorderSizePixel = 0
topBar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 10)
topCorner.Parent = topBar

local title = Instance.new("TextLabel")
title.Size = UDim2.fromOffset(160, 45)
title.Position = UDim2.fromOffset(16, 0)
title.BackgroundTransparency = 1
title.Text = "Anime Astral"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 17
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local version = Instance.new("TextLabel")
version.Size = UDim2.fromOffset(75, 26)
version.Position = UDim2.fromOffset(175, 10)
version.BackgroundColor3 = Color3.fromRGB(130, 235, 155)
version.Text = "v0.0.9"
version.TextColor3 = Color3.fromRGB(15, 20, 25)
version.TextSize = 13
version.Font = Enum.Font.GothamBold
version.Parent = topBar

local versionCorner = Instance.new("UICorner")
versionCorner.CornerRadius = UDim.new(0, 8)
versionCorner.Parent = version

local brandBox = Instance.new("Frame")
brandBox.Size = UDim2.fromOffset(95, 26)
brandBox.Position = UDim2.fromOffset(258, 10)
brandBox.BackgroundColor3 = Color3.fromRGB(20, 100, 145)
brandBox.BorderSizePixel = 0
brandBox.Parent = topBar

local brandCorner = Instance.new("UICorner")
brandCorner.CornerRadius = UDim.new(0, 7)
brandCorner.Parent = brandBox

local brandIcon = Instance.new("ImageLabel")
brandIcon.Size = UDim2.fromOffset(20, 20)
brandIcon.Position = UDim2.fromOffset(5, 3)
brandIcon.BackgroundTransparency = 1
brandIcon.Image = ICON_IMAGE
brandIcon.Parent = brandBox

local brandText = Instance.new("TextLabel")
brandText.Size = UDim2.new(1, -30, 1, 0)
brandText.Position = UDim2.fromOffset(28, 0)
brandText.BackgroundTransparency = 1
brandText.Text = HUB_NAME
brandText.TextColor3 = Color3.fromRGB(0, 200, 255)
brandText.TextSize = 13
brandText.Font = Enum.Font.GothamBold
brandText.TextXAlignment = Enum.TextXAlignment.Left
brandText.Parent = brandBox

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(35, 35)
minimize.Position = UDim2.new(1, -100, 0, 5)
minimize.BackgroundTransparency = 1
minimize.Text = "-"
minimize.TextColor3 = Color3.fromRGB(200, 200, 210)
minimize.TextSize = 22
minimize.Font = Enum.Font.GothamBold
minimize.Parent = topBar

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -45, 0, 5)
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 90, 90)
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.Parent = topBar

close.MouseButton1Click:Connect(function()
    gui:Destroy()
    _G.JR_ANIME_ASTRAL_LOADED = false
end)

minimize.MouseButton1Click:Connect(function()
    main.Visible = false
end)

floatingIcon.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.fromOffset(150, 325)
sidebar.Position = UDim2.fromOffset(0, 45)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 21, 28)
sidebar.BackgroundTransparency = 0.2
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local function sideButton(text, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.fromOffset(130, 38)
    btn.Position = UDim2.fromOffset(10, y)
    btn.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
    btn.BackgroundTransparency = 0.15
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(235, 235, 240)
    btn.TextSize = 14
    btn.Font = Enum.Font.Gotham
    btn.Parent = sidebar

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn

    return btn
end

sideButton("Updates", 20)
sideButton("Main", 65)
sideButton("Gamemodes", 110)
sideButton("Misc", 155)
sideButton("Settings", 200)

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -165, 1, -60)
content.Position = UDim2.fromOffset(158, 55)
content.BackgroundTransparency = 1
content.Parent = main

local update1 = Instance.new("TextLabel")
update1.Size = UDim2.new(1, -10, 0, 95)
update1.Position = UDim2.fromOffset(0, 0)
update1.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
update1.BackgroundTransparency = 0.1
update1.Text = "Version v0.0.9\n[Main] Branding changed to " .. FULL_NAME .. "\n[Main] Discord updated\n[Main] JR icon configured"
update1.TextColor3 = Color3.fromRGB(220, 220, 230)
update1.TextSize = 14
update1.Font = Enum.Font.Gotham
update1.TextXAlignment = Enum.TextXAlignment.Left
update1.TextYAlignment = Enum.TextYAlignment.Top
update1.TextWrapped = true
update1.Parent = content

local u1c = Instance.new("UICorner")
u1c.CornerRadius = UDim.new(0, 8)
u1c.Parent = update1

local discordBtn = Instance.new("TextButton")
discordBtn.Size = UDim2.new(1, -10, 0, 42)
discordBtn.Position = UDim2.fromOffset(0, 110)
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.BorderSizePixel = 0
discordBtn.Text = "Discord " .. FULL_NAME
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.TextSize = 15
discordBtn.Font = Enum.Font.GothamBold
discordBtn.Parent = content

local dc = Instance.new("UICorner")
dc.CornerRadius = UDim.new(0, 8)
dc.Parent = discordBtn

discordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_URL)
        discordBtn.Text = "Discord copiado!"
    else
        discordBtn.Text = DISCORD_URL
    end

    task.wait(2)
    discordBtn.Text = "Discord " .. FULL_NAME
end)

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -10, 0, 100)
info.Position = UDim2.fromOffset(0, 165)
info.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
info.BackgroundTransparency = 0.1
info.Text = "Brand: " .. FULL_NAME .. "\nShort name: " .. HUB_NAME .. "\nDiscord: " .. DISCORD_URL .. "\nGameId: " .. tostring(game.GameId)
info.TextColor3 = Color3.fromRGB(190, 190, 205)
info.TextSize = 13
info.Font = Enum.Font.Gotham
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top
info.TextWrapped = true
info.Parent = content

local ic = Instance.new("UICorner")
ic.CornerRadius = UDim.new(0, 8)
ic.Parent = info

local dragging = false
local dragStart
local startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

topBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

print("[JR] Anime Astral visual loaded.")
```
