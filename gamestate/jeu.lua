jeu = {}
local Gamestate = require 'class/gamestate'
local class = require 'class/middleclass'
local Game = require "class/Game"

function jeu:init()
    game = Game:new(1)
end

function jeu:enter(r_ville,item)
    ptr = item
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
    ptr.ruby = game.perso.rubynb
    ptr.coin = game.perso.coinnb
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
