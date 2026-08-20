local chess = {}

-- setup of OOP
chess.piece = {}
chess.piece.__index = chess.piece

chess.pieces = {}

require('betterlove')
require('atlas')

-- converts the algebraic chess notation into a row and column variables
-- or the other way around
function acn_convert(...)
    local inputs = {...}
    local abc = "abcdefgh"

    if type(inputs[1]) == "string" then
        local row = tonumber(string.sub(inputs[1],2,2))
        local col = abc:find(string.sub(inputs[1],1,1),1,true)

        return row, col
    else
        local letter = string.sub(abc,inputs[2],inputs[2])
        local number = tostring(inputs[1])
        local acn =  letter .. number

        return acn
    end
end

-- makes a new piece
function chess.piece.new(location,type,team)
    local self = setmetatable({},chess.piece)
    self.location = location or "a1"
    self.type = type or "p"
    self.team = team or "white"
    self.legal_moves = {}

    table.insert(chess.pieces,self)
end

-- gets legal moves and stores it in the legal_moves table
function chess.piece:get_legal_moves()
    for i, lm in pairs(self.legal_moves) do
        table.remove(self.legal_moves,i)
    end

    local row, col = acn_convert(self.location)
    table.insert(self.legal_moves,acn_convert(row + 1,col))
    table.insert(self.legal_moves,acn_convert(row - 1,col))
end

-- draws chess piece
function chess.piece:draw()
    local row, col = acn_convert(self.location)

    local asset = atlas[tostring(self.team) .. "_" .. tostring(self.type)]
    local xx, xy, sx, sy = asset:getViewport()

    local x = ((col * 100) + (25 - (sx / 2))) - 100
    local y = (row * 100) - 120

    bl.drawImage(asset,x,y,0,5,5)
end

return chess