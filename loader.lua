```lua
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE_URL = "https://raw.githubusercontent.com/amarildojuniorpereiraalvez-create/JUNITO/refs/heads/main"

local GAMES = {
    [9797806474] = "animeastral.lua",
}

local gameId = game.GameId
local scriptFile = GAMES[gameId]

if not scriptFile then
    warn("[JR] Game não suportado. GameId: " .. tostring(gameId))
    return
end

local url = BASE_URL .. "/" .. scriptFile

print("[JR] Carregando:", url)

local ok, err = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not ok then
    warn("[JR] Erro ao carregar " .. scriptFile .. ": " .. tostring(err))
end
```
