local class = require 'class/middleclass'

local Batiment = class('Batiment')

function Batiment:initialize(x, y)
	local a = {}

	a.posX = x or 10
	a.posY = y or 10
	a.evolution = 1
	a.texture = love.graphics.newImage("batiment.png")
	return setmetatable(a, Batiment)
end

function Batiment:update(dt)

end

function Batiment:draw()
	love.graphics.draw(self.texture, 10, 10)
end


return Batiment
