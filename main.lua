local Gamestate = require 'class/gamestate'
 jeu = require 'gamestate/jeu'
 ville = require 'gamestate/ville'

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(ville)
end
