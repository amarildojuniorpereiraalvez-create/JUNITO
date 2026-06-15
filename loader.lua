-- loader.lua
-- Coloque como LocalScript em:
-- StarterPlayer > StarterPlayerScripts

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CONFIG = {
	HUB_NAME = "JR",
	FULL_NAME = "Junioor",
	DISCORD_URL = "https://discord.gg/G2gMadWRRx",
	ICON_IMAGE = "rbxassetid://72031513619068"
}

local module = ReplicatedStorage:WaitForChild("animeastral", 10)

if not module then
	warn("[JR] ModuleScript 'animeastral' não encontrado no ReplicatedStorage.")
	return
end

local success, err = pcall(function()
	require(module)(CONFIG)
end)

if not success then
	warn("[JR] Erro ao carregar Anime Astral:", err)
end
