ville = {}
local class = require 'class/middleclass'
local Gamestate = require 'class/gamestate'

tab = {}

function ville:init()
    tab[1] = {text = love.graphics.newImage("texture/buildings/castle1.png"), name = "Castle", level = 1, prix = "100$", time=0}
    tab[2] = {text = love.graphics.newImage("texture/buildings/tower1.png"), name = "Tower", level = 1, prix = "in progress", time=os.time() + 5844 - (3660)}
    tab[3] = {text = love.graphics.newImage("texture/buildings/farm2.png"), name = "Farm", level = 2, prix = "300$", time=0}
    screw = love.graphics.newImage("texture/buildings/screw.png")
    tab.sablier = love.graphics.newImage("texture/buildings/hourglass.png")
    tab.savings = love.graphics.newImage("texture/buildings/saving.png")
    tab.ruby = love.graphics.newImage("texture/buildings/ruby.PNG")
    temp2 = os.time() + 5844 - (3660)
    love.graphics.setNewFont(18)
end

function ville:update(dt)

end

function ville:draw()

    --print(tab.name)
    for k,v in ipairs(tab) do
        --print(k,v)
        love.graphics.draw(v.text, 0, (k-1)*200)
        love.graphics.print(v.name.."  Level: "..v.level, 200, (k-1) *200 + 50)
        love.graphics.print("Upgrade: "..v.prix, 200, (k-1) *200 + 75)
        if (v.prix ~= "in progress") then
            love.graphics.draw(screw, 240, (k-1)*200 + 100)
        else
            love.graphics.draw(tab.sablier, 0, (k-1)*200)
            love.graphics.print(os.date("%X",v.time - os.time()), 200,(k-1)*200 + 100)
            love.graphics.draw(tab.ruby, 425, (k-1)*200+50)
            love.graphics.draw(tab.savings, 425, (k-1)*200+100)
        end

    end
    love.graphics.setBackgroundColor( 39, 53, 53)
end

function ville:mousepressed(x,y,button)
    print(x,y,button)
    if (x>= 240 and x < (240+100) and (y>=100 and y<=200 )) then
        tab[1].prix="in progress"
        tab[1].time = os.time() + 12674 - (3660)
    end
    if (x>= 425 and x < (425+100) and (y>=50 and y<=100 )) then
        tab[1].prix="500$"
        tab[1].text=love.graphics.newImage("texture/buildings/castle2.png")
        tab[1].level=2
        tab[1].time=0
    end

end

function ville:keypressed(key)
    print(key)
    if (key == ' ') then
        Gamestate.push(jeu)
    elseif key == 'escape' then
        love.event.quit()
    end
end
