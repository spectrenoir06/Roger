local Map = require "class/Map"

function love.load()
	myMap = Map:new("map/1.json","tileset.png") -- create new map
end

function love.draw()

end

function love.update(dt)

end

function love.mousepressed(x,y,button)

end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	else
		print(key)
	end
end
