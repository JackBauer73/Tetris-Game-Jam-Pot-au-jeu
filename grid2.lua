local grid2 = {}
grid2.offsetX = 0
grid2.height = 10
grid2.width = 20
grid2.cellSize = 0
grid2.cells = {}

function grid2.load()
    local h = largeur / grid2.height
    grid2.cellSize = h
    grid2.offsetX = largeur / 2 -(grid2.cellSize * grid2.width)/2
    grid2.offsetY = 0

    for l=1,grid2.height do
        grid2.cells[l] = {}
        for c=1,grid2.width do
            grid2.cells[l][c] = 0
        end
    end
end