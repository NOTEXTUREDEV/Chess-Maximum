function love.load()
    -- require all files
    lg = love.graphics

    bl = require('betterlove')
    atlas = require('atlas')
    chess = require('chess')

    love.window.setFullscreen(true)
    chess.piece.new("b3","p","black")
    chess.piece.new("h8","n","white")
end

function love.mousepressed(x,y,button)
    if button ~= 1 then return end

    for i, p in pairs(chess.pieces) do
        p:get_legal_moves()

        for o, lm in pairs(p.legal_moves) do
            local row, col = acn_convert(lm)

            if bl.checkCollision(x,y,1,1,(col * 100) - 100,(row * 100 - 100),100,100) then
                p:change_location(lm)
                p:change_move_count()
            end
        end
    end
end

function love.draw()
    love.graphics.setColor(1,1,1)
    bl.drawImage(atlas.chessboard,0,0,0,100,100)

    for i, p in pairs(chess.pieces) do
        p:get_legal_moves()

        lg.setColor(1,1,1)
        for i, lm in pairs(p.legal_moves) do
            local row, col = acn_convert(lm)
            lg.rectangle("fill",(col * 100) - 100,(row * 100 - 100),100,100)
        end

        lg.setColor(1,1,1)
        p:draw()
    end
end