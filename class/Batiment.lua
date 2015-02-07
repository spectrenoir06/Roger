local class = require 'class/middleclass'

local Batiment = class('Batiment')

function Batiment:initialize()
	self.posX = x or 10
	self.posY = y or 10
	self.evolution = 1
	self.texture = love.graphics.newImage("batiment.png")
end


function Batiment:test()
	print(self)
	love.graphics.draw(texture, self.x, self.y)
end

function Batiment:update(dt)

end



return Batiment
