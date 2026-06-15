```lua
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- PUXA DO SEU GITHUB, NÃO DO TWVZ ORIGINAL
local BASE_URL = "https://raw.githubusercontent.com/amarildojuniorpereiraalvez-create/JUNITO/refs/heads/main"

local GAMES = {
    [9797806474] = "animeastral.lua",
}

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local HUB_NAME = "Junioor"
local DISCORD_URL = "https://discord.gg/G2gMadWRRx"

local gameId = game.GameId
local scriptFile = GAMES[gameId]

if not scriptFile then
    warn("[" .. HUB_NAME .. "] Unsupported game (GameId: " .. tostring(gameId) .. ")")

    local gui = Instance.new("ScreenGui")
    gui.Name = "Junioor_LoaderBlock"
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

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.fromOffset(20, 22)
    title.BackgroundTransparency = 1
    title.Text = "Game Not Supported"
    title.TextColor3 = Color3.fromRGB(255, 80, 80)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = container

    local body = Instance.new("TextLabel")
    body.Size = UDim2.new(1, -40, 0, 70)
    body.Position = UDim2.fromOffset(20, 72)
    body.BackgroundTransparency = 1
    body.Text = HUB_NAME .. " ainda não tem suporte para este jogo.\nDiscord: " .. DISCORD_URL
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
    closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = container

    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -40, 0, 42)
    btn.Position = UDim2.new(0, 20, 1, -62)
    btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    btn.BorderSizePixel = 0
    btn.Text = "Copiar Discord"
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
            btn.Text = "Discord copiado!"
        else
            btn.Text = "Clipboard indisponível"
        end
    end)

    return
end

local url = BASE_URL .. "/" .. scriptFile

print("[" .. HUB_NAME .. "] Carregando:", url)

local ok, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not ok then
    warn("[" .. HUB_NAME .. "] Failed to load " .. scriptFile .. ": " .. tostring(err))
end
```
