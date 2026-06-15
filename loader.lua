if not game:IsLoaded() then
game.Loaded:Wait()
end

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

local NEW_NAME = "JR"
local NEW_DISCORD = "https://discord.gg/G2gMadWRRx"
local NEW_ICON = "rbxassetid://114656274027180"

print("[JR] Baixando Anime Astral original...")

local ok, err = pcall(function()
local source = game:HttpGet(ORIGINAL_URL)

source = source:gsub("TWVZ", NEW_NAME)
source = source:gsub("twvz", "jr")

source = source:gsub("https://discord.gg/Wk9bHxEuef", NEW_DISCORD)
source = source:gsub("https://discord.gg/jND7mB8T", NEW_DISCORD)
source = source:gsub("https://twvz.click", NEW_DISCORD)

source = source:gsub("rbxassetid://72031513619068", NEW_ICON)
source = source:gsub("72031513619068", "114656274027180")

loadstring(source)()

end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral: " .. tostring(err))
else
print("[JR] Anime Astral carregado com funcoes originais, nome, icon e Discord alterados.")
end
