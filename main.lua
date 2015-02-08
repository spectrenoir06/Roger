local Gamestate = require 'class/gamestate'
local jeu = require 'gamestate/jeu'

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(jeu)
end
