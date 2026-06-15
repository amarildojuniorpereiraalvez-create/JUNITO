if not game:IsLoaded() then
game.Loaded:Wait()
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local OLD_NAME = "TWVZ"
local NEW_NAME = "JR"

local OLD_FULL_NAME = "TWVZ"
local NEW_FULL_NAME = "Junioor"

local OLD_DISCORD_1 = "https://discord.gg/Wk9bHxEuef"
local OLD_DISCORD_2 = "https://discord.gg/jND7mB8T"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"

local OLD_ICON_1 = "rbxassetid://72031513619068"
local OLD_ICON_2 = "72031513619068"
local NEW_ICON = "rbxassetid://114656274027180"

local realSetClipboard = setclipboard

if realSetClipboard then
local function fixedClipboard(text)
text = tostring(text)

```
    if text == OLD_DISCORD_1 or text == OLD_DISCORD_2 or text:find("discord.gg") then
        text = NEW_DISCORD
    end

    return realSetClipboard(text)
end

pcall(function()
    if getgenv then
        getgenv().setclipboard = fixedClipboard
    else
        setclipboard = fixedClipboard
    end
end)
```

end

local function replaceText(text)
if typeof(text) ~= "string" then
return text
end

```
text = text:gsub(OLD_NAME, NEW_NAME)
text = text:gsub(OLD_FULL_NAME, NEW_FULL_NAME)
text = text:gsub(OLD_DISCORD_1, NEW_DISCORD)
text = text:gsub(OLD_DISCORD_2, NEW_DISCORD)

return text
```

end

local function patchObject(obj)
pcall(function()
if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
obj.Text = replaceText(obj.Text)
end

```
    if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
        local img = tostring(obj.Image)

        if img == OLD_ICON_1 or img:find(OLD_ICON_2) then
            obj.Image = NEW_ICON
        end
    end
end)
```

end

local function patchAll()
for _, obj in ipairs(playerGui:GetDescendants()) do
patchObject(obj)
end
end

local connection
connection = playerGui.DescendantAdded:Connect(function(obj)
task.wait()
patchObject(obj)
end)

local ok, err = pcall(function()
loadstring(game:HttpGet(ORIGINAL_URL))()
end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral original: " .. tostring(err))
return
end

for i = 1, 40 do
patchAll()
task.wait(0.25)
end

print("[JR] Anime Astral carregado com funções originais e visual alterado.")
