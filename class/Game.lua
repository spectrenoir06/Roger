local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Batiment = require "class/Batiment"
local Perso = require "class/Perso"

local Game = class('Game')

function Game:initialize()
	self.map = Map:new("map/1.json","tileset.png")
	self.perso = Perso:new(3*32, 12*32, self)
end

function Game:update(dt)
	self.perso:update(dt)
end

function Game:draw()
	self.map:draw(0,0)
	self.perso:draw()
end

function Game:keypressed(key)

end

return Game
