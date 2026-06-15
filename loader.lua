if not game:IsLoaded() then
game.Loaded:Wait()
end

local BASE_URL = "https://raw.githubusercontent.com/amarildojuniorpereiraalvez-create/JUNITO/refs/heads/main"
local SCRIPT_FILE = "animeastral.lua"

local url = BASE_URL .. "/" .. SCRIPT_FILE

print("[JR] Carregando:", url)

local ok, err = pcall(function()
loadstring(game:HttpGet(url))()
end)

if not ok then
warn("[JR] Erro:", tostring(err))
end
