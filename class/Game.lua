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

	---for k,v in ipairs(self.batiments) do
	--	print(k,v)
	---	v.test()
	--end
end

function Game:newBatiment(x,y)
	local bat = Batiment:new(x,y)
	table.insert(self.batiments, bat)
end

return Game
