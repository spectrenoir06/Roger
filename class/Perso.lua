local class 	= require 'class/middleclass'
local Sprite 	= require 'class/Sprite'

local Perso = class('Perso')

function Perso:initialize(posX, posY, game)
  	
  	self.posX =  posX or 64
  	self.posY =  posY or 64
  	self.speed = 200


	self.dX = 0
	self.dY = 0

	self.lX = 64
	self.lY = 64

	self.sprite = Sprite:new("texture/sprite.png", 64, 64)
	self.direction = 2

	self.game = game

	self.sprite:addAnimation({9,10,11})
	self.sprite:addAnimation({0,1,2})
	self.sprite:addAnimation({3,4,5})
	self.sprite:addAnimation({6,7,8})

end

function Perso:draw()
	self.sprite:draw(self.posX, self.posY)
end

function Perso:update(dt)
	
	self.sprite:update(dt)
	--print(self:col(0,0))
	if self.move then
		if self.direction == 1 then
          	self.posY 	= self.posY - 8
           	self.pixel	= self.pixel + 8
        elseif self.direction == 2 then
          	self.posY 	= self.posY + 8
           	self.pixel	= self.pixel + 8
       	elseif self.direction == 3 then
           	self.posX 	= self.posX - 8
          	self.pixel 	= self.pixel + 8
      	elseif self.direction == 4 then
          	self.posX 	= self.posX + 8
           	self.pixel	= self.pixel + 8
      	end
       	if self.pixel == 64 then
       		--print(self:col(0,0))
         	self.move = false
       	end
    end
end

function Perso:col(x, y)
	return self.game.map.layers[2].data[(self.posX/64)+x][(self.posY/64)+y]
end

function Perso:up()
	if not self.move then
		if self.direction == 1 and self:col(0,-1)==5 then
			self.move = true
			self.pixel = 0
		else
			self.sprite:setAnim(1)
			self.direction = 1
		end
	end
end

function Perso:down()
	if not self.move then
		if self.direction == 2 and self:col(0,1)==5 then
			self.move = true
			self.pixel = 0
		else
			self.sprite:setAnim(2)
			self.direction = 2
		end
	end
end

function Perso:left()
	if not self.move then
		if self.direction == 3 and self:col(-1,0)==5 then
			self.move = true
			self.pixel = 0
		else
			self.sprite:setAnim(3)
			self.direction = 3
		end
	end
end

function Perso:right()
	if not self.move then
		if self.direction == 4 and self:col(1,0)==5 then
			self.move = true
			self.pixel = 0
		else
			self.sprite:setAnim(4)
			self.direction = 4
		end
	end
end

function Perso:getPosX()
	return self.posX
end

function Perso:getPosY()
	return self.posX
end

return Perso