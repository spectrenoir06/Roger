ville = {}
local class = require 'class/middleclass'
local Gamestate = require 'class/gamestate'

tab = {}

function ville:enter()
    tab[1] = {text = love.graphics.newImage("texture/buildings/castle1.png"), name = "Castle", level = 1, prix = "100$"}
    tab[2] = {text = love.graphics.newImage("texture/buildings/tower1.png"), name = "Tower", level = 1, prix = "in progress"}
    tab[3] = {text = love.graphics.newImage("texture/buildings/farm2.png"), name = "Farm", level = 2, prix = "300$"}
    tab.sablier = love.graphics.newImage("texture/buildings/hourglass.png")
    temp2 = os.time() + 666 * 3600
    love.graphics.setNewFont(18)
end

function ville:update(dt)

end

function ville:draw()

    --print(tab.name)
    for k,v in ipairs(tab) do
        print(k,v)
        love.graphics.draw(v.text, 0, (k-1)*200)
        love.graphics.print(v.name.."  Level: "..v.level, 200, (k-1) *200 + 50)
        love.graphics.print("Upgrade: "..v.prix, 200, (k-1) *200 + 75)
    end
    love.graphics.setBackgroundColor( 39, 53, 53)
    love.graphics.draw(tab.sablier, 0, 200)
    love.graphics.print(os.date("%X",temp2 - os.time()), 200,300)

end

function ville:keypressed(key)
    print(key)
    if (key == ' ') then
        Gamestate.push(jeu)
    elseif key == 'escape' then
        love.event.quit()
    end
end
