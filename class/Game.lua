local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Batiment = require "class/Batiment"
local Perso = require "class/Perso"

local Game = class('Game')

function Game:initialize(i)
	self.map = Map:new("map/"..i..".json","map/tileset.png")
	self.perso = Perso:new(3*32, 12*32, self)
	self:initPerso()
	self.nxtlvlSound = love.audio.newSource("sfx/0.wav", "static")
	self.mapNb = 1
end

function Game:initPerso()
	for y=0, self.map.layers[1].height-1 do
		for x=0, self.map.layers[1].width-1 do
			print(x,y,self.map.layers[1].data[x][y])
			if self.map.layers[1].data[x][y] == 4 then
				self.perso.posX = 32 * x
				self.perso.posY = 32 * y
				break
			end
		end
	end
	self.perso:unfog()
end

function Game:update(dt)
	self.perso:update(dt)
end

function Game:draw()
	self.map:draw(0,0)
	self.perso:draw()
	love.graphics.print( "Key : "..self.perso.keynb.."  level : "..self.mapNb, 10, 10)
end

function Game:nextMap()
	self.mapNb = self.mapNb + 1
	self.map = Map:new("map/"..self.mapNb..".json","map/tileset.png")
	self:initPerso()
	self.nxtlvlSound:play()
end

function Game:keypressed(key)

end

return Game
