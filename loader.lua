if not game:IsLoaded() then
game.Loaded:Wait()
end

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local NEW_NAME = "JR"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"
local NEW_ICON_ID = "114656274027180"

local OLD_ICON_ID = "72031513619068"

local beforeGuis = {}

for _, child in ipairs(playerGui:GetChildren()) do
if child:IsA("ScreenGui") then
beforeGuis[child] = true
end
end

local function fixText(text)
if typeof(text) ~= "string" then
return text
end

text = text:gsub("TWVZ", NEW_NAME)
text = text:gsub("twvz", "jr")

text = text:gsub("https://discord%.gg/[%w%-%_]+", NEW_DISCORD)
text = text:gsub("http://discord%.gg/[%w%-%_]+", NEW_DISCORD)
text = text:gsub("discord%.gg/[%w%-%_]+", "discord.gg/G2gMadWRRx")
text = text:gsub("https://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)
text = text:gsub("http://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)
text = text:gsub("https://twvz%.click", NEW_DISCORD)
text = text:gsub("http://twvz%.click", NEW_DISCORD)

return text

end

local function isNewScriptGui(obj)
local current = obj

while current and current ~= playerGui do
    if current:IsA("ScreenGui") then
        return beforeGuis[current] ~= true
    end

    current = current.Parent
end

return false
    
end

local function shouldReplaceImage(obj)
if not isNewScriptGui(obj) then
return false
end

if not (obj:IsA("ImageLabel") or obj:IsA("ImageButton")) then
    return false
end

local img = tostring(obj.Image)
local name = string.lower(obj.Name)

if img:find(OLD_ICON_ID) then
    return true
end

if name:find("logo") or name:find("icon") or name:find("brand") or name:find("open") then
    return true
end

local x = obj.Size.X.Offset
local y = obj.Size.Y.Offset

if x >= 18 and x <= 95 and y >= 18 and y <= 95 then
    return true
end

return false

end

local discordButtons = {}

local function forceDiscordButton(obj)
if not isNewScriptGui(obj) then
return
end

if not obj:IsA("TextButton") then
    return
end

local txt = string.lower(tostring(obj.Text))

if txt:find("discord") or txt:find("server") or txt:find("invite") then
    if discordButtons[obj] then
        return
    end

    discordButtons[obj] = true

    obj.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(NEW_DISCORD)
            obj.Text = "Discord copiado!"
            task.wait(1.5)
            obj.Text = fixText(obj.Text)
        end
    end)
end
    
end

local function fixObject(obj)
pcall(function()
if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
obj.Text = fixText(obj.Text)
end

    if shouldReplaceImage(obj) then
        obj.Image = NEW_ICON
    end

    forceDiscordButton(obj)
end)

end

local function fixAll()
for _, obj in ipairs(playerGui:GetDescendants()) do
fixObject(obj)
end
end

local originalSetClipboard = setclipboard
local originalToClipboard = toclipboard
local originalSetClipboardAlt = set_clipboard

local function forceClipboard(text)
text = tostring(text)

if text:find("discord") or text:find("twvz") or text:find("invite") then
    text = NEW_DISCORD
end

if originalSetClipboard then
    return originalSetClipboard(text)
end

if originalToClipboard then
    return originalToClipboard(text)
end

if originalSetClipboardAlt then
    return originalSetClipboardAlt(text)
end

end

pcall(function()
if getgenv then
getgenv().setclipboard = forceClipboard
getgenv().toclipboard = forceClipboard
getgenv().set_clipboard = forceClipboard
else
setclipboard = forceClipboard
toclipboard = forceClipboard
set_clipboard = forceClipboard
end
end)

playerGui.DescendantAdded:Connect(function(obj)
task.wait()
fixObject(obj)
end)

print("[JR] Baixando Anime Astral original...")

local ok, err = pcall(function()
local source = game:HttpGet(ORIGINAL_URL)

source = source:gsub("TWVZ", NEW_NAME)
source = source:gsub("twvz", "jr")

source = source:gsub("https://discord%.gg/[%w%-%_]+", NEW_DISCORD)
source = source:gsub("http://discord%.gg/[%w%-%_]+", NEW_DISCORD)
source = source:gsub("discord%.gg/[%w%-%_]+", "discord.gg/G2gMadWRRx")
source = source:gsub("https://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)
source = source:gsub("http://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)
source = source:gsub("https://twvz%.click", NEW_DISCORD)
source = source:gsub("http://twvz%.click", NEW_DISCORD)

source = source:gsub("rbxassetid://" .. OLD_ICON_ID, NEW_ICON)
source = source:gsub(OLD_ICON_ID, NEW_ICON_ID)

local fn, compileErr = loadstring(source)

if not fn then
    error(compileErr)
end

fn()

end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral: " .. tostring(err))
return
end

for i = 1, 250 do
fixAll()
task.wait(0.1)
end

print("[JR] Anime Astral carregado com funcoes originais, nome, icon e Discord alterados.")
