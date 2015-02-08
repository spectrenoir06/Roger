local Gamestate = require 'class/gamestate'
require 'gamestate/jeu'
require 'gamestate/ville'

keynb = 0
ssword1 = 0
sword2 = 0
sword3 = 0
rubynb = 0
coinnb = 0

function love.load()
	Gamestate.registerEvents()
	Gamestate.switch(ville)
end
