local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Batiment = require "class/Batiment"

local Game = class('Game')

function Game:initialize()
	local a = {}
	a.map = Map:new("map/1.json","tileset.png")
	a.batiments = {}
	return setmetatable(a, Game)
end

function Game:update(dt)

end

function Game:draw()
	self.map:draw(0,0)

	---for k,v in ipairs(self.batiments) do
	--	print(k,v)
	--	v.draw()
	--end
end

function Game:newBatiment(x,y)
	table.insert(self.batiments, Batiment:new(x,y))
end

return Game
