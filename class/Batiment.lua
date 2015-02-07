local class = require 'class/middleclass'

local Batiment = class('Batiment')

function Batiment:initialize(x,y)
	self.posX = x
	self.posY = y
	self.evolution = 1
	self.texture = love.graphics.newImage("batiment.png")
end


function Batiment:draw()
	print(self)
	love.graphics.draw(self.texture, self.posX, self.posY)
end

function Batiment:update(dt)

end

return Batiment
