local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Batiment = require "class/Batiment"
local Perso = require "class/Perso"

local Game = class('Game')

function Game:initialize(i)
	self.map = Map:new("map/"..i..".json","map/tileset.png")
	self.perso = Perso:new(3*32, 12*32, self)
	self.imgKey = love.graphics.newImage("texture/key.png")
	self.imgSword1 = love.graphics.newImage("texture/sword1.png")
	self.imgSword2 = love.graphics.newImage("texture/sword2.png")
	self.imgSword3 = love.graphics.newImage("texture/sword3.png")
	self.imgRuby = love.graphics.newImage("texture/ruby.png")
	self:soundInit()
	self:initPerso()
	self.mapNb = 1
end

function Game:soundInit()
	self.nxtlvlSound = love.audio.newSource("sfx/nxtl.wav", "static")
	self.nxtlvlSound:setVolume(0.5)

	self.music = love.audio.newSource("sfx/dungeon.ogg", "static")
	self.music:setVolume(0.8)
	self.music:setLooping(true)
	self.music:play()

	self.walkSound = love.audio.newSource("sfx/walk.mp3", "static")
	self.swordSound = love.audio.newSource("sfx/sword.mp3", "static")
	self.coinSound = love.audio.newSource("sfx/coin.wav", "static")
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
	-- love.graphics.print( "Key : "..self.perso.keynb.."  Bonus : "..self.perso.attbon.." level : "..self.mapNb, 10, 10)
	for i = 1, self.perso.keynb do
		love.graphics.draw(self.imgKey, i * 24 - 24, 2)
	end
	for i = 1, self.perso.sword1 do
		love.graphics.draw(self.imgSword1, i * 24 - 24, 62)
	end
	for i = 1, self.perso.sword2 do
		love.graphics.draw(self.imgSword2, i * 24 - 24, 122)
	end
	for i = 1, self.perso.sword3 do
		love.graphics.draw(self.imgSword3, i * 24 - 24, 182)
	end
	for i = 1, self.perso.rubynb do
		love.graphics.draw(self.imgRuby, i * 24 - 24, 242)
	end
	-- love.graphics.draw(self.imgSword, 80, 2)
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
