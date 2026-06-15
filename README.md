if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main"

local GAMES = {
    [9186719164]  = "sailorpiece.lua",
    [6718454990]  = "animeghost.lua",
    [10032271327] = "worldfighters.lua",
    [9792947201] = "slimerng.lua",
    [7395930870] = "selllemons.lua",
    [9797806474] = "animeastral.lua",
}

local gameId = game.GameId
local scriptFile = GAMES[gameId]
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local DISCORD_URL = "https://discord.gg/Wk9bHxEuef"

if not scriptFile then
    warn("[TWVZ] Unsupported game (GameId: " .. tostring(gameId) .. ")")

    local gui = Instance.new("ScreenGui")
    gui.Name = "LoaderBlock"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true
    gui.Parent = player:WaitForChild("PlayerGui")

    local container = Instance.new("Frame")
    container.Size = UDim2.fromOffset(420, 220)
    container.Position = UDim2.fromScale(0.5, 0.5)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    container.BorderSizePixel = 0
    container.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 80)
    stroke.Thickness = 1
    stroke.Parent = container

    local logo = Instance.new("ImageLabel")
    logo.Size = UDim2.fromOffset(40, 40)
    logo.Position = UDim2.fromOffset(20, 22)
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://72031513619068"
    logo.Parent = container

    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0, 8)
    logoCorner.Parent = logo

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -76, 0, 40)
    title.Position = UDim2.fromOffset(70, 22)
    title.BackgroundTransparency = 1
    title.Text = "Game Not Supported"
    title.TextColor3 = Color3.fromRGB(255, 80, 80)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = container

    local body = Instance.new("TextLabel")
    body.Size = UDim2.new(1, -40, 0, 60)
    body.Position = UDim2.fromOffset(20, 72)
    body.BackgroundTransparency = 1
    body.Text = "TWVZ does not have a script for this game yet, but you can join the discord and suggest it!"
    body.TextColor3 = Color3.fromRGB(180, 180, 190)
    body.TextSize = 15
    body.Font = Enum.Font.Gotham
    body.TextXAlignment = Enum.TextXAlignment.Left
    body.TextWrapped = true
    body.Parent = container

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.fromOffset(32, 32)
    closeBtn.Position = UDim2.new(1, -42, 0, 10)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(120, 120, 140)
    closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = container

    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    closeBtn.MouseEnter:Connect(function()
        closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    end)

    closeBtn.MouseLeave:Connect(function()
        closeBtn.TextColor3 = Color3.fromRGB(120, 120, 140)
    end)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -40, 0, 42)
    btn.Position = UDim2.new(0, 20, 1, -62)
    btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    btn.BorderSizePixel = 0
    btn.Text = "Copy Discord Server Link"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    btn.Font = Enum.Font.GothamBold
    btn.Parent = container

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(DISCORD_URL)
        end

        local notif = Instance.new("Frame")
        notif.Size = UDim2.new(1, -40, 0, 36)
        notif.Position = UDim2.new(0, 20, 0, btn.Position.Y.Offset + 48)
        notif.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        notif.BorderSizePixel = 0
        notif.Parent = container

        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0, 8)
        notifCorner.Parent = notif

        local notifStroke = Instance.new("UIStroke")
        notifStroke.Color = Color3.fromRGB(60, 60, 80)
        notifStroke.Thickness = 1
        notifStroke.Parent = notif

        local notifText = Instance.new("TextLabel")
        notifText.Size = UDim2.new(1, -20, 1, 0)
        notifText.Position = UDim2.fromOffset(10, 0)
        notifText.BackgroundTransparency = 1
        notifText.Text = setclipboard and "Discord link copied to clipboard!" or "Clipboard not available"
        notifText.TextColor3 = Color3.fromRGB(180, 180, 190)
        notifText.TextSize = 14
        notifText.Font = Enum.Font.Gotham
        notifText.TextXAlignment = Enum.TextXAlignment.Center
        notifText.Parent = notif

        task.delay(2, function()
            local tween = game:GetService("TweenService"):Create(notif, TweenInfo.new(0.4), {BackgroundTransparency = 1})
            game:GetService("TweenService"):Create(notifText, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
            tween:Play()
            tween.Completed:Wait()
            notif:Destroy()
        end)
    end)

    return
end

local url = BASE_URL .. "/" .. scriptFile
local ok, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not ok then
    warn("[TWVZ] Failed to load " .. scriptFile .. ": " .. tostring(err))
end
