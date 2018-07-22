local Tetros = require("tetros")
local grid = {}
grid.offsetX = 0
grid.height = 20
grid.width = 10
grid.cellSize = 0
grid.cells = {}

function grid.load()
    local h = hauteur / grid.height
    grid.cellSize = h
    grid.offsetX = largeur / 2 -(grid.cellSize * grid.width)/2
    grid.offsetY = 0


    for l=1,grid.height do
        grid.cells[l] = {}
        for c=1,grid.width do
            grid.cells[l][c] = 0
        end
    end
end

function grid.draw()
    local h = grid.cellSize
    local w = h

    local x,y
    love.graphics.setColor(1, 1, 1, 0.5)
    for l=1,grid.height do
        for c=1,grid.width do
            x = (c-1)*w
            y = (l-1)*h
            x = x + grid.offsetX
            y = y + grid.offsetY
            local id = grid.cells[l][c]
            if id == 0 then
                love.graphics.setColor(1, 1, 1, 0.5)
            else
                local color = Tetros[id].color
                love.graphics.setColor (color[1],color[2],color[3],1)
            end
            love.graphics.rectangle("fill", x, y, w-1, h-1)
        end
    end



end

return grid

