local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Batiment = require "class/Batiment"

local Game = class('Game')

function Game:initialize()
	self.map = Map:new("map/1.json","tileset.png")
	--self.batiments = {Batiment:new()}
end

function Game:update(dt)

end

function Game:draw()
	self.map:draw(0,0)
	--self.batiments[1]:draw()
end

function Game:newBatiment()
	--table.insert(self.batiments, Batiment:new())
end

return Game
