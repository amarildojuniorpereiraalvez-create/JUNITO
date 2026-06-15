if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE_URL = "https://raw.githubusercontent.com/amarildojuniorpereiraalvez-create/JUNITO/refs/heads/main"
local SCRIPT_FILE = "animeastral.lua"

local HUB_NAME = "JR"

local url = BASE_URL .. "/" .. SCRIPT_FILE

print("[" .. HUB_NAME .. "] Tentando carregar:", url)

local ok, err = pcall(function()
    local source = game:HttpGet(url)

    if source:find("404: Not Found") then
        error("Arquivo animeastral.lua nao encontrado no GitHub.")
    end

    local fn, compileErr = loadstring(source)

    if not fn then
        error(compileErr)
    end

    fn()
end)

if ok then
    print("[" .. HUB_NAME .. "] Loader executado com sucesso.")
else
    warn("[" .. HUB_NAME .. "] Erro ao carregar " .. SCRIPT_FILE .. ": " .. tostring(err))
end
