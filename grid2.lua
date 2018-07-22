local grid2 = {}
grid2.offsetX = 0
grid2.height = 10
grid2.width = 20
grid2.cellSize = 0
grid2.cells = {}

function grid2.load()
    local w = largeur / grid2.width
    grid2.cellSize = w
    grid2.offsetX = largeur
    grid2.offsetY = hauteur / 2 -(grid2.cellSize * grid2.height)/2

    for l=1,grid2.width do
        grid2.cells[l] = {}
        for c=1,grid2.height do
            grid2.cells[l][c] = 0
        end
    end
end

function grid2.draw()
    local w = grid2.cellSize
    local h = w

    local x,y
    love.graphics.setColor(1, 1, 1, 0.5)
    for l=1,grid2.width do
        for c=1,grid2.height do
            x = (c-1)*h
            y = (l-1)*w
            x = x + grid2.offsetX
            y = y + grid2.offsetY
            local id = grid2.cells[l][c]
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

return grid2