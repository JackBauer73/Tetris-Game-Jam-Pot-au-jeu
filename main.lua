-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

Tetros = require "tetros"
Grids = require "grid"

local currentTetros = {}
currentTetros.shapeid = 1
currentTetros.rotation = 1
currentTetros.position = {x = 0, y = 0}

local timerDrop = 0
local dropSpeed = 1


function SpawTetros()
    local new = love.math.random( 1,#Tetros)
    currentTetros.shapeid = new
    currentTetros.rotation = 1
    local tetrosWidht = #Tetros[currentTetros.shapeid].shape[currentTetros.rotation][1]
    currentTetros.position.x = (math.floor((Grids.width - tetrosWidht)/2)) + 1
    currentTetros.position.y = 1

    timerDrop = dropSpeed
end

function Transfert()
    local Shape = Tetros[currentTetros.shapeid].shape[currentTetros.rotation]
    for l = 1,#Shape do 
        for c = 1,#Shape[l] do
            local xGrid = (c-1) + currentTetros.position.x
            local yGrid = (l-1) + currentTetros.position.y
            if Shape[l][c] ~= 0 then
                Grids.cells[yGrid][xGrid] = currentTetros.shapeid
            end
        end
    end
end

function Collide()
    local Shape = Tetros[currentTetros.shapeid].shape[currentTetros.rotation]
    for l = 1,#Shape do 
        for c = 1,#Shape[l] do
            local xGrid = (c-1) + currentTetros.position.x
            local yGrid = (l-1) + currentTetros.position.y
            if Shape[l][c] == 1 then
                if xGrid <=0 or xGrid > Grids.width then
                    return true
                end
                if yGrid > Grids.height then
                    return true
                end
                if Grids.cells[yGrid][xGrid] ~= 0 then
                    return true
                end
            end
        end
    end
    return false
end

function RemoveLineGrid(pLigne)
    -- on remonte la grille vers le bas
    for l = pLigne,2,-1 do
        for c = 1,Grids.width do
            Grids.cells[l][c] = Grids.cells[l-1][c]
        end
    end

end

function love.load()
    love.window.setMode(640,640)
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()

    love.keyboard.setKeyRepeat(true)

    Grids.load()
    SpawTetros()

end

function love.update(dt)
    timerDrop = timerDrop - dt 
    if timerDrop <= 0 then
        currentTetros.position.y = currentTetros.position.y + 1
        timerDrop = dropSpeed
        if Collide() then
            currentTetros.position.y = currentTetros.position.y - 1
            Transfert()
            SpawTetros()
        end
    end
    --- Tester si la ligne est complete
    local bLigneComplete
    for l = 1,Grids.height do
        bLigneComplete = true
        for c = 1,Grids.width do
            if Grids.cells[l][c] == 0 then
                bLigneComplete = false
                break
            end
        end
        if bLigneComplete == true then
            RemoveLineGrid(l)
        end
    end
end

function DrawShape(pShape, pColor, pColumn, pLigne)
    love.graphics.setColor (pColor[1],pColor[2],pColor[3])
    for l = 1,#pShape do 
        for c = 1,#pShape[l] do
            local x = (c-1)* Grids.cellSize
            local y =  (l-1)* Grids.cellSize
            --- Ajouter la position de la pièce
            x = x + (pColumn - 1) * Grids.cellSize
            y = y + (pLigne - 1) * Grids.cellSize
            -- Ajouter à la position de grille
            x = x + Grids.offsetX
            -- Affichage de la cellule
            if pShape[l][c] == 1 then
                love.graphics.rectangle("fill", x, y, Grids.cellSize -1, Grids.cellSize -1)
            end
        end
    end
end

function love.draw()
    local Shape = Tetros[currentTetros.shapeid].shape[currentTetros.rotation]
    Grids.draw()
    DrawShape(Shape, Tetros[currentTetros.shapeid].color, currentTetros.position.x, currentTetros.position.y)
end

function love.keypressed(key)

    if key == "t" then
        currentTetros.rotation = 1
        currentTetros.shapeid = currentTetros.shapeid + 1
        if currentTetros.shapeid > #Tetros then
            currentTetros.shapeid = 1
        end
    end

    -- sauvegarde des positions current
    local oldX = currentTetros.position.x 
    local oldY = currentTetros.position.y
    local oldRotation = currentTetros.rotation

    if key =="right" then
        currentTetros.position.x = currentTetros.position.x + 1
    end
    if key =="left" then
        currentTetros.position.x = currentTetros.position.x - 1
    end
   
    if key =="up" then
        currentTetros.rotation = currentTetros.rotation + 1
        if currentTetros.rotation > #Tetros[currentTetros.shapeid].shape then
            currentTetros.rotation = 1
        end
    end
    if Collide() then
        currentTetros.position.x = oldX
        currentTetros.position.y = oldY
        currentTetros.rotation = oldRotation
    end
    if key == "down" then
        currentTetros.position.y = currentTetros.position.y + 1
        timerDrop = timerDrop + 1
    end
    if Collide() then
        currentTetros.position.y = oldY
        Transfert()
        SpawTetros()
    end



  
end