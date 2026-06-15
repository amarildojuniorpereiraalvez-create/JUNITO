if not game() then
game.Loaded()
end

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local Players = game("Players")
local CoreGui = game("CoreGui")

local player = Players.LocalPlayer
local playerGui = player("PlayerGui")

local NEW_NAME = "JR"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"

local OLD_ICON_ID = "72031513619068"

local before = {}

local function markBefore(container)
for _, child in ipairs(container()) do
if child("ScreenGui") then
before[child] = true
end
end
end

markBefore(playerGui)
markBefore(CoreGui)

local function isNewGuiObject(obj)
local current = obj

while current do
    if current:IsA("ScreenGui") then
        return before[current] ~= true
    end

    if current == playerGui or current == CoreGui then
        break
    end

    current = current.Parent
end

return false

end

local function fixText(text)
if typeof(text) ~= "string" then
return text
end

text = text:gsub("TWVZ", NEW_NAME)
text = text:gsub("twvz", "jr")
text = text:gsub("T W V Z", NEW_NAME)

text = text:gsub("https://discord.gg/Wk9bHxEuef", NEW_DISCORD)
text = text:gsub("https://discord.gg/jND7mB8T", NEW_DISCORD)
text = text:gsub("https://twvz.click", NEW_DISCORD)

return text

end

local fixedButtons = {}

local function fixDiscordButton(obj)
if not obj("TextButton") then
return
end

if fixedButtons[obj] then
    return
end

local text = string.lower(tostring(obj.Text))

if text:find("discord") or text:find("server") or text:find("invite") then
    fixedButtons[obj] = true

    obj.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(NEW_DISCORD)
        end

        obj.Text = "Discord copiado!"
        task.wait(1.5)
        obj.Text = fixText(obj.Text)
    end)
end

end

local function fixImage(obj)
if not (obj("ImageLabel") or obj("ImageButton")) then
return
end

local img = tostring(obj.Image)
local name = string.lower(obj.Name)

if img:find(OLD_ICON_ID) then
    obj.Image = NEW_ICON
    return
end

if name:find("logo") or name:find("icon") or name:find("brand") or name:find("open") then
    obj.Image = NEW_ICON
    return
end

local x = obj.Size.X.Offset
local y = obj.Size.Y.Offset

if x >= 25 and x <= 90 and y >= 25 and y <= 90 then
    obj.Image = NEW_ICON
end

end

local function fixObject(obj)
if not isNewGuiObject(obj) then
return
end

pcall(function()
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        obj.Text = fixText(obj.Text)
    end

    fixImage(obj)
    fixDiscordButton(obj)
end)

end

local function fixContainer(container)
for _, obj in ipairs(container()) do
fixObject(obj)
end
end

local function fixAll()
fixContainer(playerGui)
fixContainer(CoreGui)
end

playerGui.DescendantAdded(function(obj)
task.wait()
fixObject(obj)
end)

CoreGui.DescendantAdded(function(obj)
task.wait()
fixObject(obj)
end)

local originalSetClipboard = setclipboard

if originalSetClipboard then
local function newSetClipboard(text)
text = tostring(text)

    if text:lower():find("discord") or text:lower():find("twvz") or text:lower():find("invite") then
        text = NEW_DISCORD
    end

    return originalSetClipboard(text)
end

pcall(function()
    if getgenv then
        getgenv().setclipboard = newSetClipboard
    else
        setclipboard = newSetClipboard
    end
end)

end

print("[JR] Carregando Anime Astral original sem alterar codigo interno...")

local ok, err = pcall(function()
loadstring(game(ORIGINAL_URL))()
end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral original: " .. tostring(err))
return
end

for i = 1, 200 do
fixAll()
task.wait(0.1)
end

print("[JR] Anime Astral carregado com funcoes originais, nome, icon e Discord alterados.")
