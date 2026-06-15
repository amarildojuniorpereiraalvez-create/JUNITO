if not game:IsLoaded() then
game.Loaded:Wait()
end

local BASE_URL = "https://raw.githubusercontent.com/amarildojuniorpereiraalvez-create/JUNITO/refs/heads/main"
local SCRIPT_FILE = "animeastral.lua"

local HUB_NAME = "JR"
local FULL_NAME = "Junioor"
local DISCORD_URL = "https://discord.gg/G2gMadWRRx"
local ICON_IMAGE = "rbxassetid://114656274027180"

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local url = BASE_URL .. "/" .. SCRIPT_FILE

print("[" .. HUB_NAME .. "] Tentando carregar:", url)

local ok, err = pcall(function()
local source = game:HttpGet(url)

```
if source:find("404: Not Found") then
    error("Arquivo animeastral.lua não encontrado no GitHub.")
end

local fn, compileErr = loadstring(source)

if not fn then
    error(compileErr)
end

fn()
```

end)

if not ok then
warn("[" .. HUB_NAME .. "] Erro ao carregar " .. SCRIPT_FILE .. ": " .. tostring(err))

````
local playerGui = player:WaitForChild("PlayerGui")

local oldGui = playerGui:FindFirstChild("JR_Loader_Error")
if oldGui then
    oldGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "JR_Loader_Error"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(430, 230)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(70, 70, 95)
stroke.Thickness = 1
stroke.Parent = frame

local icon = Instance.new("ImageLabel")
icon.Size = UDim2.fromOffset(45, 45)
icon.Position = UDim2.fromOffset(20, 20)
icon.BackgroundTransparency = 1
icon.Image = ICON_IMAGE
icon.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -85, 0, 45)
title.Position = UDim2.fromOffset(75, 20)
title.BackgroundTransparency = 1
title.Text = FULL_NAME .. " Loader"
title.TextColor3 = Color3.fromRGB(255, 90, 90)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local body = Instance.new("TextLabel")
body.Size = UDim2.new(1, -40, 0, 85)
body.Position = UDim2.fromOffset(20, 78)
body.BackgroundTransparency = 1
body.Text = "Erro ao carregar o Anime Astral.\nConfira se o arquivo animeastral.lua existe e se não tem ``` dentro dele.\nDiscord: " .. DISCORD_URL
body.TextColor3 = Color3.fromRGB(190, 190, 205)
body.TextSize = 14
body.Font = Enum.Font.Gotham
body.TextXAlignment = Enum.TextXAlignment.Left
body.TextWrapped = true
body.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -45, 0, 10)
close.BackgroundTransparency = 1
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 90, 90)
close.TextSize = 18
close.Font = Enum.Font.GothamBold
close.Parent = frame

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
````

else
print("[" .. HUB_NAME .. "] Loader executado com sucesso.")
end
