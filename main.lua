local class = require 'class/middleclass'
local Game = require "class/Game"
local Batiment = require "class/Batiment"


function love.load()
	game = Game:new()
end

function love.draw()
	game:draw()
end

function love.update(dt)
	print(dt)
end

function love.mousepressed(x,y,button)
	print(x,y,button)
	game:newBatiment(x,y)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	else
		print(key)
	end
end
