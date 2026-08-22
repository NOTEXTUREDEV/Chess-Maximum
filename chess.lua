local chess = {}

-- setup of OOP
chess.piece = {}
chess.piece.__index = chess.piece

chess.pieces = {}

require('betterlove')
require('atlas')

-- converts the algebraic chess notation into a row and column variables,
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
    self.move_count = 0
    self.legal_moves = {}

    table.insert(chess.pieces,self)
end

function chess.piece:change_move_count()
    self.move_count = self.move_count + 1
end

function chess.piece:change_location(l)
    self.location = l
end

function chess.piece:add_legal_move(lm)
    if string.len(lm) ~= 2 then return end
    if tonumber(string.sub(lm,2,2)) > 8 then return end
    if tonumber(string.sub(lm,2,2)) < 1 then return end

    table.insert(self.legal_moves,lm)
end

-- gets legal moves and stores it in the legal_moves table
function chess.piece:get_legal_moves()
    for i, lm in pairs(self.legal_moves) do
        table.remove(self.legal_moves,i)
    end

    local row, col = acn_convert(self.location)
    self:add_legal_move(acn_convert(row,col + 1))
    if self.team == "black" then
        self:add_legal_move(acn_convert(row + 1,col))

        if self.move_count == 0 then
            self:add_legal_move(acn_convert(row + 2,col))
        end
    else
        self:add_legal_move(acn_convert(row - 1,col))

        if self.move_count == 0 then
            self:add_legal_move(acn_convert(row - 2,col))
        end
    end
end

-- draws chess piece
function chess.piece:draw()
    local row, col = acn_convert(self.location)

    local asset = atlas[tostring(self.team) .. "_" .. tostring(self.type)]
    local xx, xy, sx, sy = asset:getViewport()

    local x = ((col * 100) + (25 - (sx / 2))) - 100
    local y = (row * 100) - 100

    if self.type == "p" then
        y = y - 23
    else
        y = y - 10
    end

    bl.drawImage(asset,x,y,0,5,5)
end

return chess