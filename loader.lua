if not game:IsLoaded() then
game.Loaded:Wait()
end

local ORIGINAL_URL = "https://raw.githubusercontent.com/ZhangJunZ84/twvzyyds/refs/heads/main/animeastral.lua"

print("[JR] Carregando Anime Astral original limpo...")

local ok, err = pcall(function()
loadstring(game:HttpGet(ORIGINAL_URL))()
end)

if not ok then
warn("[JR] Erro ao carregar Anime Astral original: " .. tostring(err))
else
print("[JR] Anime Astral original carregado com sucesso.")
end
