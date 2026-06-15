print("[JR] Loader iniciou")

if not game.IsLoaded(game) then
game.Loaded.Wait(game.Loaded)
end

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local Players = game.GetService(game, "Players")
local CoreGui = game.GetService(game, "CoreGui")

local player = Players.LocalPlayer
local playerGui = player.WaitForChild(player, "PlayerGui")

local NEW_NAME = "JR"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"

local OLD_ICON_ID = "72031513619068"

local beforeGuis = {}

local function getChildren(obj)
local ok, result = pcall(function()
return obj.GetChildren(obj)
end)

if ok and result then
    return result
end

return {}

end

local function getDescendants(obj)
local ok, result = pcall(function()
return obj.GetDescendants(obj)
end)

if ok and result then
    return result
end

return {}

end

local function isA(obj, className)
local ok, result = pcall(function()
return obj.IsA(obj, className)
end)

return ok and result

end

local function markBefore(container)
for _, child in ipairs(getChildren(container)) do
if isA(child, "ScreenGui") then
beforeGuis[child] = true
end
end
end

markBefore(playerGui)
markBefore(CoreGui)

local function isFromNewMenu(obj)
local current = obj

while current do
    if isA(current, "ScreenGui") then
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

text = string.gsub(text, "TWVZ", NEW_NAME)
text = string.gsub(text, "twvz", "jr")
text = string.gsub(text, "T W V Z", NEW_NAME)

text = string.gsub(text, "https://discord%.gg/[%w%-%_]+", NEW_DISCORD)
text = string.gsub(text, "http://discord%.gg/[%w%-%_]+", NEW_DISCORD)
text = string.gsub(text, "discord%.gg/[%w%-%_]+", "discord.gg/G2gMadWRRx")

text = string.gsub(text, "https://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)
text = string.gsub(text, "http://discord%.com/invite/[%w%-%_]+", NEW_DISCORD)

text = string.gsub(text, "https://twvz%.click", NEW_DISCORD)
text = string.gsub(text, "http://twvz%.click", NEW_DISCORD)

return text

end

local fixedButtons = {}

local function fixDiscordButton(obj)
if not isA(obj, "TextButton") then
return
end

if fixedButtons[obj] then
    return
end

local lowerText = string.lower(tostring(obj.Text))

if string.find(lowerText, "discord") or string.find(lowerText, "server") or string.find(lowerText, "invite") then
    fixedButtons[obj] = true

    obj.MouseButton1Click.Connect(obj.MouseButton1Click, function()
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
if not (isA(obj, "ImageLabel") or isA(obj, "ImageButton")) then
return
end

local img = tostring(obj.Image)
local name = string.lower(tostring(obj.Name))

if string.find(img, OLD_ICON_ID) then
    obj.Image = NEW_ICON
    return
end

if string.find(name, "logo") or string.find(name, "icon") or string.find(name, "brand") or string.find(name, "open") then
    obj.Image = NEW_ICON
    return
end

end

local function fixObject(obj)
if not isFromNewMenu(obj) then
return
end

pcall(function()
    if isA(obj, "TextLabel") or isA(obj, "TextButton") or isA(obj, "TextBox") then
        obj.Text = fixText(obj.Text)
    end

    fixImage(obj)
    fixDiscordButton(obj)
end)

end

local function fixContainer(container)
for _, obj in ipairs(getDescendants(container)) do
fixObject(obj)
end
end

local function fixAll()
fixContainer(playerGui)
fixContainer(CoreGui)
end

playerGui.DescendantAdded.Connect(playerGui.DescendantAdded, function(obj)
task.wait()
fixObject(obj)
end)

CoreGui.DescendantAdded.Connect(CoreGui.DescendantAdded, function(obj)
task.wait()
fixObject(obj)
end)

local originalSetClipboard = setclipboard

if originalSetClipboard then
local function forcedSetClipboard(text)
text = tostring(text)

    local lowerText = string.lower(text)

    if string.find(lowerText, "discord") or string.find(lowerText, "twvz") or string.find(lowerText, "invite") then
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
local source = game.HttpGet(game, ORIGINAL_URL)

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
