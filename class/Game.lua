local class = require 'class/middleclass'

local Map 	= require "class/Map"
local Perso = require "class/Perso"

local Game = class('Game')

function Game:initialize(rand)

	self.map 	= Map:new("map/map1.json","map/tileset.png")
	math.randomseed(os.time())
	for x = 0,self.map.LX-1 do
		for y = 0, self.map.LY-1 do
			if (self.map.layers[2].data[x][y]==5) and (math.random() < rand) then
				if 	(x==1 and y==1) or (x==2 and y==1) or (x==1 and y==2) or 
					(x==self.map.LX-2 and y==self.map.LY-2) or (x==self.map.LX-3 and y==self.map.LY-2) or (x==self.map.LX-2 and y==self.map.LY-3) then
					
				else
					self.map:setTile(x,y,2,2)
				end
			end
		end
	end

	self.perso 	= {}

	self.perso[1] = Perso:new(1*64, 1*64, self);
	self.perso[2] = Perso:new(19*64,19*64, self);

end

function Game:update(dt)
	for k,v in ipairs(self.perso) do
		v:update(dt)
	end
	if love.keyboard.isDown("up") then
		self.perso[1]:up()
	elseif love.keyboard.isDown("down") then
		self.perso[1]:down()
	elseif love.keyboard.isDown("left") then
		self.perso[1]:left()
	elseif love.keyboard.isDown("right") then
		self.perso[1]:right()
	end

	if love.keyboard.isDown("w") then
		self.perso[2]:up()
	elseif love.keyboard.isDown("s") then
		self.perso[2]:down()
	elseif love.keyboard.isDown("a") then
		self.perso[2]:left()
	elseif love.keyboard.isDown("d") then
		self.perso[2]:right()
	end
end

function Game:draw()

	self.map:draw(0,0)
	for k,v in ipairs(self.perso) do
		v:draw()
	end
end

return Game