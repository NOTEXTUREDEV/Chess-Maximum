function love.load()
    -- require all files
    bl = require('betterlove')
    atlas = require('atlas')
    chess = require('chess')

    love.window.setFullscreen(true)
    chess.piece.new("b3","p","black")
    chess.piece.new("h8","p","white")
end

function love.draw()
    bl.drawImage(atlas.chessboard,0,0,0,100,100)
    for i, p in pairs(chess.pieces) do
        p:get_legal_moves()
        for i, legal_move in pairs(p.legal_moves) do
            local row, col = acn_convert(legal_move)
            love.graphics.rectangle("fill",(col * 100) - 100,(row * 100 - 100),100,100)
        end

        p:draw()
    end
end