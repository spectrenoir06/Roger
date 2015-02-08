ville = {}
local class = require 'class/middleclass'
local Gamestate = require 'class/gamestate'

local ffi = require("ffi")

function ville:enter()
    tab = {}
    tab.batiment1 = love.graphics.newImage("texture/buildings/castle1.png")
    tab.batiment2 = love.graphics.newImage("texture/buildings/tower1.png")
    tab.batiment3 = love.graphics.newImage("texture/buildings/farm2.png")
    tab.sablier = love.graphics.newImage("texture/buildings/hourglass.png")
    temp2 = os.time() + 666 * 3600
    love.graphics.setNewFont(18)



    ffi.cdef[[
        int MessageBoxA(void *w, const char *txt, const char *cap, int type);
    ]]

    ffi.C.MessageBoxA(nil, "Hello world!", "Test", 0)

end

function ville:update(dt)

end

function ville:draw()
    love.graphics.setBackgroundColor( 39, 53, 53)
    love.graphics.draw(tab.batiment1, 0, 0)
    love.graphics.draw(tab.batiment2, 0, 200)
    love.graphics.draw(tab.batiment3, 0, 400)
    love.graphics.draw(tab.sablier, 0, 400)
    love.graphics.print(os.date("%X",temp2 - os.time()), 0,0)

end

function ville:keypressed(key)
    print(key)
    if (key == ' ') then
        Gamestate.push(jeu)
    elseif key == 'escape' then
        love.event.quit()
    end
end
