local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Batiment = require "class/Batiment"
local Perso = require "class/Perso"

local Game = class('Game')

function Game:initialize()
	self.map = Map:new("map/1.json","map/tileset.png")
	self.perso = Perso:new(3*32, 12*32, self)
	self:initPerso()
end

function Game:initPerso()
	for y=0, self.map.layers[1].height-1 do
		for x=0, self.map.layers[1].width-1 do
			print(x,y,self.map.layers[1].data[x][y])
			if self.map.layers[1].data[x][y] == 4 then
				self.map.layers[1].data[x][y] = 1
				self.perso.posX = 32 * x
				self.perso.posY = 32 * y
				break
			end
		end
	end
	self.perso:popUnfog()
	self.map:update(1)
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
