local Gamestate = require 'class/gamestate'
require 'gamestate/jeu'
require 'gamestate/ville'

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(ville)
end
