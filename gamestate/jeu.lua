local jeu = {}
local class = require 'class/middleclass'
local Game = require "class/Game"
local Gamestate = require "class/gamestate"

function jeu:enter()
    game = Game:new(1)
end

function jeu:update(dt)
    game:update(dt)
end

function jeu:draw()
    game:draw()
end

function jeu:keypressed(key)
    if key == 'escape' then
        love.event.quit()
    else
        print(key)
        game:keypressed(key)
    end
end

return jeu
