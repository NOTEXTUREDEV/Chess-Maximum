local chess = {}

chess.piece = {}
chess.piece.__index = chess.piece

chess.pieces = {}

require('betterlove')

function chess.piece.new(location,type,team)
    local self = setmetatable({},chess.piece)
    self.location = location or "a1"
    self.type = type or "p"
    self.team = team or "white"

    table.insert(chess.pieces,self)
end

function chess.piece:draw()
    local abc = "abcdefgh"
    local row = tonumber(string.sub(self.location,2,2))
    local col = abc:find(string.sub(self.location,1,1),1,true)

    local x = (col * 108) - 108
    local y = (row * 108) - 108
    bl.drawImage(atlas[tostring(self.team) .. "_" .. tostring(self.type)],x,y,0,5,5)
end

return chess