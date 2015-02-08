local ville = {}
local class = require 'class/middleclass'
local Gamestate = require "class.gamestate"


function ville:enter()

end

function ville:update(dt)

end

function ville:draw()

end

function ville:keypressed(key)
    print(key)
    if (key == ' ') then
        Gamestate.switch(jeu)
    elseif key == 'escape' then
        love.event.quit()
    end
end

return ville
