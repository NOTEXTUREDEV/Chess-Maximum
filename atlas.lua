local atlas = {}

local lg = love.graphics
lg.setDefaultFilter("nearest","nearest")
atlas.png = lg.newImage('assets/atlas.png')
atlas.sx,atlas.sy = atlas.png:getDimensions()

atlas.chessboard = lg.newQuad(0,0,8,8,atlas.sx,atlas.sy)
atlas.white_p = lg.newQuad(8,0,14,23,atlas.sx,atlas.sy)
atlas.black_p = lg.newQuad(22,0,14,23,atlas.sx,atlas.sy)

return atlas