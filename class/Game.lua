local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Batiment = require "class/Batiment"

local Game = class('Game')

function Game:initialize()
	self.map = Map:new("map/1.json","tileset.png")
	self.batiments = {}
end

function Game:update(dt)

end

function Game:draw()
	self.map:draw(0,0)

	for k,v in ipairs(self.batiments) do
		print(k,v)
		v:draw()
	end
end

function Game:newBatiment(x,y)
	x2 = math.floor(x / 32)
	y2 = math.floor(y / 32)
	local bat = Batiment:new(x2 * 32,y2 * 32)
	table.insert(self.batiments, bat)
end

return Game
