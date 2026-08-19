function love.load()
    local lg = love.graphics

    bl = require('betterlove')
    atlas = require('atlas')
    chess = require('chess')

    love.window.setFullscreen(true)
    chess.piece.new("a8","p","black")
    chess.piece.new("h8","p","white")
end

function love.draw()
    bl.drawImage(atlas.chessboard,0,0,0,108,108)
    for i, p in pairs(chess.pieces) do
        p:draw()
    end
end