print("[JR] Loader iniciou")

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local Players = game("Players")
local CoreGui = game("CoreGui")

local player = Players.LocalPlayer
local playerGui = player("PlayerGui")

local NEW_NAME = "JR"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"

local OLD_ICON_ID = "72031513619068"

local beforeGuis = {}

local function markBefore(container)
pcall(function()
for _, child in ipairs(container()) do
if child("ScreenGui") then
beforeGuis[child] = true
end
end
end)
end

markBefore(playerGui)
markBefore(CoreGui)

local function isFromNewMenu(obj)
local current = obj

while current do
    if current:IsA("ScreenGui") then
        return beforeGuis[current] ~= true
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

text = text:gsub("https://discord%.gg/[%w%-%_]+", NEW_DISCORD)
text = text:gsub("http://discord%.gg/[%w%-%_]+", NEW_DISCORD)
text = text:gsub("discord%.gg/[%w%-%_]+", "discord.gg/G2gMadWRRx")

text = text:gsub("https://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)
text = text:gsub("http://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)

text = text:gsub("https://twvz%.click", NEW_DISCORD)
text = text:gsub("http://twvz%.click", NEW_DISCORD)

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

local lowerText = string.lower(tostring(obj.Text))

if lowerText:find("discord") or lowerText:find("server") or lowerText:find("invite") then
    fixedButtons[obj] = true

    obj.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(NEW_DISCORD)
        end

        local oldText = obj.Text
        obj.Text = "Discord copiado!"

        task.wait(1.5)

        if obj and obj.Parent then
            obj.Text = fixText(oldText)
        end
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

if x >= 25 and x <= 95 and y >= 25 and y <= 95 then
    obj.Image = NEW_ICON
end

end

local function fixObject(obj)
if not isFromNewMenu(obj) then
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
pcall(function()
for _, obj in ipairs(container()) do
fixObject(obj)
end
end)
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
local function forcedSetClipboard(text)
text = tostring(text)

    local lowerText = string.lower(text)

    if lowerText:find("discord") or lowerText:find("twvz") or lowerText:find("invite") then
        text = NEW_DISCORD
    end

    return originalSetClipboard(text)
end

pcall(function()
    if getgenv then
        getgenv().setclipboard = forcedSetClipboard
    else
        setclipboard = forcedSetClipboard
    end
end)

end

print("[JR] Carregando Anime Astral original...")

local ok, err = pcall(function()
local source = game(ORIGINAL_URL)

local fn, compileErr = loadstring(source)

if not fn then
    error(compileErr)
end

fn()

end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral original: " .. tostring(err))
return
end

task.spawn(function()
for i = 1, 300 do
fixAll()
task.wait(0.1)
end
end)

print("[JR] Anime Astral carregado. Aplicando nome, icon e Discord.")
