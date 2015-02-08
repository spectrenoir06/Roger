jeu = {}
local Gamestate = require 'class/gamestate'
local class = require 'class/middleclass'
local Game = require "class/Game"

function jeu:init()
    game = Game:new(1)
end

function jeu:update(dt)
    game:update(dt)
end

function jeu:draw()
    game:draw()
end

function jeu:quit()
    game.music:stop()
    keynb = self.keynb
    sword1 = self.sword1
    sword2 = self.sword2
    sword3 = self.sword3
    rubynb = self.rubynb
    coinnb = self.coinnb
    game.walkSound:stop()
    Gamestate.pop()
end

function jeu:keypressed(key)
    if key == 'escape' then
        self:quit()
    else
        print(key)
        game:keypressed(key)
    end
end
