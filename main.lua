local class = require 'class/middleclass'
local Game = require "class/Game"
local Batiment = require "class/Batiment"


function love.load()
	game = Game:new()
	--test = Batiment:new(10,10)
	texture = love.graphics.newImage("batiment.png")
end

function love.draw()
	game:draw()
	--love.draw(texture, 10, 10)
end

function love.update(dt)
	print(dt)
end

function love.mousepressed(x,y,button)
	print(x,y,button)
	--game:newBatiment(x,y)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	else
		print(key)
	end
end
