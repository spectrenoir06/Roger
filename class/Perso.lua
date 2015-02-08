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

    self.life = 10

    self.keynb = 0
    self.sword1 = 0
    self.sword2 = 0
    self.sword3 = 0
    self.rubynb = 0
    self.coinnb = 0

end

function Perso:draw()
	self.sprite:draw(self.posX, self.posY)
end

function Perso:update(dt)

	-- self.sprite:update(dt)
	if self.move then
    self.isPlay = true
    self.sprite:update(dt)
    self.game.walkSound:play()
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
        self.game.walkSound:pause()
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

    self.game.map:setTile((self.posX/32)  ,(self.posY/32)-1,0,3)
    self.game.map:setTile((self.posX/32)+1,(self.posY/32)  ,0,3)
    self.game.map:setTile((self.posX/32)  ,(self.posY/32)+1,0,3)
    self.game.map:setTile((self.posX/32)-1,(self.posY/32)  ,0,3)
    self.game.map:setTile((self.posX/32)  ,(self.posY/32)  ,0,3)
    self.game.map:setTile((self.posX/32)+1,(self.posY/32)-1,0,3)
    self.game.map:setTile((self.posX/32)+1,(self.posY/32)+1,0,3)
    self.game.map:setTile((self.posX/32)-1,(self.posY/32)+1,0,3)
    self.game.map:setTile((self.posX/32)-1,(self.posY/32)-1,0,3)

    local tstu = self.game.map.layers[2].data[(self.posX/32)][(self.posY/32)-1]
    local tstr = self.game.map.layers[2].data[(self.posX/32)+1][(self.posY/32)]
    local tstd = self.game.map.layers[2].data[(self.posX/32)][(self.posY/32)+1]
    local tstl = self.game.map.layers[2].data[(self.posX/32)-1][(self.posY/32)]

    if (tstu ~= 2 and tstu ~= 3) then
        self.game.map:setTile((self.posX/32),(self.posY/32)-2,0,3)
    end

    if (tstr ~= 2 and tstr ~= 3) then
        self.game.map:setTile((self.posX/32)+2,(self.posY/32),0,3)
    end

    if (tstd ~= 2 and tstd ~= 3) then
        self.game.map:setTile((self.posX/32),(self.posY/32)+2,0,3)
    end

    if (tstl ~= 2 and tstl ~= 3) then
        self.game.map:setTile((self.posX/32)-2,(self.posY/32),0,3)
    end
end

function Perso:up()
	if not self.move then
		if self.direction == 1 and self:col(0,-1)~=2 and ((self:col(0,-1)==3 and self.keynb > 0) or self:col(0,-1)~=3) then
            if self:col(0,-1)==3 then
                self.keynb = self.keynb - 1
                self.game.map:setTile((self.posX/32),(self.posY/32) - 1,0,2)
                self.game.doorSound:play()
            end
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
		if self.direction == 2 and self:col(0,1)~=2 and ((self:col(0,1)==3 and self.keynb > 0) or self:col(0,1)~=3) then
            if self:col(0,1)==3 then
                self.keynb = self.keynb - 1
                self.game.map:setTile((self.posX/32),(self.posY/32) + 1,0,2)
                self.game.doorSound:play()
            end
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
		if self.direction == 3 and self:col(-1,0)~=2 and ((self:col(-1,0)==3 and self.keynb > 0) or self:col(-1,0)~=3) then
            if self:col(-1,0)==3 then
                self.keynb = self.keynb - 1
                self.game.map:setTile((self.posX/32) - 1,(self.posY/32),0,2)
                self.game.doorSound:play()
            end
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
		if self.direction == 4 and self:col(1,0)~=2 and ((self:col(1,0)==3 and self.keynb > 0) or self:col(1,0)~=3) then
            if self:col(1,0)==3 then
                self.keynb = self.keynb - 1
                self.game.map:setTile((self.posX/32) + 1,(self.posY/32),0,2)
                self.game.doorSound:play()
            end
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

function Perso:die()
  print("NOOB")
  love.event.quit()
end

function Perso:attack(monster)
  --print(self.direction)
  local mDefense, mAttack, pAttack
  pAttack = self.sword1 + self.sword2 * 2 + self.sword3 * 4
  if monster == 0 then
    mDefense = math.random(0, 2)
    mAttack = 1
  elseif monster == 1 then
    mDefense = math.random(5, 8)
    mAttack = math.random(1, 3)
  elseif monster == 2 then
    mDefense = math.random(8, 12)
    mAttack = math.random(3, 6)
  elseif monster == 2 then
    mDefense = math.random(12, 16)
    mAttack = math.random(6, 8)
  end

  if pAttack > mDefense then
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    if math.random(0,5) == 0 then
      self.keynb = self.keynb + 1
    else
      self.coinnb = self.coinnb + 1
    end
    self.game.swordSound:play()
  else
    self.life = self.life - mAttack
    self.move = false
    if self.direction == 1 then
      self.direction = 2
      self:down()
    elseif self.direction == 2 then
      self.direction = 1
      self:up()
    elseif self.direction == 3 then
      self.direction = 4
      self:right()
    elseif self.direction == 4 then
      self.direction = 3
      self:left()
    end
    if self.life <= 0 then
      self:die()
    end
  end
end

function Perso:stop()
  self:unfog()
  print(self:getCase())
  local sol, mur = self:getCase()
  if sol == 10 then               -- escalier
    self.game:nextMap()
  elseif mur == 6 then            -- clef
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.keynb = self.keynb + 1
  elseif mur == 7 then            -- epee 1
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.sword1 = self.sword1 + 1
    self.game.swordSound:play()
  elseif mur == 8 then            -- epee 2
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.sword2 = self.sword2 + 1
    self.game.swordSound:play()
  elseif mur == 9 then            -- epee 3
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.sword3 = self.sword3 + 1
    self.game.swordSound:play()
  elseif mur == 11 then            -- ruby
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.rubynb = self.rubynb + 1
  elseif mur == 12 then            -- coin
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.coinnb = self.coinnb + 1
    self.game.coinSound:play()
  elseif mur == 13 then            -- treasure
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.coinnb = self.coinnb + 10
    self.game.coinSound:play()
  elseif mur == 14 then            -- heart
    self.game.map:setTile(self.posX/32, self.posY/32, 0, 2)
    self.life = self.life + 1
  elseif mur >= 20 and mur <= 22 then
    self:attack(mur - 20)
  end
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
