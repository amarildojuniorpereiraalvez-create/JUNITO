if not game() then
game.Loaded()
end

local Players = game("Players")
local player = Players.LocalPlayer
local playerGui = player("PlayerGui")

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local NEW_SHORT_NAME = "JR"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"

local OLD_DISCORD_1 = "https://discord.gg/Wk9bHxEuef"
local OLD_DISCORD_2 = "https://discord.gg/jND7mB8T"
local OLD_ICON_ID = "72031513619068"

local function replaceText(text)
if typeof(text) ~= "string" then
return text
end

text = text:gsub("TWVZ", NEW_SHORT_NAME)
text = text:gsub("twvz", string.lower(NEW_SHORT_NAME))
text = text:gsub(OLD_DISCORD_1, NEW_DISCORD)
text = text:gsub(OLD_DISCORD_2, NEW_DISCORD)
text = text:gsub("https://twvz.click", NEW_DISCORD)

return text

end

local function patchObject(obj)
pcall(function()
if obj("TextLabel") or obj("TextButton") or obj("TextBox") then
obj.Text = replaceText(obj.Text)
end

    if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
        local img = tostring(obj.Image)

        if img:find(OLD_ICON_ID) then
            obj.Image = NEW_ICON
        end
    end
end)

end

local function patchAll()
for _, obj in ipairs(playerGui()) do
patchObject(obj)
end
end

playerGui.DescendantAdded(function(obj)
task.wait()
patchObject(obj)
end)

local realSetClipboard = setclipboard

if realSetClipboard then
local function fixedSetClipboard(text)
text = tostring(text)

    if text:find("discord.gg") or text:find("twvz.click") then
        text = NEW_DISCORD
    end

    return realSetClipboard(text)
end

pcall(function()
    if getgenv then
        getgenv().setclipboard = fixedSetClipboard
    else
        setclipboard = fixedSetClipboard
    end
end)

end

print("[JR] Carregando Anime Astral original...")

local ok, err = pcall(function()
local source = game(ORIGINAL_URL)

if source:find("404: Not Found") then
    error("animeastral.lua original nao encontrado.")
end

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

task.wait(0.5)
patchAll()

task.wait(1)
patchAll()

task.wait(2)
patchAll()

print("[JR] Anime Astral original carregado com nome, icon e Discord alterados.")
