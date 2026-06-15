if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE_URL = "https://raw.githubusercontent.com/amarildojuniorpereiraalvez-create/JUNITO/refs/heads/main"
local scriptFile = "animeastral.lua"

local url = BASE_URL .. "/" .. scriptFile

print("[JR] Tentando carregar:", url)

local ok, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if ok then
    print("[JR] Loader executado com sucesso")
else
    warn("[JR] Erro no loader:", err)
end
