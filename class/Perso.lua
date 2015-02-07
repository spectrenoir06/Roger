local class 	= require 'class/middleclass'
local Sprite 	= require 'class/Sprite'

local Perso = class('Perso')

function Perso:initialize(posX, posY, game)

  	self.posX =  posX or 64
  	self.posY =  posY or 64
  	self.speed = 200


	self.dX = 0
	self.dY = 0

	self.lX = 32
	self.lY = 32

	self.sprite = Sprite:new("texture/sprite.png", 32, 32)
  self.sprite:setAnim(4, 2)
  self.direction = 4

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

	-- self.sprite:update(dt)
	if self.move then
    self.isPlay = true
    self.sprite:update(dt)
		if self.direction == 1 then
          	self.posY 	= self.posY - 4
           	self.pixel	= self.pixel + 4
        elseif self.direction == 2 then
          	self.posY 	= self.posY + 4
           	self.pixel	= self.pixel + 4
       	elseif self.direction == 3 then
           	self.posX 	= self.posX - 4
          	self.pixel 	= self.pixel + 4
      	elseif self.direction == 4 then
          	self.posX 	= self.posX + 4
           	self.pixel	= self.pixel + 4
      	end
       	if self.pixel == 32 then
    --print(self:col(0,0))
            self.move = false
            self:stop()
       	end
    else
        if love.keyboard.isDown("up") then
            self:up()
        elseif love.keyboard.isDown("down") then
            self:down()
        elseif love.keyboard.isDown("left") then
            self:left()
        elseif love.keyboard.isDown("right") then
            self:right()
        end
    end
end

function Perso:col(x, y)
	return self.game.map.layers[2].data[(self.posX/32)+x][(self.posY/32)+y]
end

function Perso:unfog()
  -- self.game.map:setTile((self.posX/32)+3,(self.posY/32)  ,0,3)
  -- self.game.map:setTile((self.posX/32)+2,(self.posY/32)-1,0,3)
  -- self.game.map:setTile((self.posX/32)+1,(self.posY/32)-2,0,3)
  -- self.game.map:setTile((self.posX/32)  ,(self.posY/32)-3,0,3)
  -- self.game.map:setTile((self.posX/32)+3,(self.posY/32)  ,0,3)
  -- self.game.map:setTile((self.posX/32)+2,(self.posY/32)+1,0,3)
  -- self.game.map:setTile((self.posX/32)+1,(self.posY/32)+2,0,3)
  -- self.game.map:setTile((self.posX/32)  ,(self.posY/32)+3,0,3)
  -- self.game.map:setTile((self.posX/32)-1,(self.posY/32)+2,0,3)
  -- self.game.map:setTile((self.posX/32)-2,(self.posY/32)+1,0,3)
  -- self.game.map:setTile((self.posX/32)-3,(self.posY/32)  ,0,3)
  -- self.game.map:setTile((self.posX/32)-2,(self.posY/32)-1,0,3)
  -- self.game.map:setTile((self.posX/32)-1,(self.posY/32)-2,0,3)

  self.game.map:setTile((self.posX/32)  ,(self.posY/32)-2,0,3)
  self.game.map:setTile((self.posX/32)+1,(self.posY/32)-1,0,3)
  self.game.map:setTile((self.posX/32)+2,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32)+1,(self.posY/32)+1,0,3)
  self.game.map:setTile((self.posX/32)  ,(self.posY/32)+2,0,3)

  self.game.map:setTile((self.posX/32)-1,(self.posY/32)+1,0,3)
  self.game.map:setTile((self.posX/32)-2,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32)-1,(self.posY/32)-1,0,3)

  self.game.map:setTile((self.posX/32)  ,(self.posY/32)-1,0,3)
  self.game.map:setTile((self.posX/32)+1,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32)  ,(self.posY/32)+1,0,3)
  self.game.map:setTile((self.posX/32)-1,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32),(self.posY/32),0,3)
end

function Perso:popUnfog()
  -- self.game.map:setTile((self.posX/32)+3,(self.posY/32)  ,0,3)
  -- self.game.map:setTile((self.posX/32)+2,(self.posY/32)-1,0,3)
  -- self.game.map:setTile((self.posX/32)+1,(self.posY/32)-2,0,3)
  -- self.game.map:setTile((self.posX/32)  ,(self.posY/32)-3,0,3)
  -- self.game.map:setTile((self.posX/32)+3,(self.posY/32)  ,0,3)
  -- self.game.map:setTile((self.posX/32)+2,(self.posY/32)+1,0,3)
  -- self.game.map:setTile((self.posX/32)+1,(self.posY/32)+2,0,3)
  -- self.game.map:setTile((self.posX/32)  ,(self.posY/32)+3,0,3)
  -- self.game.map:setTile((self.posX/32)-1,(self.posY/32)+2,0,3)
  -- self.game.map:setTile((self.posX/32)-2,(self.posY/32)+1,0,3)
  -- self.game.map:setTile((self.posX/32)-3,(self.posY/32)  ,0,3)
  -- self.game.map:setTile((self.posX/32)-2,(self.posY/32)-1,0,3)
  -- self.game.map:setTile((self.posX/32)-1,(self.posY/32)-2,0,3)

  self.game.map:setTile((self.posX/32)  ,(self.posY/32)-2,0,3)
  self.game.map:setTile((self.posX/32)+1,(self.posY/32)-1,0,3)
  self.game.map:setTile((self.posX/32)+2,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32)+1,(self.posY/32)+1,0,3)
  self.game.map:setTile((self.posX/32)  ,(self.posY/32)+2,0,3)

  self.game.map:setTile((self.posX/32)-1,(self.posY/32)+1,0,3)
  self.game.map:setTile((self.posX/32)-2,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32)-1,(self.posY/32)-1,0,3)

  self.game.map:setTile((self.posX/32)  ,(self.posY/32)-1,0,3)
  self.game.map:setTile((self.posX/32)+1,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32)  ,(self.posY/32)+1,0,3)
  self.game.map:setTile((self.posX/32)-1,(self.posY/32)  ,0,3)
  self.game.map:setTile((self.posX/32),(self.posY/32),0,3)
end

function Perso:up()
	if not self.move then
		if self.direction == 1 and self:col(0,-1)~=2 and self:col(0,-1)~=3 then
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
		if self.direction == 2 and self:col(0,1)~=2 and self:col(0,1)~=3 then
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
		if self.direction == 3 and self:col(-1,0)~=2 and self:col(-1,0)~=3 then
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
		if self.direction == 4 and self:col(1,0)~=2 and self:col(1,0)~=3 then
			self.move = true
			self.pixel = 0
		else
			self.sprite:setAnim(4)
			self.direction = 4
		end
	end
end

function Perso:useBlock(x, y, block)

end

function Perso:stop()
    self:unfog()
    print(self:getCase())
end

function Perso:getPosX()
	return self.posX
end

function Perso:getPosY()
	return self.posX
end

function Perso:getCase()
    return self.game.map.layers[1].data[self.posX/32][self.posY/32], self.game.map.layers[2].data[self.posX/32][self.posY/32]
end

return Perso
