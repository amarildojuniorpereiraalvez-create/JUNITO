if not game:IsLoaded() then
game.Loaded:Wait()
end

local ORIGINAL_ANIME_ASTRAL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local NEW_NAME = "JR"
local NEW_FULL_NAME = "Junioor"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"

local OLD_ICON_ID = "72031513619068"

local oldSetClipboard = setclipboard

if oldSetClipboard then
local function newSetClipboard(text)
text = tostring(text)

```
    if string.find(text, "discord.gg") then
        text = NEW_DISCORD
    end

    return oldSetClipboard(text)
end

pcall(function()
    if getgenv then
        getgenv().setclipboard = newSetClipboard
    else
        setclipboard = newSetClipboard
    end
end)
```

end

local function fixText(text)
if typeof(text) ~= "string" then
return text
end

```
text = string.gsub(text, "TWVZ", NEW_NAME)
text = string.gsub(text, "twvz", string.lower(NEW_NAME))
text = string.gsub(text, "https://discord.gg/Wk9bHxEuef", NEW_DISCORD)
text = string.gsub(text, "https://discord.gg/jND7mB8T", NEW_DISCORD)
text = string.gsub(text, "https://twvz.click", NEW_DISCORD)

return text
```

end

local function fixObject(obj)
pcall(function()
if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
obj.Text = fixText(obj.Text)
end

```
    if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
        local currentImage = tostring(obj.Image)

        if string.find(currentImage, OLD_ICON_ID) then
            obj.Image = NEW_ICON
        end
    end
end)
```

end

local function fixAll()
for _, obj in ipairs(playerGui:GetDescendants()) do
fixObject(obj)
end
end

playerGui.DescendantAdded:Connect(function(obj)
task.wait()
fixObject(obj)
end)

print("[JR] Carregando Anime Astral original...")

local ok, err = pcall(function()
loadstring(game:HttpGet(ORIGINAL_ANIME_ASTRAL))()
end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral original: " .. tostring(err))
return
end

for i = 1, 80 do
fixAll()
task.wait(0.15)
end

print("[JR] Anime Astral carregado com nome, icon e Discord alterados.")
