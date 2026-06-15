if not game() then
game.Loaded()
end

local BASE_URL = "https://raw.githubusercontent.com/amarildojuniorpereiraalvez-create/JUNITO/refs/heads/main"
local SCRIPT_FILE = "animeastral.lua"

local url = BASE_URL .. "/" .. SCRIPT_FILE

print("[JR] Carregando:", url)

local ok, err = pcall(function()
loadstring(game(url))()
end)

if not ok then
warn("[JR] Erro ao carregar " .. SCRIPT_FILE .. ": " .. tostring(err))
end
