ville = {}
local class = require 'class/middleclass'
local Gamestate = require 'class/gamestate'

function ville:enter()
    batiment1 = love.graphics.newImage("texture/buildings/castle1.png")
    batiment2 = love.graphics.newImage("texture/buildings/windmill.png")

end

function ville:update(dt)

end

function ville:draw()
    --love.graphics.setBackgroundColor( 39, 53, 53)
    love.graphics.draw(batiment1, 0, 0)
    love.graphics.draw(batiment2, 201, 0)

end

function ville:keypressed(key)
    print(key)
    if (key == ' ') then
        Gamestate.push(jeu)
    elseif key == 'escape' then
        love.event.quit()
    end
end
