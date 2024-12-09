-- Exe
local GameID = game.PlaceId

-- Games
local Supported_Games = {
    LegendsOfSpeed_City = 3101667897,
    LegendsOfSpeed_Space = 3232996272,
    LegendsOfSpeed_Desert = 3276265788,
}

-- Script
if GameID == Supported_Games.LegendsOfSpeed_City
or GameID == Supported_Games.LegendsOfSpeed_Space 
or GameID == Supported_Games.LegendsOfSpeed_Desert then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VyrosDev/Vyros-Hub/refs/heads/main/LegendsOfSpeed.lua"))()
elseif GameID == Supported_Games.MuscleLegends then
else
    warn("Oops! This game is not supported yet. We are working to add more!")
end
