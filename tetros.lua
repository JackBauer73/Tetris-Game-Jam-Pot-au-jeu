local TetrosRect = {}

-- Forme rectangle
TetrosRect[1] = {
{
    {0,0,0,0},
    {0,0,0,0},
    {1,1,1,1},
    {0,0,0,0}
},
{
    {0,1,0,0},
    {0,1,0,0},
    {0,1,0,0},
    {0,1,0,0}
}
}
--- Forme Carre
TetrosRect[2] = {
{
    {0,0,0,0},
    {0,1,1,0},
    {0,1,1,0},
    {0,0,0,0}
}
}
-- Forme T
TetrosRect[3] = {
{
    {0,0,0},
    {1,1,1},
    {0,1,0}
},
{
    {0,1,0},
    {1,1,0},
    {0,1,0}
},
{
    {0,1,0},
    {1,1,1},
    {0,0,0}
},
{
    {0,1,0},
    {0,1,1},
    {0,1,0}
}
}
-- Forme L
TetrosRect[4] = {
{
    {0,0,0},
    {1,1,1},
    {1,0,0}
},
{
    {1,1,0},
    {0,1,0},
    {0,1,0},
},
{
    {0,0,1},
    {1,1,1},
    {0,0,0}
},
{
    {0,1,0},
    {0,1,0},
    {0,1,1}
}
}
-- Forme L inversé
TetrosRect[5] = {
{
    {0,0,0},
    {1,1,1},
    {0,0,1}
},
{
    {0,1,0},
    {0,1,0},
    {1,1,0}
},
{
    {1,0,0},
    {1,1,1},
    {0,0,0}
},
{
    {0,1,1},
    {0,1,0},
    {0,1,0}
}
}
-- Forme Z
TetrosRect[6] = {
{
    {0,0,0},
    {1,1,0},
    {0,1,1}
},
{
    {0,1,0},
    {1,1,0},
    {1,0,0}
}
}
-- Forme Z inversé
TetrosRect[7] = {
{
    {0,0,0},
    {0,1,1},
    {1,1,0}
},
{
    {1,0,0},
    {1,1,0},
    {0,1,0}
}
}
return TetrosRect
