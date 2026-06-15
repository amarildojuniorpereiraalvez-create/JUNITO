if not game() then
game.Loaded()
end

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local Players = game("Players")
local player = Players.LocalPlayer
local playerGui = player("PlayerGui")

local NEW_NAME = "JR"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"

local OLD_ICON_ID = "72031513619068"

local originalSetClipboard = setclipboard

if originalSetClipboard then
local function fixedClipboard(text)
text = tostring(text)

    if text:lower():find("discord") or text:lower():find("twvz") or text:lower():find("invite") then
        text = NEW_DISCORD
    end

    return originalSetClipboard(text)
end

pcall(function()
    if getgenv then
        getgenv().setclipboard = fixedClipboard
    else
        setclipboard = fixedClipboard
    end
end)

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

local function isAnimeAstralGui(screenGui)
if not screenGui("ScreenGui") then
return false
end

local foundAnime = false
local foundMenu = false

for _, obj in ipairs(screenGui:GetDescendants()) do
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        local txt = tostring(obj.Text)

        if txt:find("Anime Astral") then
            foundAnime = true
        end

        if txt == "Updates" or txt == "Main" or txt == "Gamemodes" or txt == "Misc" or txt == "Settings" then
            foundMenu = true
        end
    end
end

return foundAnime or foundMenu

end

local fixedButtons = {}

local function fixDiscordButton(obj)
if not obj("TextButton") then
return
end

if fixedButtons[obj] then
    return
end

local txt = string.lower(tostring(obj.Text))

if txt:find("discord") or txt:find("server") or txt:find("invite") then
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
local name = string.lower(tostring(obj.Name))

if img:find(OLD_ICON_ID) then
    obj.Image = NEW_ICON
    return
end

if name:find("logo") or name:find("icon") or name:find("brand") then
    obj.Image = NEW_ICON
    return
end

end

local function fixObject(obj)
pcall(function()
if obj("TextLabel") or obj("TextButton") or obj("TextBox") then
obj.Text = fixText(obj.Text)
end

    fixImage(obj)
    fixDiscordButton(obj)
end)

end

local function patchGui(screenGui)
if not isAnimeAstralGui(screenGui) then
return
end

for _, obj in ipairs(screenGui:GetDescendants()) do
    fixObject(obj)
end

screenGui.DescendantAdded:Connect(function(obj)
    task.wait()
    fixObject(obj)
end)

end

local function patchAllAnimeGuis()
for _, child in ipairs(playerGui()) do
if child("ScreenGui") then
patchGui(child)
end
end
end

playerGui.ChildAdded(function(child)
task.wait(0.3)

if child:IsA("ScreenGui") then
    patchGui(child)
end

end)

print("[JR] Carregando Anime Astral original...")

local ok, err = pcall(function()
loadstring(game(ORIGINAL_URL))()
end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral original: " .. tostring(err))
return
end

task.wait(0.5)
patchAllAnimeGuis()

task.wait(1)
patchAllAnimeGuis()

task.wait(2)
patchAllAnimeGuis()

print("[JR] Anime Astral carregado com funcoes originais, nome, icon e Discord alterados.")
