local TetrosRect = {}

-- Forme rectangle
TetrosRect[1] = {}
TetrosRect[1].color = {0.93,0.29,0.95}
TetrosRect[1].shape ={ {
    {0,0,0,0},
    {0,0,0,0},
    {1,1,1,1},
    {0,0,0,0}},
    {
    {0,1,0,0},
    {0,1,0,0},
    {0,1,0,0},
    {0,1,0,0} }}
--- Forme Carre
TetrosRect[2] = {}
TetrosRect[2].color = {0.06,0.94,0.12}
TetrosRect[2].shape = { {
    {0,0,0,0},
    {0,1,1,0},
    {0,1,1,0},
    {0,0,0,0} } }
-- Forme T
TetrosRect[3] = {}
TetrosRect[3].color = {0.36,0.16,0.94}
TetrosRect[3].shape = { {
    {0,0,0},
    {1,1,1},
    {0,1,0} },{
    {0,1,0},
    {1,1,0},
    {0,1,0} }, {
    {0,1,0},
    {1,1,1},
    {0,0,0} }, {
    {0,1,0},
    {0,1,1},
    {0,1,0} } }
-- Forme L
TetrosRect[4] = {}
TetrosRect[4].color = {0.94,0.61,0.12}
TetrosRect[4].shape = { {
    {0,0,0},
    {1,1,1},
    {1,0,0} },{
    {1,1,0},
    {0,1,0},
    {0,1,0} },{
    {0,0,1},
    {1,1,1},
    {0,0,0} },{
    {0,1,0},
    {0,1,0},
    {0,1,1} } }
-- Forme L inversé
TetrosRect[5] = {}
TetrosRect[5].color = {1,0,0}
TetrosRect[5].shape = { {
    {0,0,0},
    {1,1,1},
    {0,0,1} },{
    {0,1,0},
    {0,1,0},
    {1,1,0}},{
    {1,0,0},
    {1,1,1},
    {0,0,0}},{
    {0,1,1},
    {0,1,0},
    {0,1,0}}}
-- Forme Z
TetrosRect[6] = {}
TetrosRect[6].color = {0.05,0.75,0.96}
TetrosRect[6].shape = {{
    {0,0,0},
    {1,1,0},
    {0,1,1}},{
    {0,1,0},
    {1,1,0},
    {1,0,0}}}
-- Forme Z inversé
TetrosRect[7] = {}
TetrosRect[7].color = {0.96,0.96,0.14}
TetrosRect[7].shape = {{
    {0,0,0},
    {0,1,1},
    {1,1,0}},{
    {1,0,0},
    {1,1,0},
    {0,1,0}}
}
return TetrosRect