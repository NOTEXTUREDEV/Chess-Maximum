function love.load()
    local lg = love.graphics

    bl = require('betterlove')
    atlas = require('atlas')

    love.window.setFullscreen(true)
end

function love.draw()
    bl.drawImage(atlas.chessboard,0,0,0,108,108)
    bl.drawImage(atlas.white_pawn,0,0,0,5,5)
end