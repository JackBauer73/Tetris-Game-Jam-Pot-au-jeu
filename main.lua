-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

Tetros = require "tetros"

local currentTetros = 1
local currentRotation = 1

function love.load()
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
end

function love.update(dt)

end

function love.draw()
    local Shape = Tetros[currentTetros][currentRotation]
    for l = 1,#Shape do 
        for c = 1,#Shape[l] do
            x = (c-1)*32
            y=  (l-1)*32
            if Shape[l][c] == 1 then
                love.graphics.rectangle("fill", x, y, 31, 31)
            end
        end
    end
end

function love.keypressed(key)

    if key == "space" then
        if currentRotation == nil then
        currentRotation = 1
            if currentTetros == nil then
                currentTetros = 1
            end
        end
            currentRotation = currentRotation + 1
    end


  
end