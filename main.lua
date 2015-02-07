local class = require 'class/middleclass'
local Game = require "class/Game"
local Batiment = require "class/Batiment"

texture = love.graphics.newImage("batiment.png")

function love.load()
	game = Game:new()
end

function love.draw()
	game:draw()
end

function love.update(dt)
	print(dt)
	game:update(dt)
end

function love.mousepressed(x,y,button)
	print(x,y,button)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	else
		print(key)
		game:keypressed(key)
	end
end
